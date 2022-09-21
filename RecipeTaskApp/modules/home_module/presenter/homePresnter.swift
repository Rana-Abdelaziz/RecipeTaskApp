//
//  homePresnter.swift
//  RecipeTaskApp
//
//  Created by Rana on 9/19/22.
//  Copyright © 2022 Rana. All rights reserved.
//

import Foundation

protocol HomeProtocol {
    func getRecipes(url:String)
    func getMyRecipes(url:String,completionHandler: @escaping (RecipeModel?, Error?) -> ())
}

class HomePresenter : HomeProtocol{
    let homeView : RecipesTableViewProtocol = ViewController()
    
    
    func getMyRecipes(url:String,completionHandler: @escaping (RecipeModel?, Error?) -> ()){
          let networkService = RecipesNetworkManager(baseUrl: url)
        networkService.getRecipes(completionHandler: { recipes, error in

            if let error = error {
                print("presnter",error)
               completionHandler(nil,Error.self as? Error)
            } else {
                guard let resualt = recipes else { return }
               completionHandler(resualt,nil)
            }
        })
      }
    
   
    func getRecipes(url:String) {
        let networkService = RecipesNetworkManager(baseUrl: url)
        networkService.getRecipes(completionHandler: {[weak self] recipes, error in
                            guard let self = self else{return}
                         if let myError = error {
                             print(error)
                            
        //                    self.leaguesView.DispalyData(myLeagues: nil,error:myError)
                         } else {
                             guard let resualt = recipes else { return }
                            self.homeView.DisplayData(myRecipes: resualt,error:nil)
                         }
                     })
    }
    
    
}

