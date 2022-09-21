//
//  DetailesViewController.swift
//  RecipeTaskApp
//
//  Created by Rana on 9/19/22.
//  Copyright © 2022 Rana. All rights reserved.
//

import UIKit
import SafariServices

class DetailesViewController: UIViewController {

    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    var myRecipe : Hit = Hit()
    let detailesPresnter : DetailesProtocol = DetailesPresnter()

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTitle.text = myRecipe.recipe?.label
        recipeIngredients.text = myRecipe.recipe!.ingredientLines[0]
        recipeImage.kf.setImage(with: URL(string: myRecipe.recipe!.image), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToWebsiteAction(_ sender: Any) {
//        let svc = SFSafariViewController(url: URL(string: "https://"+myRecipe.recipe!.url+"/")!)
//        self.present(svc, animated: true, completion: nil)
        detailesPresnter.gotoRecipeWebsite(url: myRecipe.recipe!.url)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
