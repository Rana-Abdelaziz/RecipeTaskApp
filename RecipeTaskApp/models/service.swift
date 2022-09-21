//
//  service.swift
//  RecipeTaskApp
//
//  Created by Rana on 9/19/22.
//  Copyright © 2022 Rana. All rights reserved.
//

import Foundation
import Alamofire

class RecipesNetworkManager{
    var baseUrl = ""
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getRecipes(completionHandler: @escaping (RecipeModel?, Error?) -> ()) {
        
        Alamofire.request(self.baseUrl , method: .get).responseJSON { (DataResponse) -> Void in
            do{
                let itemsInJson = DataResponse.data
                               print(DataResponse.result.value ?? "no data is avalible")
                               let result = try JSONDecoder().decode(RecipeModel.self,from:itemsInJson!)
//                print("resualt is ",result)
                completionHandler(result,nil)
            }catch{
                print("error while decoding")
                print(Error.self)
                completionHandler(nil,Error.self as? Error)
            }
                       
            
        }

    }
}
