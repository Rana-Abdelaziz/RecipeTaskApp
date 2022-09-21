//
//  detailes_presenter.swift
//  RecipeTaskApp
//
//  Created by Rana on 9/21/22.
//  Copyright © 2022 Rana. All rights reserved.
//

import Foundation
import UIKit
import SafariServices


protocol DetailesProtocol {
    func gotoRecipeWebsite(url:String)
}

class DetailesPresnter : DetailesProtocol
{
    func gotoRecipeWebsite(url: String) {
        
        
//        let svc = SFSafariViewController(url: URL(string: "https://"+url+"/")!)
//        self.p
        let recipeUrl = NSURL(string:"https://"+url+"/")
        		
                             if UIApplication.shared.canOpenURL(recipeUrl! as URL) {
                                 UIApplication.shared.openURL(recipeUrl! as URL)
                             } else {
                                 UIApplication.shared.openURL(NSURL(string: "http://google.com/")! as URL)
                             }
        
        
    }
    
}
