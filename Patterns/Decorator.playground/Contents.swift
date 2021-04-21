

protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

class Boxter: Porsche {
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxter"
    }
}

class PorscheDecorator: Porsche {

    private let decoratedPorsche: Porsche
    
    required init(dp: Porsche) {
        self.decoratedPorsche = dp
    }
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
    
}

class PremiumAudioSystem: PorscheDecorator {
    required init(dp1: Porsche){
        super.init(dp: dp1)
    }
    
    required init(dp: Porsche) {
        fatalError("init(dp:) has not been implemented")
    }
    

    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    override func getDescription() -> String {
        return super.getDescription() + "with premium audio system "
    }
}

class PanoramicSunroof: PorscheDecorator {
    required init(dp1: Porsche){
        super.init(dp: dp1)
    }
    
    required init(dp: Porsche) {
        fatalError("init(dp:) has not been implemented")
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 20
    }
    override func getDescription() -> String {
        return super.getDescription() + "with panoramic sunroof"
    }
}

var porsheBoxter: Porsche = Boxter()
porsheBoxter.getDescription()
porsheBoxter.getPrice()

porsheBoxter = PremiumAudioSystem(dp1: porsheBoxter)
porsheBoxter.getDescription()
porsheBoxter.getPrice()

porsheBoxter = PanoramicSunroof(dp1: porsheBoxter)
porsheBoxter.getDescription()
porsheBoxter.getPrice()


