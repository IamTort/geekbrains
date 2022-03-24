//
//  main.swift
//  2l_ФИ.playground
//
//  Created by angelina on 21.02.2022.
//

import Foundation

// функция на четность
print("Функция на четность и деление без остатка на 3 \nВведите целое число")
var a = Int(readLine()!)!  //не надо вводить буквы или оставлять пустую строку или дробные числа, проверку от идиотов не завезли
func parity(perem : Int) {
    if perem % 2 == 0 {
        print("число четное")
    } else {
        print("число не четное")
    }
}
parity(perem: a)

// функция определения делится ли число без остатка на 3

func division3(perem : Int) {
    if perem % 3 == 0 {
        print("число делится без остатка на 3")
    } else {
        print("число не делится без остатка на 3")
    }
}
division3(perem: a)

//создать возрастающий массив из 100 чисел
print("Создаем массив из 100 чисел")
var arr:[Int] = []
    for i in (1...100) {
        arr.append(i)
    }
print(arr)

//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
print("удаляем из него все четные числа и числа которые не делятся на 3")
for value in arr {
    if (value % 2 == 0) || (value % 3 != 0) {
        arr.remove(at: arr.firstIndex(of: value)!)
    }
}
print(arr)

//Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

print("Массив с числами Фибоначчи")
func fibonachi(_ n : Int) -> [Int]{
    var fibonachiArr:[Int] = [1,1]
    for i in 2...n + 1 {
        fibonachiArr.append(fibonachiArr[i-1] + fibonachiArr[i-2])
    }
    return fibonachiArr
}
print(fibonachi(50))

//Эратосфен
print("Массив с простыми числами")
var n = 600
var fen:[Int] = []
for i in stride(from: 2, to: n, by: 1){
    fen.append(i)
}

var i = 0
var j = 0
var p = 0

while j < fen.count {
    i = 0
    while i < fen.count {
        if (fen[i] % fen[j] == 0 && fen[j] != fen[i]) {
            fen.remove(at: i)
        }
        i += 1
    }
    j += 1
    if fen.count > 100{
        fen.removeLast()
        
    }
    
}

/* Оставлю на будущее
for divider in fen {
    for element in fen {
        if (element % divider == 0 && element != divider) {
            fen.remove(at: fen.firstIndex(of: element)! )
        }
    }
}
*/
print(fen)
