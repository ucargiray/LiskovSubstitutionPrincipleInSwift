//
//  main.swift
//  LiskovSubstitionPrinciple
//
//  Created by Giray UÇAR on 13.12.2021.
//

import Foundation

// MARK: WRONG IMPLEMENTATION
protocol BirdProtocol {
    func walk()
    func fly()
}

class Penguin: BirdProtocol {
    func walk() {
        print("Pengiun walking")
    }

    func fly() {
        fatalError("Pengiun's can't fly")
    }
}

class Pigeon: BirdProtocol {
    func walk() {
        print("Pigeon is walking")
    }

    func fly() {
        print("Pigeon is flying")
    }
}

class Street {

    var birds: [BirdProtocol]

    init(birds: [BirdProtocol]) {
        self.birds = birds
    }

    func scareBirds() {
        for bird in birds {
            bird.fly()
        }
    }
}
// MARK: WRONG IMPLEMENTATION



// MARK: CORRECT IMPLEMENTATION
class CorrectBird {
    var typeName : String
    
    init(typeName : String) {
        self.typeName = typeName
    }
}
protocol FlyProtocol {
    func fly()
}
protocol WalkProcotol {
    func walk()
}
class CorrectPenguin: CorrectBird, WalkProcotol {
    func walk() {
        print("Pengiun is walking")
    }
}

class CorrectPigeon: CorrectBird, WalkProcotol, FlyProtocol {
    func walk() {
        print("Pigeon is walking")
    }

    func fly() {
        print("Pigeon is flying")
    }
}

class CorrectStreet {

    var birds: [CorrectBird]

    init(birds: [CorrectBird]) {
        self.birds = birds
    }
    
    func checkIfBirdCanFly(the bird : CorrectBird) -> Bool {
        if bird is FlyProtocol {
            return true
        }
        else {
            return false
        }
    }
    
    func printFullDesriptionAfterScaring(the bird : CorrectBird) {
        if checkIfBirdCanFly(the: bird) {
            print("\(bird.typeName) is flying")
        } else {
            print("\(bird.typeName) is walking")
        }
    }

    func scareBirds() {
        for bird in birds {
            printFullDesriptionAfterScaring(the : bird)
        }
    }
}

let street1 = CorrectStreet(birds: [CorrectPigeon(typeName: "Pigeon Type 1"), CorrectPigeon(typeName: "Pigeon Type 2"), CorrectPenguin(typeName: "Pengiun Type 1")])
street1.scareBirds()
// MARK: CORRECT IMPLEMENTATION

