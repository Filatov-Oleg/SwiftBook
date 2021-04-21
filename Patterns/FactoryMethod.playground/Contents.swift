
protocol Vehicle {
    func drive()
}

class Car: Vehicle {
    func drive()  {
        print("drive a Car")
    }
}

class Truck: Vehicle {
    func drive()  {
        print("drive a Truck")
    }
}

class Bus: Vehicle {
    func drive() {
        print("drive a bus")
    }
}

protocol VehicleFactory {
    func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Car is created")
        return Car()
    }
}

class TruckFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Truck is created")
        return Truck()
    }
}

class BusFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Bus is created")
        return Bus()
    }
}

let carFactory = CarFactory()
let car = carFactory.produce()
car.drive()

let truckFactory = TruckFactory()
let truck = truckFactory.produce()

let busFactory = BusFactory()
let bus = busFactory.produce()
