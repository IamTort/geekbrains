//
//  main.swift
//  6L_Pozolotina
//
//  Created by angelina on 05.03.2022.
//

import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

//реализовала свой тип коллекции очередь с использованием дженерика(вроде одного)
struct queue<T : PhoneEntity> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
        print("append new element")
    }
    
    mutating func pop() -> T? {
        print("remove last element")
        return elements.removeLast()
    }
    
//добавила метод высшего порядка через расширение,  выводит только номер
    func onlyNumb(predicate:(T) -> Bool) -> [Int] {
        var arr = [Int]()
        for i in elements {
            if predicate(i) {
                
                arr.append(i.number)
                
            }
        }
    return arr
    }
    
//добавила сабскрипт
    subscript(index: UInt ) -> String? {
        if index > (self.elements.count - 1) {
            return nil
        } else {
            return "index найден"
        }
        
    }
}

//добавила метод высшего порядка через расширение, выводит всё, что записано в элемент
extension queue {
    func filter(predicate:(T) -> Bool) -> [T] {
        var arr = [T]()
        for i in elements {
            if predicate(i) {
                arr.append(i)
            }
        }
    return arr
    }
}

protocol PhoneEntity {
    var number: Int { get }
}

struct phonebook : PhoneEntity {
    var number: Int
    var name: String


}

extension phonebook: CustomStringConvertible {
    var description: String{
        return "Name: \(name), phonenumber: \(number)"
    }
}

var b = queue<phonebook>()

b.push( .init(number: 89899712345, name: "Kristian"))
b.push( .init(number: 89899716745, name: "Mark"))
b.push( .init(number: 89346576476, name: "Anna"))
print(b)
let j = b.filter {$0.name.hasPrefix("K")}
let r = b[0]
print(r ?? "nil")
print(j)

let a = b.onlyNumb {$0.name.hasPrefix("A")}
print(a)
var c = b.pop()
print(b)
