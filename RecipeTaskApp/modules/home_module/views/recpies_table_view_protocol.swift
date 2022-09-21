//
//  recpies_table_view_protocol.swift
//  RecipeTaskApp
//
//  Created by Rana on 9/19/22.
//  Copyright © 2022 Rana. All rights reserved.
//

import Foundation

protocol RecipesTableViewProtocol {
    func DisplayData(myRecipes:RecipeModel?, error:Error?)
}
