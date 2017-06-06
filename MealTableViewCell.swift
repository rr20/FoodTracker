//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Rohit Rajan on 27/05/17.
//  Copyright © 2017 Rohit Rajan. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
	
	//MARK: Properties
	
	@IBOutlet weak var nameLabel: UILabel!
	
	@IBOutlet weak var photoImageView: UIImageView!
	
	@IBOutlet weak var ratingControl: RatingControl!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
