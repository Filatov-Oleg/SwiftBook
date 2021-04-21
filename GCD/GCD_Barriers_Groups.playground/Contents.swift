import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//Barriers
//class SafeArray<Element> {
//    private var array = [Element]()
//    private let queue = DispatchQueue(label: "DispatchBarrier", attributes: .concurrent)
//
//    public func append(element: Element) {
//        queue.async(flags: .barrier) {
//            self.array.append(element)
//        }
//    }
//
//    public var elements: [Element]{
//        var result = [Element]()
//        queue.sync {
//            result = self.array
//        }
//        return result
//    }
//}
//
//var safeArray = SafeArray<Int>()
//DispatchQueue.concurrentPerform(iterations: 10) { (index) in
//    safeArray.append(element: index)
//}
//print("safeArray: \(safeArray.elements)")
//
//var array = [Int] ()
//DispatchQueue.concurrentPerform(iterations: 10) { (index) in
//    array.append(index)
//}
//print("array: \(array)")



//GROUPS

//let queue = DispatchQueue(label: "ry.swiftbook", attributes: .concurrent)
//let group = DispatchGroup()
//
//queue.async(group: group){
//    for i in 0...10{
//        if i == 10{
//            print(i)
//        }
//    }
//}
//
//queue.async(group: group){
//    for i in 0...20{
//        if i == 20{
//            print(i)
//        }
//    }
//}
//
//group.notify(queue: .main){
//    print("Все закончено в группе: group")
//}
//
//
//let secondGroup = DispatchGroup()
//secondGroup.enter()
//queue.async(group: group){
//    for i in 0...30{
//        if i == 30{
//            print(i)
//            secondGroup.leave()
//        }
//    }
//}
//
//let result = secondGroup.wait(timeout: .now()+3)
//print(result)
//
//secondGroup.notify(queue: .main) {
//    print("Все закончено в группе: secondgroup")
//}
//
//print("Этот принт должен быть выше чем последний")
//
//secondGroup.wait()

//BLOCKS
//let workItem = DispatchWorkItem(qos: .utility, flags: .detached) {
//    print("Performin workitem")
//}
//
//workItem.perform()
//
//let queue = DispatchQueue(label: "ru.swiftbook", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem, target: DispatchQueue.global(qos: .userInitiated))
//
//queue.asyncAfter(deadline: .now() + 1, execute: workItem)
//
//workItem.notify(queue: .main) {
//    print("workitem is completed")
//}
//
//workItem.isCancelled
//workItem.cancel()
//workItem.isCancelled
//
//workItem.wait() // далее код не будет выполняться, пока не будет выполнен workItem

//SEMAPHORES

let queue = DispatchQueue(label: "ru.swiftbook.semaphores", attributes: .concurrent)

let semaphore = DispatchSemaphore(value: 2)

queue.async {
    semaphore.wait(timeout: .distantFuture)
    Thread.sleep(forTimeInterval: 4)
    print("Block 1")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    Thread.sleep(forTimeInterval: 2)
    print("Block 2")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("Block 3")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("Block 4")
    semaphore.signal()
}

//SOURCE (источники отправки)

//let queue = DispatchQueue(label: "ru.swiftbook.sources", attributes: .concurrent)
//
//let timer = DispatchSource.makeTimerSource(queue: queue)
//
//timer.schedule(deadline: .now(), repeating: .seconds(2), leeway: .milliseconds(300))
//timer.setEventHandler {
//    print("Hello, World!")
//}
//
//timer.setCancelHandler {
//    print("Timer is cancelled")
//}
//
//timer.resume()

//print("🐈")
//DispatchQueue.global().async {
//    print("😎")
//}
//
//print("⚽️")
