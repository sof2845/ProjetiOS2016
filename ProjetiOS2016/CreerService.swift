//
//  CreerService.swift
//  ProjetiOS2016
//
//  Created by tp on 18/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData

class CreerService: UIViewController, SeConnecterDelegate {
    
    
    
    
    var current = "null"
    
    
    func addNew(todo: String) {
        
        current = todo
        viewDidLoad()
    }
    
 
    @IBOutlet weak var nomService: UITextField!
    @IBOutlet weak var categorieService: UITextField!
    @IBOutlet weak var descriptionService: UITextView!
    @IBOutlet weak var heureDureeService: UITextField!
    @IBOutlet weak var debutDisponibilite: UIDatePicker!
    @IBOutlet weak var finDisponibilite: UIDatePicker!
    @IBAction func creerService(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Service", inManagedObjectContext:managedContext)
        let utilisateur = NSManagedObject(entity:entity!, insertIntoManagedObjectContext: managedContext)
        utilisateur.setValue(nomService.text, forKey: "nomService")
        utilisateur.setValue(categorieService.text, forKey: "categorieService")
        utilisateur.setValue(descriptionService.text, forKey: "descriptionService")
        utilisateur.setValue(Int(heureDureeService.text!), forKey: "tempsService")
        
        // ajout du username qui créée le service usernameService
        
        utilisateur.setValue(current, forKey: "usernameService")
        
        

        /*
        A faire : enregistrer également le username de l'utilisateur ayant créer le service
        utilisateur.setValue(debutDisponibilite, forKey: "dateDebutService")
        utilisateur.setValue(finDisponibilite, forKey: "dateFinService")
        */
        
        var services = [NSManagedObject]()
        let fetchRequest = NSFetchRequest(entityName: "Service")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            services = results as! [NSManagedObject]
            utilisateur.setValue((services.count + 1), forKey: "idService")
            print(String(services.count))
        } catch {
            print("erreur requete")
        }
        
        do{
            try managedContext.save()
            navigationController?.popViewControllerAnimated(true)
        }catch{
            print("erreur creation service")
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 print(current)
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
