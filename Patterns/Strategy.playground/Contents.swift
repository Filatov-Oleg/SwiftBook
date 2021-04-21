

protocol SwimBehavior{
    func swim()
}

class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("professional swimming")
    }
}

class NonSwimmer: SwimBehavior {
    func swim() {
        print("non-swimmong")
    }
}

protocol DiveBehavior{
    func dive()
}

class ProfessionalDiver: DiveBehavior {
    func dive()  {
        print("professional diving")
    }
}

class NewbieDiver: DiveBehavior {
    func dive() {
        print("newbie divine")
    }
}

class NonDiving: DiveBehavior {
    func dive() {
        print("non-swimming")
    }
}

class Human {
    private var diveBehavior: DiveBehavior
    private var swimBehavior: SwimBehavior
    
    func performSwim() {
        self.swimBehavior.swim()
    }
    
    func performDive() {
        self.diveBehavior.dive()
    }
    
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    
    func run() {
        print("runnubg")
    }
    
    init(swimBehavior: SwimBehavior,  diveBehavior: DiveBehavior) {
        self.diveBehavior = diveBehavior
        self.swimBehavior = swimBehavior
    }
}

let human = Human(swimBehavior: ProfessionalSwimmer(), diveBehavior: ProfessionalDiver())
human.setSwimBehavior(sb: NonSwimmer())
human.performDive()
human.performSwim()
