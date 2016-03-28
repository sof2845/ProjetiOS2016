//
//  CreerCompte.swift
//  ProjetiOS2016
//
//  Created by tp on 18/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData



class CreerCompte: UIViewController {

    @IBOutlet weak var creerCompte: UIButton!
    @IBOutlet weak var seConnecter: UIButton!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var codePostal: UITextField!
    
    @IBAction func CreerCompte(sender: AnyObject) {
        if(password.text == confirmPassword.text){
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let entity = NSEntityDescription.entityForName("Utilisateur", inManagedObjectContext:managedContext)
            let utilisateur = NSManagedObject(entity:entity!, insertIntoManagedObjectContext: managedContext)
            
            let request = NSFetchRequest(entityName: "Utilisateur")
            request.returnsObjectsAsFaults = false;
            request.predicate = NSPredicate(format: "username = %@", argumentArray: [username.text!])
            
            
            //////
            
            do {
                let results:NSArray? = try managedContext.executeFetchRequest(request)
                if( results!.count > 0){
                    print("erreur username indisponible")
                    let alertController = UIAlertController(title: "Erreur", message:
                        "Nom d'utilisateur indisponible", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                else{
                    utilisateur.setValue(username.text, forKey: "username")
                    utilisateur.setValue(password.text, forKey: "password")
                    utilisateur.setValue(nom.text, forKey: "nom")
                    utilisateur.setValue(prenom.text, forKey: "prenom")
                    utilisateur.setValue(Int(codePostal.text!), forKey: "codePostal")
                    
                    do{
                        try managedContext.save()
                    }catch{
                        print("erreur enregistrement utilisateur")
                    }
                    navigationController?.popViewControllerAnimated(true)
                }
                
            } catch let error as NSError {
                // failure
                print("Fetch failed: \(error.localizedDescription)")
            }
            
            //////
            
            
            
        }
        else{
            print("mot de passe différent")
            let alertController = UIAlertController(title: "Erreur", message:
                "Les mots de passe sont incorrectes", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
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
