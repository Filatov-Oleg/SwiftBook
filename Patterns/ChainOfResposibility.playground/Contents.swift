class Enemy {
    let strength = 600
}

protocol MilitaryChain {
    var strength: Int {get}
    var nextRank: MilitaryChain? {get set}
    func shouldDefeatWithStrenght(amount: Int)
}

class Soldier: MilitaryChain {
    var strength = 100
    var nextRank: MilitaryChain?
    func shouldDefeatWithStrenght(amount: Int) {
        if amount < strength {
            print("Soldier got it")
        } else {
            nextRank?.shouldDefeatWithStrenght(amount: amount)
        }
    }
}

class Officer: MilitaryChain {
    var strength = 500
    var nextRank: MilitaryChain?
    func shouldDefeatWithStrenght(amount: Int) {
        if amount < strength {
            print("Officer got it")
        } else {
            nextRank?.shouldDefeatWithStrenght(amount: amount)
        }
    }
}

class General: MilitaryChain {
    var strength = 1000
    var nextRank: MilitaryChain?
    func shouldDefeatWithStrenght(amount: Int) {
        if amount < strength {
            print("General got it")
        } else {
            print("We can't defeat this enemy")
        }
    }
}

let enemy = Enemy()
let solider = Soldier()
let officer = Officer()
let general = General()

solider.nextRank = officer
officer.nextRank = general

solider.shouldDefeatWithStrenght(amount: enemy.strength)

