//
//  SearchResponseTableViewCell.swift
//  Yelp
//
//  Created by Shengjun Li on 2/16/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class SearchResponseCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var reviewsLabel: UILabel!
    
    
    @IBOutlet weak var tagsLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
