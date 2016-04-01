//
//  Commentaire.swift
//  ProjetiOS2016
//
//  Created by tp on 01/04/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData

class Commentaire: UIViewController {
    
    var current = "null"
    var idService = ""
    
    @IBAction func commenter(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext:managedContext)
        let monCommentaire = NSManagedObject(entity:entity!, insertIntoManagedObjectContext: managedContext)
        monCommentaire.setValue(texteCommentaire.text, forKey: "commentaireNote")
        monCommentaire.setValue(noteCommentaire.text, forKey: "valeurNote")
        monCommentaire.setValue(current, forKey: "usernameNote")
        monCommentaire.setValue(idService, forKey: "idService")
        
        var commentaires = [NSManagedObject]()
        let fetchRequest = NSFetchRequest(entityName: "Note")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            commentaires = results as! [NSManagedObject]
            monCommentaire.setValue((commentaires.count + 1), forKey: "idNote")
            print(String(commentaires.count))
            
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
    @IBOutlet weak var noteCommentaire: UITextField!
    @IBOutlet weak var texteCommentaire: UITextField!
    var resultats:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        let apDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let context:NSManagedObjectContext = apDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Note")
        
        request.returnsObjectsAsFaults = false;
        
        request.predicate = NSPredicate(format: "idService = %@", argumentArray: [idService])
        
        
        do {
            resultats = try context.executeFetchRequest(request)
            print("récupérer les résultats")
        } catch{
            // failure
            print("Erreur recuperation données")
        }
        
        
        
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
