//
//  main.swift
//  5L_Pozolotina
//
//  Created by angelina on 02.03.2022.
//

import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.

enum Action {
    case switchEngine(Engine)
    case switchWindow(Window)
    case switchTrunk(TrunkState)
    case loadCargo(Int)     //добавляет груз
    case replaceTyres
    case unloadCargo(Int)   //убавляет груз
}

enum Window: CustomStringConvertible {
    case open, closed
    
    var description: String {
        switch self {
        case .open:
            return "Окна открыты"
        case .closed:
            return "Окна закрыты"
        }
    }
}

enum Engine: CustomStringConvertible {
    case on, off
    
    var description: String {
        switch self {
        case .on:
            return "Двигатель заведён"
        case .off:
            return "Двигатель заглушен"
        }
    }
}

enum TrunkState: CustomStringConvertible {
    case withTrunk, withoutTrunk
    
    var description: String {
        switch self {
        case .withTrunk:
            return "Цистерна подсоединена"
        case .withoutTrunk:
            return "Цистерна отсоединена"
        }
    }
}

protocol Car {
    var brand: String { get }
    var year: Int { get }
    var window: Window { get set }
    var engine: Engine { get set }
    func metod(action: Action)
    
}

extension Car {
    mutating func windowState(window: Window){
        self.window = window
    }
    mutating func engineState(engine: Engine){
        self.engine = engine
    }
}

class sportСar: Car, CustomStringConvertible {
    
    func metod(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindow(let status):
            window = status
        case .replaceTyres:
            print("Произведена замена шин!")
        default:
            break
        }
    }
    
    let simbol: String = "🏎"
    var maxSpeed: Double
    
    init(maxSpeed: Double, brand: String, year: Int, window: Window, engine: Engine) {
        self.maxSpeed = maxSpeed
        self.brand = brand
        self.year = year
        self.window = window
        self.engine = engine
    }
    
    let brand: String
    let year: Int
    var window: Window
    var engine: Engine
    
    var description: String {
        return "\(simbol) \(brand)\nГод выпуска: \(year)\nМаксимальная скорость: \(maxSpeed)\nСостояние: \(engine) | \(window)\n"
    }
}

class trunkCar: Car, CustomStringConvertible {
    
    func metod(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindow(let status):
            window = status
        case .switchTrunk(let status):
            if status == .withoutTrunk {
                maxTrunkSize = 0
                currentTrunkSize = 0
            } else {
                print("Задайте максимальный объем цистерны")
            }
            trunkState = status
        case .loadCargo(let load):
            guard trunkState != .withoutTrunk else{
                return
            }
            let expectedLoad = load + currentTrunkSize
            switch expectedLoad {
            case _ where expectedLoad > maxTrunkSize:
                currentTrunkSize = maxTrunkSize
            case _ where expectedLoad < 0:
                currentTrunkSize = 0
            default:
                currentTrunkSize += load
            }
        case .unloadCargo(let load):
            guard trunkState != .withoutTrunk else{
                return
            }
            switch load {
            case _ where load > currentTrunkSize:
                currentTrunkSize = 0
            default:
                currentTrunkSize -= load
            }
        default:
            break
        }
    }
    
    func trailer(){
        if trunkState == .withoutTrunk {
            maxTrunkSize = 0
        }
    }
    
    let simbol = "🚛"
    let brand: String
    let year: Int
    var window: Window
    var engine: Engine
    var trunkState: TrunkState
    var maxTrunkSize: Int
    var currentTrunkSize: Int = 0
    init(brand: String, year: Int, window: Window, engine: Engine, trunkState: TrunkState, maxTrunkSize: Int) {
        self.trunkState = trunkState
        self.brand = brand
        self.year = year
        self.window = window
        self.engine = engine
        self.maxTrunkSize = maxTrunkSize
        trailer()
    }
    
    var description: String {
        return "\(simbol) \(brand)\nГод выпуска: \(year)\nСостояние: \(engine) | \(window) | \(trunkState)\nЗаполнен: \(currentTrunkSize)/\(maxTrunkSize)\n"
    }
}


var car1 = sportСar(maxSpeed: 340, brand: "Nod", year: 2010, window: .open, engine: .off)
car1.engineState(engine: .on)
print(car1)
car1.metod(action: .switchEngine(.on))
print(car1.engine)
car1.engineState(engine: .off)
print(car1)
car1.metod(action: .replaceTyres)


var trunk1 = trunkCar(brand: "Ford", year: 2019, window: .closed, engine: .off, trunkState: .withoutTrunk, maxTrunkSize: 200)
trunk1.metod(action: .switchTrunk(.withTrunk))
trunk1.maxTrunkSize = 300
trunk1.metod(action: .loadCargo(240))
//trunk1.metod(action: .switchTrunk(.withoutTrunk))
trunk1.metod(action: .unloadCargo(100))
print(trunk1)
trunk1.engineState(engine: .on)
print(trunk1.engine)
