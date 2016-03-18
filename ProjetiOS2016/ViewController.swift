//
//  ViewController.swift
//  ProjetiOS2016
//
//  Created by tp on 18/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    
    
    var tache = ["titi", "toto", "tata", "tutu", "test2"]
    
    var current:String = "SS"
    
    
    @IBOutlet weak var tableView: UITableView!
  
    

    
    
    /*override func prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
    if ([[segue identifier] isEqualToString:@"monLienDeConnection"])
    {
    ViewController2 *vc2 = [segue destinationViewController];
    vc2.maVariableATransmettre= 1;
    
    }
    }*/
    
    
    override func viewDidLoad() {
                super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          print(current)
        return tache.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellule")
        
        cell!.textLabel!.text = tache[indexPath.row]
        
        return cell!
    }
/*    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "allerSeCO" {
            
            var message = segue.destinationViewController as! SeConnecter
            
         
            
            
            
        }
        
    }*/



}

