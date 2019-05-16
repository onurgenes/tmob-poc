//
//  MainVC.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit
import SwiftLocation

final class MainVC: BaseVC<MainVM, MainView, MainCoordinator> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main Page"
        
        baseView.searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        baseView.locationNameTextField.delegate = self
        baseView.typeTextField.delegate = self
    }
    
    @objc func searchTapped() {
        guard let type = baseView.typeTextField.text,
            type.count > 2
        else {
            let ac = UIAlertController(title: "Error", message: "Location name is too short.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(ac, animated: true)
            return
        }
        
        if let locationName = baseView.locationNameTextField.text, !locationName.isEmpty {
            viewModel.getNearbyPlaces(for: locationName, type: type)
        } else {
            viewModel.getNearbyPlacesWithCoordinates(type: type)
        }
        
    }
}

extension MainVC: MainVMOutputProtocol {
    func didGetNearby(places: NearbyModel) {
        coordinator?.openPlaces(model: places)
    }
    
    func failedGetNearby(error: Error) {
        let ac = UIAlertController(title: "Error", message: "Unexpected error.\n\n \(error)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
}

extension MainVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            let regEx = try NSRegularExpression(pattern: ".*[^A-Za-zĞÜŞİÖÇğüşiöçı ].*", options: [])
            if regEx.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("Something is wrong.")
        }
        return true
    }
}
