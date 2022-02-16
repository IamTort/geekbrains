//
//  main.swift
//  square
//
//  Created by angelina on 16.02.2022.
//

import Foundation
var x: Double
//квадратное уравнение
print("Введите коэффициенты для уравнения ")
print(" a*x^2 + b*x + c = 0 ")
print("a = ")
let a1 = readLine()
print("b = ")
let b1 = readLine()
print("c = ")
let c1 = readLine()
if a1 == "" || b1 == "" || c1 == "" {
    print("Попробуй заново запустить программу и ввести числа, мне неприятности не нужны")
} else {
    let a:Double = Double(a1!)!
    let b:Double = Double(b1!)!
    let c:Double = Double(c1!)!
    let disc:Double = b * b - 4 * a * c
print("Дискриминант = \(disc)")

if disc > 0 {
    let x1:Double = (-(b) + sqrt(disc))/(2*a)
    let x2:Double = (-(b) - (sqrt(disc)))/(2*(a))
    print("x1 = \(x1), x2 = \(x2)")
} else if disc == 0 {
    x = -b / (2 * a)
    print("x = \(x)")
} else {
    print("Корней нет")
}
}

//Периметр, площадь и гипотенуза треугольника
let a:Double = 3
let b:Double = 4
 
let s = (a*b)/2
let p = sqrt(a*a + b*b) + a + b
let g = sqrt(a*a + b*b)
print("Периметр треугольника равен \(p)")
print("Площадь треугольника равна \(s)")
print("Гипотенуза треуголника равна \(g)")


// вклад на 5 лет
var depositLine:String?
var percentLine:String?
repeat {
print("Введите сумму вклада, которую вы планируете положить в банк")
    depositLine = readLine()
print("Введите годовой процент по вкладу")
    percentLine = readLine()
} while (!isStringDigit(str: depositLine!) && !isStringDigit(str: percentLine!))
//if depositLine != "" && percentLine != "" {
    let deposit:Double = Double(depositLine!)!
    let percent:Double = Double(percentLine!)!
    let fiveYear = deposit * pow((1 + percent/100), 5)
    print("Через 5 лет на счете будет лежать \(fiveYear) тугриков")
/*} else {
    print("Некорректно введенные данные")
}*/

func isStringDigit(str:String)->Bool{
    return !str.isEmpty && str.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
}
//123
