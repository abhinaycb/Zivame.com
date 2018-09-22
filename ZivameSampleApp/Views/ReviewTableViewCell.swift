//
//  ReviewTableViewCell.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 22/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    
    var model:Review?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }
    
    
    
    func updateViews() {
        descriptionText.text = model?.description ?? ""
        senderName.text = model?.customerName ?? ""
        timeStamp.text = model?.timeLine ?? ""
        numberOfLikesLabel.text = "\(model?.likes ?? 0)"
    }
    
    func configureCell(_ model:Review?) {
        self.model = model
        updateViews()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
