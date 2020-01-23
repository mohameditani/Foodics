
import Foundation
import SwiftyJSON

// MARK: - Category
class Category: NSObject,NSCoding {

    let nameLocalizedParsingKey = "nameLocalized"
    let nameParsingKey = "name"
    let updatedAtParsingKey = "updatedAt"
    let deletedAtParsingKey = "deletedAt"
    let idParsingKey = "id"
    let createdAtParsingKey = "createdAt"
    let referenceParsingKey = "reference"

    let name, updatedAt, deletedAt, id: String?
    let createdAt, nameLocalized, reference: String?


    init(name: String?, updatedAt: String?, deletedAt: String?, id: String?, createdAt: String?, nameLocalized: String?, reference: String?) {
        self.name = name
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
        self.id = id
        self.createdAt = createdAt
        self.nameLocalized = nameLocalized
        self.reference = reference
    }
    
    //MARK: NSCoding
     
      func encode(with aCoder: NSCoder) {
         
         aCoder.encode(self.name, forKey: nameParsingKey)
         aCoder.encode(self.updatedAt, forKey: updatedAtParsingKey)
         aCoder.encode(self.deletedAt, forKey: deletedAtParsingKey)
         aCoder.encode(self.id, forKey: idParsingKey)
         aCoder.encode(self.createdAt, forKey: createdAtParsingKey)
         aCoder.encode(self.nameLocalized, forKey: nameLocalizedParsingKey)
         aCoder.encode(self.reference, forKey: referenceParsingKey)

     }
     
    required convenience init?(coder decoder: NSCoder) {

        let name = decoder.decodeObject(forKey: "name") as? String
        let updatedAt = decoder.decodeObject(forKey: "updatedAt") as? String
        let deletedAt = decoder.decodeObject(forKey: "deletedAt") as? String
        let id = decoder.decodeObject(forKey: "id") as? String
        let createdAt = decoder.decodeObject(forKey: "createdAt") as? String
        let nameLocalized = decoder.decodeObject(forKey: "nameLocalized") as? String
        let reference = decoder.decodeObject(forKey: "reference") as? String
        
        self.init(name:name,updatedAt:updatedAt,deletedAt:deletedAt,id:id,createdAt:createdAt,nameLocalized:nameLocalized,reference:reference)
           
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
