//
//  DetailController.swift
//  ProjetiOS2016
//
//  Created by tp on 28/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData
class DetailController: UIViewController {
    
    
    var service:NSManagedObject?
   
    
    @IBOutlet weak var proprio: UILabel!
    

    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var duree: UILabel!
    @IBOutlet weak var dateDebut: UIDatePicker!
    @IBOutlet weak var des: UITextView!
 
    @IBOutlet weak var datefin: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        detail.text = service!.valueForKey("nomService") as? String
        
        let text = service!.valueForKey("usernameService") as? String
        proprio.text = text
        dateDebut.date = (service!.valueForKey("dateDebutService") as? NSDate)!
       datefin.date = (service!.valueForKey("dateFinService") as? NSDate)!
       
        let temps:Float = (service!.valueForKey("tempsService") as? Float)!
        let tt:String = " " + String(temps)
        duree.text = tt
    des.text = service!.valueForKey("descriptionService") as? String
        
      //  datefin.date = (datedefin?.date)!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
