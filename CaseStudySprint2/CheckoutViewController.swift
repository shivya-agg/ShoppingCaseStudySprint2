//
//  CheckoutViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/25/22.
//

import UIKit
import MapKit
import CoreLocation

//MARK: Class
class CheckoutViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    //MARK: IBOutlets
    @IBOutlet weak var orderNowButton: UIButton!
    @IBOutlet weak var userLocMapView: MKMapView!
    
    //MARK: Variables
    var locateManager: CLLocationManager!
    
    //MARK: Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        orderNowButton.layer.cornerRadius = 10
        determineAccessToUserLocation()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Functions
    //this function is requesting authorization access
    func determineAccessToUserLocation() {
        locateManager = CLLocationManager()
        locateManager.delegate = self
        locateManager.desiredAccuracy = kCLLocationAccuracyBest //current location within kilometre
        locateManager.requestAlwaysAuthorization() //asking user authorization
        
        //once user has given app permissions then enabling location services
        if CLLocationManager.locationServicesEnabled() {
            locateManager.startUpdatingLocation()
        }
        
    }
    //this gets called whenever there is updates in location of the user
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let nUserLocation: CLLocation = locations[0] as CLLocation
        let center = CLLocationCoordinate2D(latitude: nUserLocation.coordinate.latitude, longitude: nUserLocation.coordinate.longitude)
        let nRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        userLocMapView.setRegion(nRegion, animated: true)
        
        let mkAnnotation = MKPointAnnotation()
        mkAnnotation.coordinate = CLLocationCoordinate2DMake(nUserLocation.coordinate.latitude, nUserLocation.coordinate.longitude)
        getAddress { (address) in
            mkAnnotation.title = address
        }
        
        userLocMapView.addAnnotation(mkAnnotation)
        func getAddress(handler: @escaping(String) -> Void) {
            let geocoder = CLGeocoder()
            let location = CLLocation(latitude: nUserLocation.coordinate.latitude, longitude: nUserLocation.coordinate.longitude)
            geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                
                //storing the place details
                var placemark: CLPlacemark?
                placemark = placemarks?[0]
                
                //address details
                let address = "\(placemark?.subThoroughfare ?? ""), \(placemark?.thoroughfare ?? ""),\(placemark?.administrativeArea ?? ""),\(placemark?.postalCode ?? ""), \(placemark?.country ?? "")"
                handler(address)
                
            })
        }
        
    }
    
    //MARK: Error displaying function
    //this function shows message in case of any error while fetching user location
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        displayAlert(title: "Error", message: "Failed to fetch user location")
    }

    //MARK: IBActions
    @IBAction func orderNowButtonClicked(_ sender: Any) {
        
        //on checkout button click user navigating to notification screen
        let notificationViewController = self.storyboard?.instantiateViewController(withIdentifier: "notificationViewController") as! NotificationViewController
        
        self.navigationController?.pushViewController(notificationViewController, animated: true)
    }
   
}
