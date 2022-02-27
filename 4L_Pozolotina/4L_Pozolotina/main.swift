//
//  main.swift
//  4L_Pozolotina
//
//  Created by angelina on 26.02.2022.
//

import Foundation

enum windowState{
    case open, close
}
enum HatchState{
    case yes, no
}
enum Trailer{
    case withTrailer, withoutTrailer
}
class Car {
    let number:String
    let model:String
    var trunkSize:Int
    var windows:windowState
    init(number:String, model:String, trunkSize:Int, windows:windowState){
        self.number = number
        self.model = model
        self.trunkSize = trunkSize
        self.windows = windows
    }
    func metodFor(){
        print("Hello")
    }
    func openOrCloseWindow(action: windowState){
        windows = action
    }
    
}

class SportCar: Car {
    var setHatchState: HatchState = .no
    init(number: String, model: String, trunkSize: Int, windows: windowState, hatchState: HatchState) {
        self.setHatchState = hatchState
        super.init(number: number, model: model, trunkSize: trunkSize, windows: windows)
    }
    func hatchState (action: HatchState){
            self.setHatchState = action
        }
    
    override func metodFor() {
        print("Hatchstate in this car: \(setHatchState)")
    }
    
    }
    

class TrunkCar: Car {
    var trailer:Trailer
    init(number: String, model: String, trunkSize: Int, windows: windowState, trailer: Trailer) {
        self.trailer = trailer
        super.init(number: number, model: model, trunkSize: trunkSize, windows: windows)
        setTrailerState(action: trailer)
    }
    override func metodFor() {
        print("This trunkcar \(trailer)")
    }
    func setTrailerState (action: Trailer, trunkSize: Int = 0) {
            self.trailer = action
        if action == .withoutTrailer{
            self.trunkSize = 0
        } else if (action == .withTrailer && trunkSize == 0){
            print("Размер трейлера не может быть равным 0, метод не верен")
        } else {
            self.trunkSize = trunkSize
        }
       
        }
  
    }


var car1 = SportCar(number: "098770989", model: "Bmw", trunkSize: 300, windows: .open, hatchState: .no)
var car2 = Car(number: "7856858", model: "Bmw", trunkSize: 400, windows: .close)

var trunk1 = TrunkCar(number: "4545jfkdjf", model: "Volvo", trunkSize: 10000, windows: .close, trailer: .withoutTrailer)
var trunk2 = TrunkCar(number: "4734hjdbf", model: "Ford", trunkSize: 3000, windows: .close, trailer: .withTrailer)
car2.openOrCloseWindow(action: .open)
print(car1.windows)
print(car2.windows)
car1.metodFor()
car2.metodFor()
trunk1.setTrailerState(action: .withTrailer, trunkSize: 20000)
print(trunk1.trunkSize)
trunk2.openOrCloseWindow(action: .open)
print(trunk2.windows)
trunk2.setTrailerState(action: .withoutTrailer, trunkSize: 100)
print(trunk2.trunkSize)
trunk2.metodFor()
trunk1.metodFor()
print(car1.model)

