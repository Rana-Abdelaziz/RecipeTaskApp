// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipeModel = try? newJSONDecoder().decode(RecipeModel.self, from: jsonData)

import Foundation

// MARK: - RecipeModel
class RecipeModel: Codable {
    let q: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]

    init(q: String, from: Int, to: Int, more: Bool, count: Int, hits: [Hit]) {
        self.q = q
        self.from = from
        self.to = to
        self.more = more
        self.count = count
        self.hits = hits
    }
}

// MARK: - Hit
class Hit: Codable {
    var recipe: Recipe?

   
}

// MARK: - Recipe
class Recipe: Codable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let dietLabels, healthLabels, cautions, ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories, totalWeight, totalTime: Double
    let cuisineType: [String]
    let mealType: [MealType]
    let dishType: [String]
    let totalNutrients, totalDaily: [String: Total]
    let digest: [Digest]

   
}

// MARK: - Digest
class Digest: Codable {
    let label, tag: String
    let schemaOrgTag: SchemaOrgTag?
    let total: Double
    let hasRDI: Bool
    let daily: Double
    let unit: Unit
    let sub: [Digest]?

    init(label: String, tag: String, schemaOrgTag: SchemaOrgTag?, total: Double, hasRDI: Bool, daily: Double, unit: Unit, sub: [Digest]?) {
        self.label = label
        self.tag = tag
        self.schemaOrgTag = schemaOrgTag
        self.total = total
        self.hasRDI = hasRDI
        self.daily = daily
        self.unit = unit
        self.sub = sub
    }
}

enum SchemaOrgTag: String, Codable {
    case carbohydrateContent = "carbohydrateContent"
    case cholesterolContent = "cholesterolContent"
    case fatContent = "fatContent"
    case fiberContent = "fiberContent"
    case proteinContent = "proteinContent"
    case saturatedFatContent = "saturatedFatContent"
    case sodiumContent = "sodiumContent"
    case sugarContent = "sugarContent"
    case transFatContent = "transFatContent"
}

enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

// MARK: - Ingredient
class Ingredient: Codable {
    let text: String
    let quantity: Double
    let measure: Measure?
    let food: String
    let weight: Double
    let foodCategory, foodID: String
    let image: String?

    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight, foodCategory
        case foodID = "foodId"
        case image
    }

    init(text: String, quantity: Double, measure: Measure?, food: String, weight: Double, foodCategory: String, foodID: String, image: String?) {
        self.text = text
        self.quantity = quantity
        self.measure = measure
        self.food = food
        self.weight = weight
        self.foodCategory = foodCategory
        self.foodID = foodID
        self.image = image
    }
}

enum Measure: String, Codable {
    case cup = "cup"
    case gram = "gram"
    case milliliter = "milliliter"
    case pound = "pound"
    case rib = "rib"
    case tablespoon = "tablespoon"
    case teaspoon = "teaspoon"
    case unit = "<unit>"
}

enum MealType: String, Codable {
    case breakfast = "breakfast"
    case lunchDinner = "lunch/dinner"
}

// MARK: - Total
class Total: Codable {
    let label: String
    let quantity: Double
    let unit: Unit

    init(label: String, quantity: Double, unit: Unit) {
        self.label = label
        self.quantity = quantity
        self.unit = unit
    }
}
