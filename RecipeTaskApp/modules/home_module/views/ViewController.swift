//
//  ViewController.swift
//  RecipeTaskApp
//
//  Created by Rana on 9/18/22.
//  Copyright © 2022 Rana. All rights reserved.
//

import UIKit
import Kingfisher
import RxCocoa
import RxSwift

class ViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate , RecipesTableViewProtocol{
    var recipesList:[Hit] = []
    var filteredList :[Hit] = []

    
    
    @IBAction func segmantedControllerAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
                 filteredList = recipesList
            recipeTableView.reloadData()

        }
        else if sender.selectedSegmentIndex == 1{
            filteredList = recipesList.filter({ (Hit) -> Bool in
                Hit.recipe!.healthLabels.contains("Keto-Friendly")
            })
            recipeTableView.reloadData()
            
        }
        else if sender.selectedSegmentIndex == 2{
              filteredList = recipesList.filter({ (Hit) -> Bool in
                Hit.recipe!.healthLabels.contains("Vegan")
                      })
            recipeTableView.reloadData()


        }
        else if sender.selectedSegmentIndex == 3{
             print("Low-Sugar")
            filteredList = recipesList.filter({ (Hit) -> Bool in
                Hit.recipe!.healthLabels.contains("Low-Sugar")
            })
            recipeTableView.reloadData()

        }
        
        
    }
    
    func DisplayData(myRecipes: RecipeModel?, error: Error?) {
        print("func inside controller  display data ")
        print("Data is count ", myRecipes?.hits.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! RecipeTableViewCell
        cell.recipeTilte.text = filteredList[indexPath.row].recipe?.label
        cell.recipeTilte.text = filteredList[indexPath.row].recipe?.source
        
        let url = (filteredList[indexPath.row].recipe?.image)!
        cell.recipeImage.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
        
        return cell
        
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var recipeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        searchBar.delegate = self
        let homePresnter:HomeProtocol = HomePresenter()
        var myUrl = "https://api.edamam.com/search?q=all&app_id=099bcd9d&app_key=48634ec269ae20561fc583835f8d2e7e"
        //homePresnter.getRecipes(url:"https://api.edamam.com/search?q=chicken&app_id=099bcd9d&app_key=48634ec269ae20561fc583835f8d2e7e")
        homePresnter.getMyRecipes(url: myUrl, completionHandler: { [weak self] recipes, error in
          
            if let error = error {
                print("vie did load",error)
            } else {
                guard let resualt = recipes else { return }
                self?.recipesList = resualt.hits ?? []
                self?.filteredList = self?.recipesList ?? []
                self!.recipeTableView.reloadData()
                
            }
        })
        
        
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredList = []
        if searchText == ""{
            filteredList = recipesList
        }
        for myRecipe in recipesList{
            if (myRecipe.recipe?.label.lowercased().contains(searchText.lowercased()))!{
                filteredList.append(myRecipe)
            }
        }
        
        self.recipeTableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myIndex=recipeTableView.indexPathForSelectedRow
        let detailesScreen:DetailesViewController=segue.destination as! DetailesViewController
        detailesScreen.myRecipe = recipesList[myIndex!.row]
      }

   
    
    
    
    
}

