import Foundation
@testable import DeveloperCase

final class MockUserService: UserService {
    var mockUsers: [User] = []
    var shouldFail = false
    
    override func fetchUsers() async throws -> [User] {
        if shouldFail {
            throw NSError(domain: "MockError", code: -1)
        }
        return mockUsers
    }
    
    func setupMockUsers() {
        mockUsers = [
            User(id: 1,
                 name: "Test User 1",
                 username: "testuser1",
                 email: "test1@example.com",
                 address: Address(street: "Test St",
                                suite: "1A",
                                city: "Test City",
                                zipcode: "12345",
                                geo: Geo(lat: "40.7128",
                                       lng: "-74.0060")),
                 phone: "123-456-7890",
                 website: "test1.com",
                 company: Company(name: "Test Company",
                                catchPhrase: "Test Catch Phrase",
                                bs: "Test BS")),
            User(id: 2,
                 name: "Test User 2",
                 username: "testuser2",
                 email: "test2@example.com",
                 address: nil,
                 phone: nil,
                 website: nil,
                 company: nil)
        ]
    }
} 