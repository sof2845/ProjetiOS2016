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
    

   
    
    var categories = ["Bricolage", "Jardinage", "Mécanique", "Babysitting", "Autres"]
    
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
        
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellule")
        
        cell!.textLabel!.text = categories[indexPath.row]
        
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
        
        
        
        } // end de la preparation du délégué 

/*

    
    //
    //  ViewController.swift
    //  TicTacToe
    //
    //  Created by tp on 09/02/2016.
    //  Copyright © 2016 tp. All rights reserved.
    //
    
    import UIKit
    
    class ViewController: UIViewController {
    
    @IBOutlet weak var monLabel: UILabel!
    @IBAction func Rejouer(sender: AnyObject) {
    }
    var tour = 1
    var gagnant = false
    var test = false
    var tab = [0,0,0,0,0,0,0,0,0];
    
    var tab_gagnant = [[0,1,2], [3,4,5]]
    
    func estGagant(tourjoueur: Int, tab: [Int]) -> Bool{
    //print(tab[tab_gagnant[0][0]])
    //print(tab[tab_gagnant[0][1]])
    //print(String(tourjoueur))
    //print(tab[tab_gagnant[0][0]])
    //print(tab[tab_gagnant[0][1]])
    //print(tab[tab_gagnant[0][2]])
    test = false
    for i in 0...1{
    
    if(tab[tab_gagnant[i][0]] == tourjoueur && tab[tab_gagnant[i][1]] == tourjoueur && tab[tab_gagnant[i][2]] == tourjoueur){
    //print("toto")
    test = true
    }
    
    }
    return test
    }
    
    
    
    @IBAction func ChoisirCase(sender: AnyObject) {
    
    if (tab[sender.tag] == 0 && !estGagant(Int(tour), tab: tab)){
    //print(estGagant(Int(tour), tab: tab))
    //print(String(tab[sender.tag]))
    if (tour == 1){
    tour = 2
    sender.setImage(UIImage(named:"hippo.png"), forState: UIControlState.Normal)
    tab[sender.tag] = tour
    //tour = 2
    //gagnant = estGagant(Int(tour), tab: tab)
    }
    else{
    tour = 1
    sender.setImage(UIImage(named:"Guitare"), forState: UIControlState.Normal)
    tab[sender.tag] = tour
    //tour = 1
    }
    
    
    
    }
    gagnant = estGagant(Int(tour), tab: tab)
    if (gagnant){
    monLabel.text = "Le joueur " + String(tour) + " a gagné"
    }
    
    
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    
    }
    

    
    
*/




}







