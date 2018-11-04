//
//  FindFuelStationsViewController.swift
//  Happy Roads
//
//  Created by Saikumar on 03/11/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit
import GoogleMaps
import SideMenu

class FindFuelStationsViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var displayView: UIView!
  
    @IBOutlet weak var mapHolderView: UIView!
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var filterView: UIView!
    var showFilters = false
    
    
    let locationManager = CLLocationManager()
    let mapView = GMSMapView()
    var currentLocation: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.decorateUI()
        self.decorateNavigationBar()
        self.addGoogleMap()
        self.displayMarkers()

    }
    func decorateUI() {
        
        self.displayView.isHidden = true
        self.filterView.alpha = 0
        
        self.searchBar.layer.cornerRadius = 8
        self.searchBar.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.searchBar.layer.borderWidth = 1
        self.searchBar.layer.masksToBounds = true
        
        self.displayView.layer.cornerRadius = 8
        self.displayView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.displayView.layer.borderWidth = 1
        self.displayView.layer.masksToBounds = true
        
        let swipeView = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
        swipeView.direction = .down
        self.displayView.addGestureRecognizer(swipeView)
        
        self.view.bringSubviewToFront(displayView)
        self.view.bringSubviewToFront(filterView)
        self.view.bringSubviewToFront(searchBar)
        
    }
    
    
    @objc func swipeDown() {
        UIView.animate(withDuration: 0.5, animations: {
            
            self.displayView.frame=CGRect(x: self.displayView.frame.origin.x, y: self.view.frame.height, width: self.displayView.frame.width, height: self.displayView.frame.height)
    
            self.filterButton.frame = CGRect(x: self.filterButton.frame.origin.x, y: self.view.frame.origin.y+610 , width: self.filterButton.frame.width, height: self.filterButton.frame.height)
          
            self.mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 20)
            
        }) { (completed) in
            self.displayView.isHidden = true
        }
    }
    
    func swipeUp() {
        displayView.frame = CGRect(x: self.displayView.frame.origin.x, y: self.view.frame.height, width: self.displayView.frame.width, height: self.displayView.frame.height)
        
        displayView.isHidden = false
        
        UIView.animate(withDuration: 0.5) {
            
            self.displayView.frame = CGRect(x: self.displayView.frame.origin.x, y: self.view.frame.size.height-144, width: self.displayView.frame.width, height: self.displayView.frame.height)
            
            self.filterButton.frame = CGRect(x: self.filterButton.frame.origin.x, y: self.displayView.frame.origin.y-80, width: self.filterButton.frame.width, height: self.filterButton.frame.height)
            
            self.mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: self.displayView.frame.size.height+95, right: 20)
        }
    }
    
    func decorateNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
        let logoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
        logoButton.setBackgroundImage(#imageLiteral(resourceName: "back_icon"), for: .normal)
        logoButton.addTarget(self, action: #selector(goBackFromThis), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: logoButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        let menuBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu_icon"), style: .plain, target: self, action: #selector(menuBtnAction))
        menuBarButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.rightBarButtonItem = menuBarButton
    }
    @objc func menuBtnAction() {
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    func addGoogleMap() {
        mapView.frame = self.view.bounds
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton=true
        mapHolderView.addSubview(mapView)
        checkLocationService()
    }
    
    
    func checkLocationService() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            switch CLLocationManager.authorizationStatus() {
                
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.delegate = self
                locationManager.startUpdatingLocation()
                break
            case .restricted:
                self.showAlert(title: "Location services Alert !", message: "Please enable location service in settings to get current location") { }
                break
            case .denied:
                self.showAlert(title: "Location services Alert !", message: "Please enable location service in settings to get current location") { }
                break
            case .authorizedWhenInUse:
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.delegate = self
                locationManager.startUpdatingLocation()
                break
            case .authorizedAlways:
                break
            }
            
        } else {
            self.showAlert(title: "Location services Alert !", message: "Please enable location service in settings to get current location") { }
        }
        
    }

    #warning("Clean up this code after API done")

    func displayMarkers() {
        
        mapView.delegate=self
        let marker = GMSMarker()
        marker.title="BRN"
        marker.snippet="HYDERABAD"
        marker.position = CLLocationCoordinate2D(latitude: 17.4444, longitude:  78.3861)
       
        marker.map = mapView
        
        let marker1=GMSMarker()
        marker1.title="MADHAPUR POLICE STATION"
        marker1.snippet="HYDERABAD"
        marker1.position=CLLocationCoordinate2D(latitude: 17.4395, longitude: 78.3959)
       
        marker1.map=mapView
        
        let marker2=GMSMarker()
        marker2.title="IMAGE HOSPITALS"
        marker2.snippet="HYDERABAD"
        marker2.position=CLLocationCoordinate2D(latitude: 17.4461, longitude: 78.3873)
        
        marker2.map=mapView
    }
    
    //MARK:- ButtonActions
    
    @IBAction func filtersButtonAction(_ sender: UIButton) {
        showFilters.toggle()
        if showFilters {
            sender.setBackgroundImage(#imageLiteral(resourceName: "close_filter"), for: .normal)
            self.showFiltersView()
        } else {
            sender.setBackgroundImage(#imageLiteral(resourceName: "filter_map"), for: .normal)
            self.hideFiltersView()
        }
    }
    
    func showFiltersView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.filterView.alpha = 1
        })
    }
    
    func hideFiltersView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.filterView.alpha = 0
        })
    }
    
}

//MARK:- Map and LocationManager delegates

extension FindFuelStationsViewController: CLLocationManagerDelegate,GMSMapViewDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if currentLocation == nil {
            
            currentLocation = locations.last
           
            mapView.padding=UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 20)
            if let location = currentLocation {
                let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 13.0)
                mapView.animate(to: camera)
                
                
            }

        }
        
    }
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        self.hideFiltersView()
        showFilters = false
        self.filterButton.setBackgroundImage(#imageLiteral(resourceName: "filter_map"), for: .normal)
        self.swipeUp()
        return true
    }
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        
        showFilters = false
        filterButton.setBackgroundImage(#imageLiteral(resourceName: "filter_map"), for: .normal)
        self.hideFiltersView()
    
        if let location = currentLocation {
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 13.0)
            mapView.animate(to: camera)
        }
        return true
    }
    
}
