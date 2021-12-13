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

    func scareBirds() {
        for bird in birds {
            if let bird = bird as? FlyProtocol {
                bird.fly()
            } else {
                if let bird = bird as? WalkProcotol {
                    bird.walk()
                }
                else {
                    print("Bird is dead")
                }
            }
        }
    }
}

let street1 = CorrectStreet(birds: [CorrectPigeon(), CorrectPigeon(), CorrectPenguin()])
street1.scareBirds()
// MARK: CORRECT IMPLEMENTATION

