//
//  Conversation.swift
//  ProjetiOS2016
//
//  Created by tp on 23/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData


class Conversation: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var current = "null"
    var createurService = ""
    
    @IBAction func envoyerMessage(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Message", inManagedObjectContext:managedContext)
        let monMessage = NSManagedObject(entity:entity!, insertIntoManagedObjectContext: managedContext)
        monMessage.setValue(message.text, forKey: "texteMessage")
        monMessage.setValue(current, forKey: "usernameExpediteur")
        monMessage.setValue(createurService, forKey: "usernameDestinataire")
        
        var messages = [NSManagedObject]()
        let fetchRequest = NSFetchRequest(entityName: "Message")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            messages = results as! [NSManagedObject]
            monMessage.setValue((messages.count + 1), forKey: "idMessage")
            print(String(messages.count))
            
            // le delege
            //delegeService.addNewService(current)
            
        } catch {
            print("erreur requete")
        }
        
        do{
            try managedContext.save()
            navigationController?.popViewControllerAnimated(true)
        }catch{
            print("erreur creation message")
        }
    }
    
    @IBOutlet weak var message: UITextField!
    var resultats:NSArray = []
      var resultats1:NSArray = []
    func getData() {
        let apDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let context:NSManagedObjectContext = apDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Message")
      
        request.returnsObjectsAsFaults = false;
        
        request.predicate = NSPredicate(format: "usernameDestinataire = %@ AND usernameExpediteur = %@", argumentArray: [current, createurService])
      
        
        
        do {
            resultats = try context.executeFetchRequest(request)
           
            print("récupérer les résultats")
        } catch{
            // failure
            print("Erreur recuperation données")
        }
        
        
        
    }

    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        print(current)
        print(createurService)
        
        
      
        getData()
        tableView.reloadData()

        // Do any additional setup after loading the view.
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cellule") as! Cellule
        
        let res = resultats[indexPath.row] as! NSManagedObject
        let message = res.valueForKey("texteMessage") as? String
        cell.message.text = message
        let expediteur = res.valueForKey("usernameExpediteur") as? String
        cell.expediteur.text = expediteur
        
        return cell
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
