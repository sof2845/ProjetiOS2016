//
//  SeConnecter.swift
//  ProjetiOS2016
//
//  Created by tp on 18/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData



protocol SeConnecterDelegate {


    func addNew(todo : String)

}





class SeConnecter: UIViewController {
    
    @IBOutlet weak var mdp: UITextField!
    @IBOutlet weak var user: UITextField!
    
    var delegate: SeConnecterDelegate!
   
    
    
    
    
    

    
    
    @IBAction func testCo(sender: AnyObject) {
        let apDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let   context:NSManagedObjectContext = apDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Utilisateur")
        
        request.returnsObjectsAsFaults = false;
        
        
        
        
        request.predicate = NSPredicate(format: "username = %@ AND password = %@", argumentArray: [user.text!, mdp.text!])
        
        
        
        
        do {
            let results:NSArray? = try context.executeFetchRequest(request)
            
            if( results!.count > 0)
            {
                
                let res = results![0] as! NSManagedObject
             var text = res.valueForKey("username") as? String
             
            delegate.addNew(text!)
                
                
                
                navigationController?.popViewControllerAnimated(true)
                
                
            }
                
            else {
                
                print("erreur")
                
                let alertController = UIAlertController(title: "Erreur", message:
                    "Utilisateur ou mot de passe incorrecte", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

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
