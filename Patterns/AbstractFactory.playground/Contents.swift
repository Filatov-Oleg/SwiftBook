protocol Car {
    func drive()
}

class LittleCar: Car {
    func drive() {
         print("drive a little size car")
    }
}

class MiddleCar: Car {
    func drive() {
         print("drive a middle size car")
    }
}

protocol Bus {
    func drive()
}

class LittleBus: Bus {
    func drive() {
         print("drive a little size Bus")
    }
}

class MiddleBus: Bus {
    func drive() {
         print("drive a middle size Bus")
    }
}

protocol Factory {
    func produceBus() -> Bus
    func produceCar() -> Car
}

class LittleFactory: Factory {
    func produceBus() -> Bus {
        print("little bus is created")
        return LittleBus()
    }
    func produceCar() -> Car {
        print("little car is created")
        return LittleCar()
    }
}

class MiddleFactory: Factory {
    func produceBus() -> Bus {
        print("Middle bus is created")
        return MiddleBus()
    }
    func produceCar() -> Car {
        print("Middle car is created")
        return MiddleCar()
    }
}

let littleFactory = LittleFactory()
let littleCar = littleFactory.produceCar()
littleCar.drive()

let middleFactory = MiddleFactory()
let middleBus = middleFactory.produceBus()
middleBus.drive()
