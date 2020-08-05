//
//  LeftProductCell.swift
//  TableViewAPIProject
//
//  Created by Shankar Suman on 24/03/20.
//  Copyright © 2020 Shankar Suman. All rights reserved.
//

import UIKit

class LeftProductCell: UITableViewCell {
    
    
    
    @IBOutlet var leftProductImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet var rightProductImage: UIImageView!
    
    @IBOutlet var leftImageLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var leftImageTopConstraint: NSLayoutConstraint!
    
    @IBOutlet var leftImageBottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var labelLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var labelTrailingConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var labelVerticalAlignmentConstraint: NSLayoutConstraint!
    
    @IBOutlet var rightImageTopConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var rightImageBottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var rightImageTrailingConstraint: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
