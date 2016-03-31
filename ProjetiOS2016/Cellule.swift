//
//  Cellule.swift
//  ProjetiOS2016
//
//  Created by tp on 31/03/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit

class Cellule: UITableViewCell {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var expediteur: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
