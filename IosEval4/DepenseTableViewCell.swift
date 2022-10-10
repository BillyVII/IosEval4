//
//  DepenseTableViewCell.swift
//  IosEval4
//
//  Created by Student09 on 10/10/2022.
//

import UIKit

class DepenseTableViewCell: UITableViewCell {

    @IBOutlet weak var depenseLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
