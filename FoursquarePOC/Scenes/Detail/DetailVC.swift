//
//  DetailVC.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit
import MapKit
import AlamofireImage

class DetailVC: BaseVC<DetailVM, DetailView, DetailCoordinator> {
    
    private let cellId = "detailCell"
    
    // This shouldn't be there but 4sq API doesn't allow me to make queries because of rate limit.
    // I didn't want to pay 99$ (:
    var lat: Double?
    var lon: Double?
    
    // This is what we want but Foursquare API doesn't allow ¯\_(ツ)_/¯
    var model: VenueDetail?
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        
        modalPresentationStyle = .overFullScreen
        transitioningDelegate = self
    }
    
    // for image download: prefix + "500x300" + suffix
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseView.effectView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissDetail)))
        baseView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
    }
    
    @objc func dismissDetail() {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailVC: DetailVMOutputProtocol {
    
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Some comment. The comments can be really really long. I had to test this with dummy data but cell is self sizing anyway."
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        
        let locationAnnotation = MKPointAnnotation()
        locationAnnotation.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        headerView.mapView.addAnnotation(locationAnnotation)
        headerView.mapView.showAnnotations([locationAnnotation], animated: false)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat!, longitude: lon!), span: MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.0005))
        headerView.mapView.setRegion(region, animated: true)
        
        if let model = model {
            let photo = model.response.venue.bestPhoto
            let urlString = photo.photoPrefix + "500x300" + photo.suffix
            if let url = URL(string: urlString) {
                headerView.photoImageView.af_setImage(withURL: url)
            }
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}

extension DetailVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeAnimationController(presenting: true)
    }
}
