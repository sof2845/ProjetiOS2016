//
//  ViewController.swift
//  ProjetiOS2016
//
//  Created by tp on 18/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, SeConnecterDelegate, creerServiceDelegate {

 //  var addItem: UIBarButtonItem
    
    
    var resultats:NSArray = []
  
    var seCoItem: UIBarButtonItem!
    var crerCompteItem: UIBarButtonItem!
    var seDecoItem: UIBarButtonItem!
    

  //  @IBOutlet weak var leftBar: UIBarButtonItem!
    
    
    func getData() {
        let apDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let   context:NSManagedObjectContext = apDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Service")
        
        request.returnsObjectsAsFaults = false;

        
        
        do {
            resultats = try context.executeFetchRequest(request)
            print("récupérer les résultats")
                    } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        
   
        
    }
   
    
    var categories = ["Bricolage", "Jardinage", "Mécanique", "Babysitting", "Autres"]
    
    var current:String = "null"
    @IBOutlet weak var tableView: UITableView!
  
 
   func addNewService(todo : String){
    viewDidLoad()
    
    }

    func addNew(todo: String) {
      
        current = todo
        viewDidLoad()
    }
    
    
    
    
  
    
 /*   func sayHello() { print("Hello") }
    
    var b = UIBarButtonItem(title: "Continue", style: .Plain, target: nil, action:sayHello)
    */
    
    
     func deconnexion() {
        
        print("deconnecion")
        current = "null"
        
        self.navigationItem.leftBarButtonItem = seCoItem
        self.navigationItem.rightBarButtonItem = crerCompteItem
        tableView.reloadData()
        viewDidLoad()

    }
    
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        let mySelector: Selector = "deconnexion"
        
      
        getData()
       
        
    //    var seDecoItem = UIBarButtonItem(title: "Se Deconnecter", style: UIBarButtonItemStyle.Plain , target: nil, action:@selector(self.seDeconnecter:))
        
        // garder les bar
        seCoItem = self.navigationItem.leftBarButtonItem
        crerCompteItem = self.navigationItem.rightBarButtonItem
     
        
        if(current != "null") {
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
    let rightNavigationBarItem = UIBarButtonItem(title: "se deconnecter", style: UIBarButtonItemStyle.Plain, target: self, action: mySelector)
            let leftItem = UIBarButtonItem(title: "Bonjour" + " " + current, style: UIBarButtonItemStyle.Plain, target: self, action: nil)
            navigationItem.rightBarButtonItem = rightNavigationBarItem
            navigationItem.leftBarButtonItem = leftItem
            
        }
        
        tableView.reloadData()
        
        }
    
    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultats.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        print("test")
        let cell = tableView.dequeueReusableCellWithIdentifier("cellule")
        
        let res = resultats[indexPath.row] as! NSManagedObject
        var text = res.valueForKey("categorieService") as? String
        
      print(text)
        cell!.textLabel!.text = text
            
            cell!.tag = indexPath.row
        
        return cell!
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // aller se Connecter Action
        if ( segue.identifier == "allerSeCO" ) {
            
    let message = segue.destinationViewController as! SeConnecter
            
           message.delegate = self
             } // end if aller se Connecter Action
        
        // creerServiceAction
        
        
        if ( segue.identifier == "creerServiceAction" ) {
            
            let message = segue.destinationViewController as! CreerService
            

            if( current == "null") {
            
            
                let alertController = UIAlertController(title: "Erreur", message:
                    "veuillez vous connecter pour créer un service ", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                                   } // end if
        
            
           else if( current != "null" )
            {                     message.current = current
                
            } // enf if
            
            
            
            }// end if creerServiceAction
        // creerServiceAction
        
        if ( segue.identifier == "creerServiceAction" ) {
            
            let message = segue.destinationViewController as! CreerService
            
            message.delegeService = self
        }
        // showDetailsAction
        
        
        if ( segue.identifier == "showDetailsAction" ) {
            
            let message = segue.destinationViewController as! DetailController
             let message1 = segue.destinationViewController as! DetailController
          
            if let indexPath =    self.tableView.indexPathForSelectedRow?.row {
           
            message.service = resultats[indexPath] as? NSManagedObject
            message1.current = current
            
            }
        /*    if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
            
         //   message.service = resultats[indexPath.row] as! NSManagedObject
            message.service = "test"
            }*/
            
            
        }
        
        } // end de la preparation du délégué 

    func detailIndexPath(indexPath: NSIndexPath) -> NSManagedObject {
    
     //   var service = resultats[indexPath.section]
        
     //   return service.resultats[indexPath.row] as! NSManagedObject
      //  return resultats[indexPath.row] as! NSManagedObject
         let res = resultats[indexPath.row] as! NSManagedObject
        return res
        
    
    }



}







