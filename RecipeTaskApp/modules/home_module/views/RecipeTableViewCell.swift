//
//  RecipeTableViewCell.swift
//  RecipeTaskApp
//
//  Created by Rana on 9/19/22.
//  Copyright © 2022 Rana. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeSource: UILabel!
    @IBOutlet weak var recipeTilte: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
