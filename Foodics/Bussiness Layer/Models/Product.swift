// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let product = try? newJSONDecoder().decode(Product.self, from: jsonData)

import Foundation
import SwiftyJSON

// MARK: - Product
class Product: Codable {
    let nameLocalized: String?
    let sku: String?
    let isReady,isStockProduct, isActive: Bool?
    let id, image, deletedAt: String?
    let sellingMethod, price , costingMethod , pricingMethod: Int?
    let barcode, preparationTime: String?
    let createdAt, name, calories, updatedAt: String?
    let descriptionLocalized, productDescription: String?
    let category: Category?
    let cost: Double?
    
    //MARK: Helpers
    
    func getName() -> String? {
                
        return Utils.isArabic() ? self.nameLocalized : self.name
    }
    
    //MARK: Parsing
       
       static func parseData(jsonArr:[JSON]) -> [Product] {
           
           var dataArr = [Product]()
           
           for dic in jsonArr {
            
               let sellingMethod = dic["selling_method"].int ?? 0
               let price = dic["price"].int ?? 0
               let costingMethod = dic["costing_method"].int ?? 0
               let pricingMethod = dic["pricing_method"].int ?? 0

               let nameLocalized = dic["name_localized"].string ?? ""
               let sku = dic["sku"].string ?? ""
               let id = dic["id"].string ?? ""
               let image = dic["image"].string ?? ""
               let deletedAt = dic["deleted_at"].string ?? ""
               let barcode = dic["barcode"].string ?? ""
               let preparationTime = dic["preparation_time"].string ?? ""
               let createdAt = dic["created_at"].string ?? ""
               let name = dic["name"].string ?? ""
               let calories = dic["calories"].string ?? ""
               let updatedAt = dic["updated_at"].string ?? ""
               let descriptionLocalized = dic["description_localized"].string ?? ""
               let productDescription = dic["product_description"].string ?? ""

            
               let isReady = dic["is_ready"].bool ?? false
               let isStockProduct = dic["is_stock_product"].bool ?? false
               let isActive = dic["is_active"].bool ?? false
                           
                let cost = dic["is_active"].double ?? 0.0
            
                let cat = Category.parseFromJson(dic: dic["category"])
                
                let product = Product.init(nameLocalized: nameLocalized, isReady: isReady, costingMethod: costingMethod, sku: sku, isStockProduct: isStockProduct, isActive: isActive, id: id, image: image, deletedAt: deletedAt, sellingMethod: sellingMethod, price: price, barcode: barcode, preparationTime: preparationTime, pricingMethod: pricingMethod, createdAt: createdAt, name: name, calories: calories, updatedAt: updatedAt, descriptionLocalized: descriptionLocalized, productDescription: productDescription, category: cat, cost: cost)
            
                dataArr.append(product)
            
           }
           
           
           return dataArr
           
       }

    enum CodingKeys: String, CodingKey {
        case nameLocalized = "name_localized"
        case isReady = "is_ready"
        case costingMethod = "costing_method"
        case sku
        case isStockProduct = "is_stock_product"
        case isActive = "is_active"
        case id, image
        case deletedAt = "deleted_at"
        case sellingMethod = "selling_method"
        case price, barcode
        case preparationTime = "preparation_time"
        case pricingMethod = "pricing_method"
        case createdAt = "created_at"
        case name, calories
        case updatedAt = "updated_at"
        case descriptionLocalized = "description_localized"
        case productDescription = "description"
        case category, cost
    }
    
   

    init(nameLocalized: String?, isReady: Bool?, costingMethod: Int?, sku: String?, isStockProduct: Bool?, isActive: Bool?, id: String?, image: String?, deletedAt: String?, sellingMethod: Int?, price: Int?, barcode: String?, preparationTime: String?, pricingMethod: Int?, createdAt: String?, name: String?, calories: String?, updatedAt: String?, descriptionLocalized: String?, productDescription: String?, category: Category?, cost: Double?) {
        self.nameLocalized = nameLocalized
        self.isReady = isReady
        self.costingMethod = costingMethod
        self.sku = sku
        self.isStockProduct = isStockProduct
        self.isActive = isActive
        self.id = id
        self.image = image
        self.deletedAt = deletedAt
        self.sellingMethod = sellingMethod
        self.price = price
        self.barcode = barcode
        self.preparationTime = preparationTime
        self.pricingMethod = pricingMethod
        self.createdAt = createdAt
        self.name = name
        self.calories = calories
        self.updatedAt = updatedAt
        self.descriptionLocalized = descriptionLocalized
        self.productDescription = productDescription
        self.category = category
        self.cost = cost
    }
    
    
}

