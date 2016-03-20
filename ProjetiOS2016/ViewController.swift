//
//  ViewController.swift
//  ProjetiOS2016
//
//  Created by tp on 18/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, SeConnecterDelegate {

 //  var addItem: UIBarButtonItem
    
    
    
  
    var seCoItem: UIBarButtonItem!
    var crerCompteItem: UIBarButtonItem!
    var seDecoItem: UIBarButtonItem!
    

  //  @IBOutlet weak var leftBar: UIBarButtonItem!
    

   
    
    var tache = ["titi", "toto", "tata", "tutu", "test2"]
    
    var current:String = "null"
    @IBOutlet weak var tableView: UITableView!
  
 
    

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
        
        
        
        }
    
    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tache.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellule")
        
        cell!.textLabel!.text = tache[indexPath.row]
        
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
        
        
        
        } // end de la preparation du délégué 






}

    





