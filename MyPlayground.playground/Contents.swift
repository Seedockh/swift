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

/*enum TrainType {
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
        print("Welcome to \(name) station")    }
    
    func printTrains() {
        print("----------- TRAINS LIST -----------")
        for train in trains {
            print("Train \(train.type) n°\(train.idNumber)")
        }
    }
    
    func addTrain(train: Train) {
        print("Brace yourself, the train \(train.type) number \(train.idNumber) is entering the station.")
        print("Please clear the edge of the platform.")
        trains.append(train)
    }
    
    func removeTrain(idNumber: Int) {
        if let leavingTrain = trains.first(where: { $0.idNumber == idNumber }) {
            print("Ladies and Gentleman, the train \(leavingTrain.type) number \(leavingTrain.idNumber) is leaving, please mind the doors closing.")
            self.trains = self.trains.filter{$0.idNumber != idNumber}
        } else {
            print("We are unable to find the train number \(idNumber)")
        }
        // or use for and enumerated()
    }
}

let trainNeuf: Train = Train(type: TrainType.TGV, idNumber: 2638)
let trainPassable: Train = Train(type: TrainType.intercity, idNumber: 65446)
let trainToutMoche: Train = Train(type: TrainType.TER, idNumber: 9999)
let trainAncien: Train = Train(type: TrainType.unknown, idNumber: 321654)

let parisMarseille: Station = Station(name: "Paris - Marseille", trains: [trainNeuf,trainPassable])

parisMarseille.addTrain(train: trainToutMoche)
parisMarseille.addTrain(train: trainAncien)
parisMarseille.printTrains()

parisMarseille.removeTrain(idNumber: 2638)
parisMarseille.printTrains()*/
/*
func method(value: Int?) {
    guard let check: Int = value else {
        print("This is a nil value.")
        return
    }
    print("My value is worth \(value)")
}

var value: Int? = nil
method(value: value)

value = 50
method(value: value)
*/
/*
protocol Eatable {
    func eat()
}

class Banana: Eatable {
    init() {  }
    func eat() {
        print("I hate Banana")
    }
}
class Pizza: Eatable {
    func eat() {
        print("I love Pizza")
    }
}
class Burger: Eatable {
    func eat() {
        print("I like Burger")
    }
}

let banana: Banana = Banana()
let pizza: Pizza = Pizza()
let burger: Burger = Burger()
let food: [Eatable] = [banana,pizza,burger]

for f in food {
    f.eat()
}*/

protocol RingDelegate {
    func possess()
    func lose()
    func getDestroyed()
}

class TheOneRing {
    let delegate: RingDelegate?
    
    func changeOwner(ringDelegate: RingDelegate) {
        currentOwner.lose()
        newOwner.possess()
    }
}

class Sauron: RingDelegate {
    func possess() {
        print("- Sauron: THE MIDDLE EARTH WILL BE MIIIIINE !!")
    }
    
    func lose() {
        print("- Sauron: THIS IS NOT THE END, THERE'S NOWHERE YOU'LL BE SAFE")
    }
    
    func getDestroyed() {
        print("- Sauron: AAAAAAAAAAAAAAAAAARGGGGGH...BOOM")
    }
}

class MiddleEarth {
    let sauron: Sauron
    var ring: TheOneRing?
    guard let theonering: TheOneRing = ring else { return }
    
    init(sauron: Sauron) {
        self.sauron = sauron
    }
    
    func createTheOneRing() {
        print("- In the depth of Mount Doom, Sauron created The One Ring of power...")
    }
    
    theonering.changeOwner(ringdelegate: sauron)
}

let sauron: Sauron = Sauron()
let middleearth: MiddleEarth = MiddleEarth(sauron: sauron)
middleearth.createTheOneRing()
