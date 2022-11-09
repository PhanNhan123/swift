// hashcode
// sets object array  student

// question1
//
// func checkNum(num1 : Int ,num2 : Int ) -> Bool {
//    if( num1 == 100 || num2 == 100 || num1 + num2 == 100){
//        return true;
//    }else{
//        return false;
//    }
// }
// print(checkNum(num1: 50, num2:50))

// question2
//
// func addSwift(string: String) -> String {
//    if(string.count<5){
//        return "Swift" + string
//    }else{
//        if(string.prefix(5) == "Swift"){
//            return string
//        }else
//        {
//            return "Swift" + string;
//        }
//    }
//
// }
//
// print(addSwift(string: "shne"))

// question3
//
// func changeCharacter(string : String) -> String {
//    if(string.count<=1){
//        return string
//    }else{
//        let first =  string.prefix(1);
//        let last  = string.suffix(1);
//        let slice = string.dropFirst().dropLast()
//        let result = "\(last)" + "\(slice)" + "\(first)";
//        return result
//    }
//
// }
// print(changeCharacter(string: "abcd"))

// question 4

// func  checkExists(array: [Int]) ->Bool{
//    if(array.contains(3) || array.contains(5)){
//        return true;
//    }else{
//        return false;
//    }
// }
//
// print(checkExists(array: [25,10,15,30,5]))

// question 5
// sap xep class sv  nam sin
//
// func sortDesc(array : [Int])-> [Int] {
//    let result = array.sorted(by: >)
//    return result;
// }
// func sortAsc(array : [Int]) -> [Int]{
//    let result = array.sorted(by: < )
//    return result;
// }
//
// print(sortDesc(array:  [10,5,8,3,16,32,68,1]))
// print(sortAsc(array:  [10,5,8,3,16,32,68,1]))

// question 6
//
// func reverseString(string: String)-> String{
//    let revString = String(string.reversed());
//    return revString;
// }
// print(reverseString(string: "abcdefghiklm"))

// question 7

// func findMaxMin(array: [Int])->(Int, Int){
//    var max = array[0]
//    var min = array [0]
//    for item in array {
//        if(item > max){
//            max = item;
//        }
//        if(item < min){
//            min = item
//        }
//    }
//    return (max,min)
// }
//
// let (max, min) = findMaxMin(array: [10,20,40,56,12,35,1,242,1,-1,-8])
// print("max: \(max), min: \(min)")

//  question 8

//
//
// class Area {
//    var length : Double? ;
//    var breadth : Double? ;
//    func setDim(){
//        print("input length: ");
//        if let lengthinput = readLine()
//        {
//            length = Double(lengthinput);
//        }
//        print("input breadth: ");
//        if let breadthinput = readLine()
//        {
//            breadth = Double(breadthinput)
//        }
//    }
//    func getArea() ->  Double{
//        let area = Double(length!) * Double(breadth!);
//        return area;
//    }
// }
//
// var newArea =  Area()
// newArea.setDim()
// var result = newArea.getArea()
// print("Area of rectangle: \(result)")

// ----------------------------------------------------------------------

// func getArea(){
//    let area = Double(length ?? 0 ) * Double(breadth ?? 0);
//    print("Area of rectangle: \(area)")
// ?

// ----------controlfow----------------

// for index in 1..<5{
//    print(index)
// }

// -----------------enumeration----------
// enum cars: CaseIterable {
//    case bmw, honda, ford
// }
// for car in cars.allCases
// {
//   print(car)
// }

// ---s----classes and structures
// struct Resolution{
//    var width = 0
//    var height  = 0
// }
// class  VideoMode {
//    var resolution = Resolution();
//    var interlaced = false
//    var frameRace = 0.0
//
// }
//
// var newVideoMode = VideoMode().resolution.width

// -----  protocol ------
// protocol FullyName{
//    var fullName : String {get}
// }
// struct Person : FullyName {
//    var fullName: String
// }
//
// let name  = Person ( fullName : "username")
//
// print (name.fullName)
//
//
// class Starship : FullyName{
//    var perfix : String
//    var name : String
//    init(name : String, perfix : String? = nil){
//        self.name = name
//        self.perfix = perfix
//    }
//    var fullName: String {
//        return (perfix != nil ? perfix) + " " : "") + name
//    }
// }

// protocol Named{
//    var name : String {get}
// }
// protocol Aged{
//    var age : Int {get}
// }
// struct Person : Named,Aged {
//    var  name: String
//    var  age : Int
// }
// func wishBirthday(to celebrator: Named & Aged ){
//    print("Happy birthday \(celebrator.name), you're \(celebrator.age)")
// }
// let person = Person(name:"user", age:12);
// wishBirthday(to: person)

// ------method  -------
// struct LevelTracker{
//    static var highestUnlockLevel = 1
//    var curentLevel = 1
//    static func unLock (_ level : Int ){
//        if (level > highestUnlockLevel){
//            highestUnlockLevel = level
//        }
//    }
//    static func isUnLocked(_ level: Int) -> Bool{
//        return  level <= highestUnlockLevel
//    }
//    @discardableResult
//    mutating func advance(to level: Int ) ->  Bool {
//        if LevelTracker.isUnLocked(level){
//            curentLevel = level
//            return true
//        }
//        else {
//            return false
//        }
//    }
// }

//
// let someCharacter: Character = "z"
// switch someCharacter {
// case "a":
//    print("The first letter of the alphabet")
// case "z":
//    print("The last letter of the alphabet")
// default:
//    print("Some other character")
// }

// question 8 **

//
// class Area {
//    var length : Double? = nil;
//    var breadth : Double? = nil;
//    func setDim(){
//        print("input length: ");
//        if let lengthinput = readLine()
//        {
//            length = Double(lengthinput) ?? 0;
//        }
//        print("input breadth: ");
//        if let breadthinput = readLine()
//        {
//            breadth = Double(breadthinput) ?? 0
//        }
//    }
//    func getArea() ->  Double{
//        let area = Double(length ?? 0 ) * Double(breadth ?? 0);
//        return area;
//    }
// }
//
// var newArea =  Area()
// newArea.setDim()
// var result = newArea.getArea()
// print("Area of rectangle: \(result)")


