//
//  CustomTableViewCell.swift
//  GodamNews
//
//  Created by Aiman on 2021/07/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var postTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
