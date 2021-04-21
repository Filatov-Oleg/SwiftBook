class Driver {
    let isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
}


class Car {
    var goodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    private let drivers = [Driver(isGood: true, name: "Mark"),
                           Driver(isGood: false, name: "Ivan"),
                           Driver(isGood: true, name: "Maria"),
                           Driver(isGood: false, name: "Morgan")]
 }

extension Car: Sequence {
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
}

class GoodDriverIterator: IteratorProtocol {
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter{$0.isGoodDriver} // $0.isGoodDriver != true ($0.isGoodDriver == false) для поиска плохих водителей 
    }
    func next() -> Driver? {
        defer { // срабатывает после выхода из метода
            current += 1
        }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver]{
        return drivers
    }
    
}

let car = Car()

let goodDriverIterator = car.goodDriverIterator.next()

let goodDriverIteratorViaSequence = car.makeIterator().allDrivers()

for driver in car {
    print(driver.name)
}

for driver in car {
    print(driver.isGoodDriver)
}
