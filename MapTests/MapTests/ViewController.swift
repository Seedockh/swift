
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func changeRegion(sender: UISegmentedControl) {
        mapView.setRegion(regions[sender.selectedSegmentIndex], animated: true)
    }
    
    let positions = [
        CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), //Paris
        CLLocationCoordinate2D(latitude: 5.3600, longitude: 4.0083), //Abidjan
        CLLocationCoordinate2D(latitude: 39.9042, longitude: 116.4074), //Beijing
        CLLocationCoordinate2D(latitude: 36.8485, longitude: 174.7633), //Auckland
        CLLocationCoordinate2D(latitude: 37.7749, longitude: 122.4194), //San Francisco
        CLLocationCoordinate2D(latitude: 33.4489, longitude: 70.6693), //Santiago de Chile
    ]
    
    let regions = [
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 59.740477037655893, longitude: 8.7182208228062912 ), //Europe
            span: MKCoordinateSpan(latitudeDelta: 61.129705032630937, longitudeDelta: 66.277389659283983)),
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 4.0930632060384369, longitude: 17.2452865698449), //Afrique
            span: MKCoordinateSpan(latitudeDelta: 103.16662788379688, longitudeDelta: 70.16335013280036)),
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 52.483338856198657, longitude: 86.670899169882404), //Asie
            span: MKCoordinateSpan(latitudeDelta: 128.61736720857235, longitudeDelta: 128.95642223259998)),
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -27.30182662309884, longitude: 147.60628049020244), //Océanie
            span: MKCoordinateSpan(latitudeDelta: 99.25673407934724, longitudeDelta: 72.578752378506977 )),
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.061630649301605, longitude: -99.364201324679598), //Amérique du Nord
            span: MKCoordinateSpan(latitudeDelta: 103.08917798021679, longitudeDelta: 94.728245405069629 )),
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -21.262681558037769, longitude: -63.553019314016232), //Amérique du Sud
            span: MKCoordinateSpan(latitudeDelta: 104.07053040189287, longitudeDelta: 74.617542267231954 )),
    ]
    
    
    func placeMarkers(positions: [CLLocationCoordinate2D]) {
        for position in positions {
            let marker = MKPointAnnotation()
            marker.coordinate = position
            mapView.addAnnotation(marker)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeMarkers(positions: positions)
    }


}
