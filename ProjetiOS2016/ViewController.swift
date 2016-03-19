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
            navigationItem.rightBarButtonItem = rightNavigationBarItem
            
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
        if segue.identifier == "allerSeCO" {
            
    let message = segue.destinationViewController as! SeConnecter
            
           message.delegate = self
            
         
            
            
            
        }
        
    }



}

