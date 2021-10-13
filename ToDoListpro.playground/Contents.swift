import UIKit

enum status {
  case completed
  case pending
}
enum priority : String {
    case High
    case Low
    case Medium
}
struct List {
    let ID : Int
    var title: String
    var description: String?
    var date: String
    var time: String
    var priority : priority
    var status : status
   
}
class listOperation {
    var toDoList: [List]
    init(toDoList: List){
        self.toDoList = [toDoList]
    }
    func create(newList: [List]){
       // print("The new list is \(newList)")
    }
    func remove(remove: Int){
        toDoList.remove(at: remove)
    }
    func add(newItem: List){
        toDoList.append(newItem)
    }
    func update (index : Int , update : List){
        toDoList[index] = update
        //print("Updated \(toDoList)")
    }
    func getAllItems() {
        for item in toDoList {
            print("🗒\(item.title) ... \(item.time) ... \(item.priority) .. \(item.date)")}
    }
    func checkPriority(priority: priority){
        let filterByPriority = self.toDoList.filter({$0.priority == priority})
        for icon in filterByPriority {
            if priority == .High {
            print("Important!!: \(icon.title), at \(icon.time) is \(icon.priority)🔴🔴")}
            else if priority == .Medium {
                print("\(icon.title), at \(icon.time) is \(icon.priority)🟡🟡")}                                            else if priority == .Low {
                print("\(icon.title),at \(icon.time) is \(icon.priority)⚪️⚪️")}
        }
    }
    func checkStatus (status: status){
        let filterByStatus = self.toDoList.filter({$0.status == status})
        for statuses in filterByStatus {
            if status == .completed {
                print("\(statuses.title) You are \(statuses.status)✅")}
            else if status == .pending {
                print("\(statuses.title) \(statuses.status)❌")}
        }
    }
}


var myList = listOperation(toDoList: List(ID: 122, title: "Work", description: "daily work meeting", date:"Feb 20" , time: "10:00 AM", priority: .High, status: .completed ))
myList.add(newItem: List.init(ID: 122, title: "home", date: "Feb 20", time: "9:00 PM", priority: .Medium, status: .completed ))
myList.create(newList: [List(ID: 122, title: "office", description: "assign", date: "Feb 22", time: "8:00 AM", priority: .High, status: .pending)])
myList.remove(remove: 1)
myList.getAllItems()
myList.checkPriority(priority: .Medium)

var list1 = listOperation(toDoList: List.init(ID: 133, title: "school", date: "Feb 21", time: "7:00 AM", priority: .High, status: .completed))
list1.add(newItem: List.init(ID: 133, title: "Nursery school", date: "Feb 21", time: "12:00 PM", priority: .High, status: .pending))
list1.getAllItems()
list1.checkPriority(priority: .High)
list1.checkStatus(status: .pending)

var list2 = listOperation(toDoList: List(ID: 111, title: "Call your mother", description: "daily calling", date: "Feb 22", time: "4:00 PM", priority: .High, status: .pending))
list2.update(index: 0, update: List(ID: 111, title: "Call your mother", description: "daily calling", date:"Feb 22" , time: "4:30 PM", priority: .High, status: .completed))
list2.checkStatus(status: .completed)
list2.getAllItems()

var sundayList = listOperation(toDoList: List(ID: 122, title: "Meeting Inst", description: "daily work meeting", date:"Feb 20" , time: "10:00 AM", priority: .High, status: .pending ))
sundayList.add(newItem: List.init(ID: 122, title: "Gym", date: "Feb 20", time: "9:00 PM", priority: .Low, status: .pending ))
sundayList.add(newItem: List.init(ID: 122, title: "COOKING", date: "Feb 20", time: "9:00 PM", priority: .Medium, status: .completed ))
sundayList.getAllItems()
sundayList.checkPriority(priority: .Low)
sundayList.checkPriority(priority: .Medium)
