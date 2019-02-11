/*func first (arr: [String]) {
    print(arr.first!)
}

func all (arr: [String]) {
    for el in arr {
        print(el)
    }
}

var strings: [String] = ["Oui","Non","Peut-être","Je ne sais pas","Pourquoi pas"]

strings.append("J'avoue")

first(arr: strings)
all(arr: strings) */

/*var ledico : [Int: String] = [:]
ledico[0] = "kiwi"
ledico[1] = "banana"
ledico[2] = "apple"
ledico[3] = "strawberry"

print(ledico[2] ?? "")

var keys: [Int] = Array(ledico.keys)

print(keys)
keys.sort { (n1,n2) -> Bool in return n1 < n2 }
print(keys) */

/*class User {
    var name : String
    var surname: String
    var age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
    func presentation () -> String {
        return "Bonjour, je m'appelle \(name) \(surname) et j'ai \(age) ans."
    }
}

let james = User (name: "McAvoy", surname: "James", age: 40)
print(james.presentation())

*/
/*
class Unwrapp {
    var fruit: String?
    var myFavorite: String
    
    init (fruit: String?, myFavorite: String) {
        self.fruit = fruit
        self.myFavorite = myFavorite
    }
    
    func interrogation () {
        let unwrapped: String = fruit ?? "(null)"
        print(myFavorite+unwrapped)
    }
    
    func exclamation () {
        if fruit != nil {
            let unwrapped: String = fruit!
            print(myFavorite+unwrapped)
        }
        print("Error. Cépabien.")
    }
    
    func guardLet () {
        guard let unwrapped: String = fruit else {
            print("Error. Cépabien.")
            return
        }
        print(myFavorite+unwrapped)
    }
    
    func ifLet () {
        if let unwrapped = fruit { print(myFavorite+unwrapped) }
        else { print("Error. Cépabien.") }
    }
}

let wrapToUnwrap = Unwrapp(fruit: nil, myFavorite: "My favorite fruit is ")

wrapToUnwrap.interrogation()
wrapToUnwrap.exclamation()
wrapToUnwrap.guardLet()
wrapToUnwrap.ifLet()
*/

/*enum Fruit {
    case ananas
    case kiwi
    case apple
    case strawberry
    
    func eat () {
        switch self {
        case .ananas : print("Chaud, ananas.")
        case .kiwi : print("Kiwipedia.")
        case .apple : print("Apple pen.")
        case .strawberry : print("When rasp ain't good enough.")
        }
    }
}

let choice: Fruit = Fruit.kiwi
choice.eat()
*/

enum TrainType {
    case TGV
    case intercity
    case TER
    case unknown
}

class Train {
    var type: TrainType
    var idNumber: Int
    
    init (type: TrainType, idNumber: Int) {
        self.type = type
        self.idNumber = idNumber
    }
}

class Station {
    var name: String
    var trains: [Train]
    
    init (name: String, trains: [Train]) {
        self.trains = trains
        self.name = name
        print("Welcome to \(name) station")
    }
    
    func addTrain(train: Train) {
        print("Brace yourself, the train \(train.type) number \(train.idNumber) is entering the station.")
        print("Please clear the edge of the platform.")
        trains.append(train)
    }
    
    func removeTrain(idNumber: Int) {
        var leavingTrain: Train
        var found: Bool = false
        
        for t in trains {
            if t.idNumber == idNumber {
                leavingTrain = t
                found = true
            }
        }
        if !found {
            print("We are unable to find the train number \(idNumber)")
        } else {
            print("Ladies and Gentleman, the train \(leavingTrain.type) number \(leavingTrain.idNumber) is leaving, please mind the doors closing.")
            
        }
    }
}


