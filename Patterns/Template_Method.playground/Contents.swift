
protocol DriveVehicle {
    func haveASeat()
    func closeTheDoor()
    func useProtection()
    func lookAtTheMirrow()
    func turnSignal()
    func driveForward()
    func startVehicle()
}

extension DriveVehicle {
    func startVehicle() {
        haveASeat()
        useProtection()
        lookAtTheMirrow()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        preconditionFailure("this method should be overriden")
    }
    
    func closeTheDoor() {
    }
    
    func useProtection() {
        preconditionFailure("this method should be overriden")
    }
    
    func lookAtTheMirrow() {
        preconditionFailure("this method should be overriden")
    }
    
    func turnSignal() {
        preconditionFailure("this method should be overriden")
    }
    
    func driveForward() {
        preconditionFailure("this method should be overriden")
    }
}

class Bicycle: DriveVehicle {
    func haveASeat() {
        print("sit down on a bicycle seat")
    }
    
    func useProtection() {
        print("wear a helmet")
    }
    
    func lookAtTheMirrow() {
        print("look at the little mirrow")
    }
    
    func turnSignal() {
        print("show left hand")
    }
    
    func driveForward() {
        print("DRIVE")
    }
}

class Car: DriveVehicle {
    func haveASeat() {
        print("sit down on a car seat")
        closeTheDoor()
    }
    
    func closeTheDoor() {
        print("close the door")
    }
    
    func useProtection() {
        print("fasten seat belt")
    }
    
    func lookAtTheMirrow() {
        print("look at the rearview mirrow")
    }
    
    func turnSignal() {
        print("turn on left turn light")
    }
    
    func driveForward() {
        print("DRIVE")
    }
}

let car = Car()
let bicycle = Bicycle()

car.startVehicle()
print("#########")
bicycle.startVehicle()
