import UIKit

class ToDoItem {
    let name : String
    let deadline : Date
    
    init(name:String, deadline: Date) {
        self.name     = name
        self.deadline = deadline
    }
}

class ToDoList{
    let items : [ToDoItem]
    init(items : [ToDoItem]) {
        self.items = items
    }
}

//func sortByMostUrgent(todos:[ToDoItem]) -> [ToDoItem]{
    
//}
//
//let item1 = ToDoItem(name: "Studying", deadline: )
//let item2 = ToDoItem(name: "Watching TV", deadline: )
//let item3 = ToDoItem(name: "Get out With Friends", deadline: )
//let item4 = ToDoItem(name: "Having lunch", deadline: )
//
//let sortedItems = sortByMostUrgent(todos: [item1,item2,item3,item4])
//print(sortedItems)

/////////////////////////////////

func numberOfCharacters(str : String) -> Int {
    return str.count
}

let characterCount  : (String) -> Int = numberOfCharacters
let characterCount2 : (String) -> Int = { str in
    return str.count
}

characterCount("Sahar ")

let findAverage : (Float, Float) -> (Float) = { x,y in
    return (x+y)/2
}

findAverage(2,4)

func fetchNamesFromDatabase() -> [String] {
    let names : [String] = fetchNamesMock()
    return names
}

func fetchNamesMock() -> [String]{
    return ["Sahar", "Hany", "Mohammed", "Ahmed"]
}

print(fetchNamesFromDatabase())

//////////////
func printUppercased( str : String) -> (String){
    return str.uppercased()
}

func someFunction( function : (String) -> (String)){
    let appliedFnStr = function("sahar")
    print(appliedFnStr)
}

someFunction(function: printUppercased)

func calculate( firstOperand : Int, secondOperand : Int, operatorFn : (Int, Int) -> (Int)) -> (Int){
    return operatorFn(firstOperand,secondOperand)
}

func add(firstOperand : Int, secondOperand : Int) -> (Int){
    return firstOperand + secondOperand
}

func subtract(firstOperand : Int, secondOperand : Int) -> (Int){
    return firstOperand - secondOperand
}

func multiply(firstOperand : Int, secondOperand : Int) -> (Int){
    return firstOperand * secondOperand
}

let addResult      = calculate(firstOperand: 5, secondOperand: 4, operatorFn: add)

let subtractResult = calculate(firstOperand: 5, secondOperand: 4, operatorFn: subtract)

let getMin = calculate(firstOperand: 5, secondOperand: 4, operatorFn: min)
let getMax = calculate(firstOperand: 5, secondOperand: 4, operatorFn: max)

print(addResult)
print(subtractResult)

print(getMin)
print(getMax)

var result = calculate(firstOperand: 3, secondOperand: 5) { x, y in
    return (x + y)/2
}

print(result)

func getOperatorFunction(oper : String) -> (Int, Int) -> (Int){
    switch oper {
    case "+":
        return add
    case "-":
    return subtract
    default:
        return max
    }
}

result = calculate(firstOperand: 10, secondOperand: 5, operatorFn: getOperatorFunction(oper: "+"))

print(result)


result = calculate(firstOperand: 10, secondOperand: 5, operatorFn: getOperatorFunction(oper: "-"))

print(result)


result = calculate(firstOperand: 10, secondOperand: 5, operatorFn: getOperatorFunction(oper: ""))

print(result)


func createPrinter()-> ()->() {
    func printer(){
        print("Hello")
    }
    return printer
}

let myPrinter : () -> () = createPrinter()
myPrinter()
myPrinter()


func getDouble(x : Int) -> (Int){
    return x * 2
}

func getTriple(x : Int) -> (Int){
    return x * 3
}

func getQuadruple(x : Int) -> (Int){
    return x * 4
}

func createMultiplier(multi : Int) -> ( (Int) -> (Int) ){
    func multiplier(x:Int) -> (Int){
        return x * multi
    }
    return multiplier
}

let double    = createMultiplier(multi: 2)
let triple    = createMultiplier(multi: 3)
let quadruple = createMultiplier(multi: 4)

let double5    = double(5)
let triple5    = triple(5)
let quadruple5 = quadruple(5)

print(double5)
print(triple5)
print(quadruple5)

let namesArr = fetchNamesMock()
let uppercasedNamesArr = namesArr.map(printUppercased)

let nums = [1,2,3,4,5]

func convertNumToWord(num : Int) -> (String){
    switch num {
    case 1:
        return "One"
    case 2:
        return "Two"
    case 3:
        return "Three"
    case 4:
        return "Four"
    case 5:
        return "Five"
    default:
        return ""
    }
}

let numsInWords = nums.map(convertNumToWord)

let numbers = [77,38,848,909,222,122,444,23,13]

func isEven(x:Int)->(Bool){
    return (x%2) == 0
}

func isOdd(x:Int)->(Bool){
//    return (x%2) != 0
    return !isEven(x: x)
}

let oddList = numbers.filter(isOdd)

let addingResult      = nums.reduce(0, add)
let multiplyingResult = nums.reduce(1, multiply)
let maximum           = nums.reduce(nums[0], max)
let minimum           = nums.reduce(nums[0], min)

///////////

class Employee{
    let name   : String
    let salary : Int
    let gender : String
    init(name: String, salary: Int, gender: String) {
        self.name   = name
        self.salary = salary
        self.gender = gender
    }
}

func getSalary(emp : Employee) -> (Int) {
    return emp.salary
}


let emp1 = Employee(name: "John" , salary: 3000, gender: "M")
let emp2 = Employee(name: "Suzan", salary: 6000, gender: "F")
let emp3 = Employee(name: "Anne" , salary: 7000, gender: "F")
let emp4 = Employee(name: "Alex" , salary: 4000, gender: "M")
let emp5 = Employee(name: "Marie", salary: 9000, gender: "F")
let emp6 = Employee(name: "Sam"  , salary: 5000, gender: "M")

let emps = [emp1,emp2,emp3,emp4,emp5,emp6]

let maxSalary = emps.map(getSalary).reduce(0, max)

let maxFemaleSalary = emps.filter({emp in emp.gender == "F"}).map(getSalary).reduce(0, max)
print(maxFemaleSalary)

let sumOfSalariesGreaterThan4500 = emps.map(getSalary).filter({x in x > 4500}).reduce(0, add)
print(sumOfSalariesGreaterThan4500)

func add3Numbers(x:Int,y:Int,z:Int) -> (Int){
//    return x+y+z
    return add(firstOperand: add(firstOperand: x, secondOperand: y), secondOperand: z)
}

add3Numbers(x: 2, y: 3, z: 5)

func countDown (start:Int){
    if start >= 0{
        print(start)
        countDown(start: start-1)
    }else{
        return
    }
}

countDown(start: 5)
print("///////")

func countUp (start:Int, end :Int){
    if start <= end{
        print(start)
        countUp(start: start+1, end: end)
    }else{
        return
    }
}

countUp(start: 3, end: 10)
