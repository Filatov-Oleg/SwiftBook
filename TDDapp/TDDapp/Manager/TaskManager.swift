//
//  TaskManager.swift
//  TDDapp
//
//  Created by Олег Филатов on 15.03.2021.
//

class TaskManager {
    var tasksCount: Int {
        return tasks.count
    }
    var doneTasksCount: Int {
        return doneTasks.count
    }
    private var tasks: [Task] = []
    private var doneTasks: [Task] = []
    
    func add(task: Task) {
        if !tasks.contains(task) {
            self.tasks.append(task)
        }
    }
    
    func task(at index: Int) -> Task {
        return self.tasks[index]
    }
    
    func checkTask(at index: Int) {
        let task = self.tasks.remove(at: index)
        self.doneTasks.append(task)
    }
    
    func uncheckTask(at index: Int) {
        let task = self.doneTasks.remove(at: index)
        self.tasks.append(task)
    }
    
    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }
    
    func removeAll() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
    
}
