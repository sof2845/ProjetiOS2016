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
    

    @IBOutlet weak var Descrition: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let text = service!.valueForKey("usernameService") as? String
        proprio.text = text

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
