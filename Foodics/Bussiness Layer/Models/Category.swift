
import Foundation
import SwiftyJSON

// MARK: - Category
class Category: Codable {

    let name, updatedAt, deletedAt, id: String?
    let createdAt, nameLocalized, reference: String?

    enum CodingKeys: String, CodingKey {
        case name
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case id
        case createdAt = "created_at"
        case nameLocalized = "name_localized"
        case reference
    }

    init(name: String?, updatedAt: String?, deletedAt: String?, id: String?, createdAt: String?, nameLocalized: String?, reference: String?) {
        self.name = name
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
        self.id = id
        self.createdAt = createdAt
        self.nameLocalized = nameLocalized
        self.reference = reference
    }
    
    
    //MARK: Helpers
    
    func getName() -> String? {
                
        return Utils.isArabic() ? self.nameLocalized : self.name
    }
    
    //MARK: Parsing
    
    static func parseData(jsonArr:[JSON]) -> [Category] {
        
        var dataArr = [Category]()
        
        for dic in jsonArr {
                   
            let cat = Category.parseFromJson(dic: dic)
            dataArr.append(cat)
        }
        
        return dataArr
    }
    
    static func parseFromJson(dic:JSON) -> Category {
    
        let name = dic["name"].string ?? ""
        let id = dic["id"].string ?? ""
        let nameLocalized = dic["name_localized"].string ?? ""
        let reference = dic["reference"].string ?? ""

        let cat = Category.init(name: name, updatedAt: nil, deletedAt: nil, id: id, createdAt: nil, nameLocalized: nameLocalized, reference: reference)
    
        return cat
    }
    
}
