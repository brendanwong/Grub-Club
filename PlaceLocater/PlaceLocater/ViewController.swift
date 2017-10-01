//
//  ViewController.swift
//  PlaceLocater
//
//  Created by Abhinav on 9/30/17.
//  Copyright © 2017 Abhinav. All rights reserved.
//

import UIKit
import CoreLocation

import GooglePlaces
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {
    // Google Places
    var placesClient: GMSPlacesClient!
    // Apple Location Services
    let locationManager = CLLocationManager()
    
    var window: UIWindow?

    
    // UI to test integration with Google Places
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    // Nearby restaurants
    var possibilities = [Restaurant]()
    
    // Users
    var main = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 50
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        placesClient = GMSPlacesClient.sharedClient()
    }
    
    // Called every time user's location changes
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        placesClient = GMSPlacesClient.sharedClient()
        getCurrentPlace()
    }
    
    // Google Places API Integration
    func getCurrentPlace() {
        placesClient.currentPlaceWithCallback({ (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let placeLikelihoodList = placeLikelihoodList {
                for likelihood in placeLikelihoodList.likelihoods {
                    let place = likelihood.place
                    // If place is a restaurant, append it to possibilities
                    if (place.types.contains("restaurant")) {
                        // Creating a Restaurant object
                        self.possibilities.append(Restaurant(name:place.name, placeID:place.placeID, priceLevel:place.priceLevel.rawValue))
                    }
                }
            }
            
            if self.possibilities.count > 0 {
                // UI
                self.name.text = self.possibilities[0].name
                self.loadFirstPhotoForPlace(self.possibilities[0].placeID)
                
                // Set restaurant image
                self.possibilities[0].image = self.imageview
                
                //TODO: Prompt user for restaurant rating and the set rating attribute of Restaurant object
                
                //Add restaurant to list of restaurants user has visited
                self.main.append(self.possibilities[0])
                
                print(self.possibilities[0].name)
                print(self.possibilities[0].placeID)
                print(self.possibilities[0].priceLevel)
                print()
                
                
            } else {
                print("No restaurants nearby.")
            }
            
            // Reset possibilities for next location
            self.possibilities.removeAll(keepCapacity: true)
        })
    }
        
    func loadFirstPhotoForPlace(placeID: String) {
        placesClient.lookUpPhotosForPlaceID(placeID, callback: { (photos, error) -> Void in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                if let firstPhoto = photos?.results.first {
                    self.loadImageForMetadata(firstPhoto)
                }
            }
        })
    }
    
    func loadImageForMetadata(photoMetadata: GMSPlacePhotoMetadata) {
        placesClient.loadPlacePhoto(photoMetadata, callback: {
            (photo, error) -> Void in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                self.imageview.image = photo
            }
        })
    }
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func output(sender: UIButton) {
        main[0].rating = 4 //Frace
        main[1].rating = 3 //Dominos
        main[2].rating = 5 //Steak
        main[3].rating = 4 //Olive Garden
        main[4].rating = 1 //Taco Bell
        result.text = suggest(self.main)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

