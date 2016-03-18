//
//  CreerService.swift
//  ProjetiOS2016
//
//  Created by tp on 18/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit
import CoreData

class CreerService: UIViewController {

    @IBOutlet weak var nomService: UITextField!
    @IBOutlet weak var categorieService: UITextField!
    @IBOutlet weak var descriptionService: UITextView!
    @IBOutlet weak var heureDureeService: UITextField!
    @IBOutlet weak var minuteDureeService: UITextField!
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
        let dureeService = Int(heureDureeService.text!)! + ((Int(minuteDureeService.text!))! / 60)
        utilisateur.setValue(dureeService, forKey: "tempsService")
        utilisateur.setValue(debutDisponibilite, forKey: "dateDebutService")
        utilisateur.setValue(finDisponibilite, forKey: "dateFinService")
        
        do{
            try managedContext.save()
        }catch{
            print("erreur")
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
