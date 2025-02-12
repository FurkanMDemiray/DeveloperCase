//
//  DetailViewController.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import UIKit
import MapKit

final class DetailViewController: UIViewController {

    var viewModel: DetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    // MARK: - UI Elements
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var mailLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var userNameMailContainer: UIView!
    @IBOutlet private weak var firstAdressLine: UILabel!
    @IBOutlet private weak var secondAdressLine: UILabel!
    @IBOutlet private weak var adressContainer: UIView!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var companyContainer: UIView!
    @IBOutlet private weak var companyCatchPhraseLabel: UILabel!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAllUI()
        title = "User Detail"
    }

    // MARK: - Private Methods
    private func configureContainers() {
        let containers = [userNameMailContainer, adressContainer, companyContainer]

        for container in containers {
            guard let container else { return }
            container.layer.cornerRadius = 10
            container.layer.borderWidth = 1
            container.layer.borderColor = UIColor.lightGray.cgColor
            container.layer.shadowColor = UIColor.black.cgColor
            container.layer.shadowOpacity = 0.3
            container.layer.shadowOffset = .zero
            container.layer.shadowRadius = 2
        }
    }

    private func setUpNameMailContainerUI() {
        guard let user = viewModel.getUser else { return }

        nameLabel.text = user.name
        userNameLabel.text = "Username: \(user.username ?? "username")"
        mailLabel.text = "E-Mail: \(user.email ?? "email")"
        phoneLabel.text = "Phone: \(user.phone ?? "phone")"
        websiteLabel.text = "Website: \(user.website ?? "website")"
    }

    private func setUpAdressContainerUI() {
        guard let adress = viewModel.getUser?.address else { return }

        firstAdressLine.text = "\(adress.street ?? "street") Street, \(adress.suite ?? "suite")"
        secondAdressLine.text = "City: \(adress.city ?? "city"), Zipcode: \(adress.zipcode ?? "zipcode")"
    }

    private func setUpCompanyContainerUI() {
        guard let company = viewModel.getUser?.company else { return }

        companyNameLabel.text = "Company Name: \(company.name ?? "company")"
        companyCatchPhraseLabel.text = "Catch Phrase: \(company.catchPhrase ?? "error") \nBS: \(company.bs ?? "error")"
    }

    private func setMapView() {
        guard let lat = viewModel.getUser?.address?.geo?.lat,
            let lng = viewModel.getUser?.address?.geo?.lng,
            let latitude = Double(lat),
            let longitude = Double(lng) else { return }

        // Create coordinate
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        // Set region with zoom level
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)

        // Update map
        mapView.setRegion(region, animated: true)

        // Optional: Add a pin
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = viewModel.getUser?.name
        annotation.subtitle = viewModel.getUser?.address?.city
        mapView.addAnnotation(annotation)
    }

    private func configureAllUI() {
        configureContainers()
        setUpNameMailContainerUI()
        setUpAdressContainerUI()
        setUpCompanyContainerUI()
        setMapView()
    }

}

extension DetailViewController: DetailViewModelDelegate { }
