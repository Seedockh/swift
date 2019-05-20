import UIKit

let jsonString = """
{
    "name": "Bruce",
    "surname": "Wayne",
    "alias": "Batman",
    "close_relations": [
        {
            "full_name": "Alfred Pennyworth",
            "occupation": "butler"
        },
        {
            "full_name": "Jim Gordon",
            "occupation": "inspector"
        },
        {
            "full_name": "The Joker",
            "occupation": "arnachist"
        }
    ]
}
"""

struct Character: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case surname
        case alias
        case closeRelations = "close_relations"
    }
    
    struct Relation: Decodable {
        enum CodingKeys: String, CodingKey {
            case fullName = "full_name"
            case occupation
        }
        var fullName: String
        var occupation: String
    }
    
    var name: String
    var surname: String
    var alias: String
    var closeRelations: [Relation]
}

func parse() {
    if let data = jsonString.data(using: .utf8) {
        let decoder = JSONDecoder()
        if let character = try? decoder.decode(Character.self,from: data) {
            print(character.name)
            for relation in character.closeRelations {
                print(relation.fullName)
                print(relation.occupation)
            }
        }
        
    } else {
        print("Could'nt generate datas")
    }
}

parse()

