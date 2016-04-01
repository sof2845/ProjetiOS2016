//
//  MesMessages.swift
//  ProjetiOS2016
//
//  Created by tp on 01/04/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit

import CoreData

class MesMessages: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var resultats:NSArray = []
    var current = "null"
    func getData() {
        let apDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let   context:NSManagedObjectContext = apDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Message")
        
        request.returnsObjectsAsFaults = false;
        
        
        request.predicate = NSPredicate(format: "usernameDestinataire = %@",current )
        
        do {
            resultats = try context.executeFetchRequest(request)
            print("récupérer les résultats")
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          getData()
        print(current)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultats.count

    //    return resultats.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        print("test")
        let cell = tableView.dequeueReusableCellWithIdentifier("cellule") as! MessageCellCont
        
      let  res = resultats[indexPath.row] as! NSManagedObject
        let text = res.valueForKey("usernameExpediteur") as? String
        cell.userNameExp.text = text!
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if ( segue.identifier == "detailConver" ) {
            
            let message = segue.destinationViewController as! Conversation
           //let message1 = segue.destinationViewController as! Conversation
            
            if let indexPath = self.tableView.indexPathForSelectedRow?.row {
                let  res = resultats[indexPath] as! NSManagedObject
                let text = res.valueForKey("usernameExpediteur") as? String
                 message.createurService = text!
                message.current = current

            }
    
    
    }
        
    }
    
    
    
    
    
    
    /*
    */
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
