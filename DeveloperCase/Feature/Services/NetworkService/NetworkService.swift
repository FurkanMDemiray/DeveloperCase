//
//  APIService.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import Foundation

// MARK: - Network Errors
enum NetworkError: Error {
    // Comprehensive error cases for better error handling
    case invalidURL
    case noData
    case decodingError
    case invalidResponse
    case serverError(Int)
    case unknown
}

// MARK: - HTTP Methods
enum HTTPMethod: String {
    // Standard HTTP methods following RESTful conventions
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

// MARK: - Network Protocol
protocol NetworkServiceProtocol {
    // Generic request method supporting any Decodable type
    func request<T: Decodable>(_ endpoint: String,
        method: HTTPMethod,
        parameters: [String: Any]?,
        headers: [String: String]?,
        type: T.Type) async throws -> T
}

// MARK: - Network Implementation
final class NetworkService: NetworkServiceProtocol {
    // Base URL injected for flexibility and testing
    private let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    func request<T: Decodable>(_ endpoint: String,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil,
        type: T.Type) async throws -> T {

        guard let url = URL(string: baseURL + endpoint) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        // Add headers
        headers?.forEach { request.setValue($1, forHTTPHeaderField: $0) }

        // Add parameters for POST/PUT requests
        if let parameters = parameters, method != .get {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200...299:
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError
            }
        case 400...499:
            throw NetworkError.serverError(httpResponse.statusCode)
        case 500...599:
            throw NetworkError.serverError(httpResponse.statusCode)
        default:
            throw NetworkError.unknown
        }
    }
}
