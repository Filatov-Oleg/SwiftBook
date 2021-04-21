
// adaptee
class SimpleCar {
    func sound() -> String {
        return "tr-tr-tr-tr"
    }
}

//target
protocol SuperCarProtocol {
    func makeNoise() -> String
}

class SuperCar: SuperCarProtocol {
    func makeNoise() -> String {
        return "wroom-wroom"
    }
}

//adapter
class SuperCarAdaptor: SuperCarProtocol {
    
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    
    func makeNoise() -> String {
        return self.simpleCar.sound()
    }
}

var simpleCar = SimpleCar()
print(simpleCar.sound())
var adaptSimpleCar = SuperCarAdaptor(simpleCar: simpleCar)
print(adaptSimpleCar.simpleCar.sound())
print(adaptSimpleCar.makeNoise())
