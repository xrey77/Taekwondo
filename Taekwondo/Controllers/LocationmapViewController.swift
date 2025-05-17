//
//  LocationmapViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 4/27/25.
//
import MapKit
import UIKit
import CoreLocation


class LocationmapViewController: UIViewController {
//    @IBOutlet weak var mapView: MKMapView!
//    let locationManager = CLLocationManager()
    
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(map)
        
        
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }

                strongSelf.addMapPin(with: location)
                
            }
        }
        
        
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.distanceFilter = kCLDistanceFilterNone
//        locationManager.startUpdatingLocation()
//        mapView.showsUserLocation = true
        
        
        
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left.square"),
            style: .done,
            target: self,
            action: #selector(barTapped(sender:))
        )

        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }
    
    func addMapPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.027, longitudeDelta: 0.027)), animated: true)
                            
        map.addAnnotation(pin)
        
        LocationManager.shared.resolveLocationName(with: location) { [weak self] locationName in
            self?.title = locationName
        }
    }
    
    @objc func barTapped(sender: UIBarButtonItem) {
         dismiss(animated: true, completion: nil)
     }


    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }


}
