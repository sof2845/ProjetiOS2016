//
//  Map.swift
//  ProjetiOS2016
//
//  Created by tp on 01/04/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class Map: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var maMap: MKMapView!
    var createurService = ""
    var resultats:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let context:NSManagedObjectContext = apDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Utilisateur")
        
        request.returnsObjectsAsFaults = false;
        
        request.predicate = NSPredicate(format: "username = %@", argumentArray: [createurService])
        
        
        do {
            resultats = try context.executeFetchRequest(request)
            print("récupérer les résultats")
        } catch{
            // failure
            print("Erreur recuperation données")
        }
        
        let res = resultats[0] as! NSManagedObject
        let lat = res.valueForKey("latitudeUtilisateur") as! CLLocationDegrees
        let long = res.valueForKey("longitudeUtilisateur") as! CLLocationDegrees
        
        let latitude:CLLocationDegrees = lat
        let longitude:CLLocationDegrees = long
        
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        maMap.setRegion(region, animated: false)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
