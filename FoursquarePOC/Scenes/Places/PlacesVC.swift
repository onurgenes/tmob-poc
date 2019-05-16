//
//  PlacesVC.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

final class PlacesVC: BaseVC<PlacesVM, PlacesView, PlacesCoordinator> {
    
    private let cellId = "placesCell"
    var model: NearbyModel! {
        didSet {
            baseView.tableView.reloadData()
        }
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        definesPresentationContext = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        baseView.tableView.register(PlacesCell.self, forCellReuseIdentifier: cellId)
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
    }
}

extension PlacesVC: PlacesVMOutputProtocol {
    func failedGetVenueDetails(error: Error) {
        print(error)
        let ac = UIAlertController(title: "Error", message: "Unexpected error.\n\n \(error)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
    
    func didGetVenueDetails(details: VenueDetail) {
        
    }
}

extension PlacesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.response.venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? PlacesCell else { fatalError("CELL NOT FOUND") }
        let venue = model.response.venues[indexPath.row]
        cell.addressLabel.text = venue.location.address
        cell.countryLabel.text = venue.location.country
        cell.titleLabel.text = venue.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVenue = model.response.venues[indexPath.row]
//        viewModel.getVenueDetails(id: selectedVenue.id)
        coordinator?.openDetail()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}


