protocol Coworker {
    func hire(cowoker: Coworker)
    func getInfo()
    var lvl: Int { get }
}

//branch
class Manager: Coworker {
    private var cowokers = [Coworker]()
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }

    func hire(cowoker: Coworker) {
        self.cowokers.append(cowoker)
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager" )
        for cowoker in cowokers {
            cowoker.getInfo()
        }
    }
}

//leaf
class LowLevelManager: Coworker {
    var lvl: Int

    init(lvl: Int) {
        self.lvl = lvl
    }

    func hire(cowoker: Coworker) {
        print("can't hire")
    }

    func getInfo() {
        print(self.lvl.description + " level manager" )
    }
}

let  topManager = Manager(lvl: 1)
let managerLvl2 = Manager(lvl: 2)
let managerLvl3_1 = Manager(lvl: 3)
let managerLvl3_2 = Manager(lvl: 3)
let managerLvl10 = Manager(lvl: 10)
let managerLvl11 = Manager(lvl: 11)
let managerLowLevel = LowLevelManager(lvl: 12)

topManager.hire(cowoker: managerLvl2)
managerLvl2.hire(cowoker: managerLvl3_1)
managerLvl2.hire(cowoker: managerLvl3_2)
managerLvl3_1.hire(cowoker: managerLvl10)
managerLvl10.hire(cowoker: managerLowLevel)
// managerLowLevel.hire(cowoker: managerLvl11) //"can't hire"

//managerLvl3_2.hire(cowoker: topManager)

topManager.getInfo()
print("--\\--\\--\\--\\--")
