import UIKit

var components = DateComponents()
let dateFormatter = DateFormatter()

components.day = 26
components.month = 5
components.year = 1990

dateFormatter.dateFormat = "dd MMMM yyyy"

let birthday = Calendar.current.date(from: components)
let birthdayString = dateFormatter.string(from: birthday!)

print("Je suis né le \(birthdayString)")


