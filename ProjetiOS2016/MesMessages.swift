//
//  MesMessages.swift
//  ProjetiOS2016
//
//  Created by tp on 01/04/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit

class MesMessages: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
        let cell = tableView.dequeueReusableCellWithIdentifier("cellule") as! UITableViewCell
        
        let res = resultats[indexPath.row] as! NSManagedObject
        let message = res.valueForKey("commentaireNote") as? String
        cell.texteCommentaire.text = message
        let note = res.valueForKey("valeurNote") as! Int
        cell.note.text = String(note)
        let user = res.valueForKey("usernameNote") as! String
        cell.userCommentaire.text = user
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
