//
//  CellCommentaire.swift
//  ProjetiOS2016
//
//  Created by tp on 01/04/2016.
//  Copyright © 2016 tp. All rights reserved.
//

import UIKit

class CellCommentaire: UITableViewCell {

    @IBOutlet weak var userCommentaire: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var texteCommentaire: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
