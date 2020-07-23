//
//  CustomTableViewCell.swift
//  Challenge
//
//  Created by Sahar Hany on 7/23/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var custTitleLabel: UILabel!
    
    @IBOutlet weak var custButton: UIButton!
    var item : String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        custTitleLabel.text = "Hello"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    @IBAction func onPressBtnAction(_ sender: UIButton) {
        print(item!)
    }
    
}
