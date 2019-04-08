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
/*
protocol RingDelegate {
    func possess()
    func lose()
    func getDestroyed()
}

class TheOneRing {
    var delegate: RingDelegate?
    
    func changeOwner(ringDelegate: RingDelegate) {
        delegate?.lose()
        delegate = ringDelegate
        delegate?.possess()
    }
    
    func touchLava() {
        delegate?.getDestroyed()
    }
    
    func lost() {
        delegate?.lose()
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

class Gollum: RingDelegate {
    func possess() {
        print("- It's so beautiful, my precious")
    }
    
    func lose() {
        print("- NOOO, THEY STOLE IT FROM US, STUPID HOBBITS, WHERE IS MY PRECIOUS")
    }
    
    func getDestroyed() {
        print("- Gollum: My preciouuuuss...")
    }
}

class Frodo: RingDelegate {
    func possess() {
        print("- Frodo: What is that?")
    }
    
    func lose() {
        print("- Frodo: SAM, I LOST THE RING!")
    }
    
    func getDestroyed() {
        print("- Frodo: We've made it Sam, it's over")
    }
    
    func throwRing(ring: TheOneRing) {
        ring.touchLava()
    }
}



class MiddleEarth {
    let sauron: Sauron
    let gollum: Gollum
    let frodo: Frodo
    var ring: TheOneRing?
    
    init() {
        self.sauron = Sauron()
        self.gollum = Gollum()
        self.frodo = Frodo()
    }
    
    func createTheOneRing() {
        print("- In the depth of Mount Doom, Sauron created The One Ring of power...")
        ring = TheOneRing()
        ring?.changeOwner(ringDelegate: sauron)
    }
    
    func gollumGetTheRing() {
        print("- Gollum killed his friend, got the ring and kept it in a dark and deep cavern")
        ring?.changeOwner(ringDelegate: gollum)
    }
    
    func frodoGetTheRing() {
        print("Bilbo gave the ring to Frodo")
        ring?.changeOwner(ringDelegate: frodo)
    }
    
    func theEndOfAllThings() {
        print("With all his courage, Frodo thrown the ring into the fire of Mount Doom")
        if let ringExists = ring {
            ringExists.touchLava()
        } else {
            ring?.lost()
        }
    }
    
    func tellHistory() {
        self.createTheOneRing()
        self.gollumGetTheRing()
        self.frodoGetTheRing()
        self.theEndOfAllThings()
    }
}

var middleearth: MiddleEarth = MiddleEarth()
middleearth.tellHistory()
*/

/*class GameManager {
    static let instance: GameManager = GameManager()
    var currentLevel = 1
    
    func goToLevel(level: Int){
        self.currentLevel = level
    }
}
​​​​
print(GameManager.instance.currentLevel)
GameManager.instance.goToLevel(level:5)
print(GameManager.instance.currentLevel)*/

// Mdp admin : 987k@ap*JF

/*
 (Regular) Optionals
 Declaration: var opt: Type?
 
 Unsafely unwrapping: let x = opt!.property // error if opt is nil
 Safely testing existence : if opt != nil { ... someFunc(opt!) ... } // no error
 Safely unwrapping via binding: if let x = opt { ... someFunc(x) ... } // no error
 Safely chaining: var x = opt?.property // x is also Optional, by extension
 Safely coalescing nil values: var x = opt ?? nonOpt
*/

/*class Address {
    let streetName: String
    let streetNumber: String
    let buildingName: String?
    let entranceNumber: String?
    let floorNumber: String?
    
    init (streetName: String,
          streetNumber: String,
          buildingName: String? = nil,
          entranceNumber: String? = nil,
          floorNumber: String? = nil) {
        self.streetName = streetName
        self.streetNumber = streetNumber
        self.buildingName = buildingName
        self.entranceNumber = entranceNumber
        self.floorNumber = floorNumber
    }
    
    func buildAddress() -> String {
        let result: String = "\(streetNumber) \(streetName) \(buildingName ?? "") \(entranceNumber ?? "") \(floorNumber ?? "")"
        return result
    }
}

let address: Address = Address(streetName:"rue du Steeve",streetNumber:"28bis")
print(address.buildAddress())
*/
/*
import UIKit

protocol DownloadDelegate {
    func didFinishDownloadWithSuccess()
    func didFinishDownloadWithError()
}

class DownloadManager {
    var delegate: DownloadDelegate?
    
    func download(url: String) {
        if url.isEmpty {
            delegate?.didFinishDownloadWithError()
        } else {
            delegate?.didFinishDownloadWithSuccess()
        }
    }
}

class DatasViewController : DownloadDelegate {
    let downloadManager: DownloadManager = DownloadManager()
    
    init() {
        downloadManager.delegate = self
        downloadManager.download(url: "https://www.google.com")
        downloadManager.download(url: "")
    }
    
    func didFinishDownloadWithSuccess() {
        print("Download finished with Success")
    }
    
    func didFinishDownloadWithError() {
        print("Download finished with Error")
    }
}

DatasViewController()
*/
/*
class GameContext {
    var nbOfLifeRemaining: Int
    var playerNickname: String
    static let currentGame = GameContext(nbOfLifeRemaining: 5, playerNickname: "")
    
    private init (nbOfLifeRemaining: Int,playerNickname: String) {
        self.nbOfLifeRemaining = nbOfLifeRemaining
        self.playerNickname = playerNickname
    }
    
    func addOneLife() {
        nbOfLifeRemaining += 1
    }
    
    func removeOneLife() {
        nbOfLifeRemaining = nbOfLifeRemaining<1 ? 0 : nbOfLifeRemaining-1
        if nbOfLifeRemaining==0 { print("Game Over") }
    }
    
    func printStatus() {
        if (self.playerNickname=="") {
            print("Welcome, player.")
        } else {
            print("\(self.playerNickname) has now \(self.nbOfLifeRemaining) lifes remaining.")
        }
    }
}

class Enemy {
    var count: Int
    init(count: Int=0) {
        self.count = count
    }
    
    func attack() {
        switch(count%3) {
        case 0:
            print("Ayaaa ! *tchak*")
            break
        case 1:
            print("Ayaaa ! *smash*")
            break
        case 2:
            print("Ayaaa ! *plong*")
            break
        default:
            print("Ayaaa ! *tching*")
            break
        }
        self.count += 1
        GameContext.currentGame.removeOneLife()
    }
}

class Game {
    let enemy: Enemy
    
    init (enemy: Enemy) {
        self.enemy = enemy
    }
    
    func chooseANickname(nickname: String) {
        GameContext.currentGame.playerNickname = nickname
    }
    
    func findAndTakeLife() {
        GameContext.currentGame.addOneLife()
    }
    
    func play() {
        self.chooseANickname(nickname: "Jackson Maxwell")
        self.findAndTakeLife()
        self.enemy.attack()
    }
}

var regis: Enemy = Enemy()
let play: Game = Game(enemy: regis)
GameContext.currentGame.printStatus()

play.play()
GameContext.currentGame.printStatus()
regis.attack()
regis.attack()
regis.attack()
regis.attack()
GameContext.currentGame.printStatus()

// Winter is coming...
regis.attack()
*/
