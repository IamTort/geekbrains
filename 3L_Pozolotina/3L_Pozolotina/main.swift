//
//  main.swift
//  3L_Pozolotina
//
//  Created by angelina on 23.02.2022.
//

import Foundation
//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
enum engineWork {
    case start, stop
}
enum windowState {
    case open, close
}
enum loadAction {
    case put, take
}

struct SportCar {
    let carModel: String
    let year: Int
    let trunkVolume: Double //постоянный объем багажника
    var engineWork: engineWork = .stop
    var currentTrunkVolume: Double// Текущий занятый объем багажника
    var windows: windowState = .close
    mutating func stopEngine(){
        engineWork = .stop
    }
    mutating func startEngine(){
        engineWork = .start
    }
    mutating func changeWindows(action: windowState){    //метод с одним аргументом типа перечисления, меняет свойство структуры в зависимости от дейсвия
        windows = action
    }
    
    var emptyVolumeInTrunk: Double {//оставшийся объем багажника
        get {
            return trunkVolume - currentTrunkVolume
        }
    }
    
    mutating func trunkAction(action: loadAction, pack: Pack){
        switch action {
        case .put:
            if trunkVolume >= (currentTrunkVolume + pack.volume){     //если коробка слишком большая, то она не поместится
                currentTrunkVolume += pack.volume
            } else {
                print("Box is too big")
            }
        case .take:
            if currentTrunkVolume >= pack.volume {
                currentTrunkVolume -= pack.volume
            } else {
                print("We haven't so big box in trunk")
            }
        }
    }
}

struct Pack {
    let lenght: Double
    let width: Double
    let height: Double
    var volume: Double {
        get {
            return lenght * height * width
        }
    }
}

struct TrunkCar{
    let carModel: String
    let year: Int
    let trunkVolume: Double //постоянный объем багажника
    var engineWork: engineWork = .stop
    var currentTrunkVolume: Double// Текущий занятый объем багажника
    var windows: windowState = .close
    mutating func stopEngine(){
        self.engineWork = .stop
    }
    mutating func startEngine(){
        self.engineWork = .start
    }
    mutating func changeWindows(action: windowState){
        self.windows = action
    }
    
    var emptyVolumeInTrunk: Double {//оставшийся объем багажника
        get {
            return trunkVolume - currentTrunkVolume
        }
    }
    
    mutating func trunkAction(action: loadAction, pack: Pack){
        switch action {
        case .put:
            if trunkVolume >= (currentTrunkVolume + pack.volume){
                currentTrunkVolume += pack.volume
            } else {
                print("Box is too big")
            }
        case .take:
            if currentTrunkVolume >= pack.volume {
                currentTrunkVolume -= pack.volume
            } else {
                print("We haven't so big box in trunk")
            }
        }
    }
}

var car1 = SportCar(carModel: "BMW", year: 2010, trunkVolume: 200, engineWork: .stop, currentTrunkVolume: 10)
var pack = Pack(lenght: 50, width: 5, height: 6)
var car2 = SportCar(carModel: "Honda", year: 2008, trunkVolume: 150, engineWork: .start, currentTrunkVolume: 0, windows: .open)
var trunkcar1 = TrunkCar(carModel: "Volvo", year: 2005, trunkVolume: 10000, currentTrunkVolume: 0)
var trunkcar2 = TrunkCar(carModel: "Ford", year: 2017, trunkVolume: 13000, engineWork: .start, currentTrunkVolume: 500, windows: .open)
car1.changeWindows(action: .open)
car1.trunkAction(action: .put, pack: pack)
print(trunkcar1)
print(pack)
trunkcar1.trunkAction(action: .put, pack: pack) //можно вместо структуры Pack просто использовать Double число
print(trunkcar1)
trunkcar2.stopEngine()
print(trunkcar2)
print(trunkcar1.engineWork)
print(trunkcar2.emptyVolumeInTrunk)

