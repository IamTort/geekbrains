//
//  main.swift
//  7L_Pozolotina
//
//  Created by angelina on 20.03.2022.
//
//
//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

import Foundation

enum Diary{
    case brought, miss
}

struct Student {
    var name: String
    var mathMark: Int
    var russianMark: Int
    var geografyMark: Int
    var diary: Diary
}

class First{
    var students = ["Mary": Student(name: "Mary", mathMark: 4, russianMark: 5, geografyMark: 2, diary: .brought),
                    "Jonh": Student(name: "Jonh", mathMark: 4, russianMark: 5, geografyMark: 2, diary: .brought),
                    "Jake": Student(name: "Jake", mathMark: 4, russianMark: 5, geografyMark: 2, diary: .miss)
    ]
                       
    //если дневника нет, мы не можем посчитать оценки и выводим 0 через guard
    func averageMark(at name: String)  -> Int {
        guard let person  = students[name] else{
            return 0
        }
        return ((person.mathMark + person.russianMark + person.geografyMark)/3)
    }
    
    func count(pupilname name: String) throws -> String {
        guard let pupil = students[name] else {
            throw error.notStudent
        }
        guard pupil.diary != .miss else {
            throw error.notDiary
        }
        return "Средняя оценка \(name) - \((pupil.mathMark + pupil.russianMark + pupil.geografyMark)/3)"
    }
    
    
    func testError(pupilname: String) throws {
        do {
            _ = try student.count(pupilname: pupilname)
        } catch error.notStudent {
            print("Нет такого студента")
        } catch error.notDiary {
            print("У этого студента нет с собой дневника")
        } catch let error {
            print(error.localizedDescription)
    }
    }
}
 
enum error: Error {
    case notDiary
    case notStudent
}


let student = First()
let student3: () = try student.testError(pupilname: "Jake")
print(student3)

let student2: () = try student.testError(pupilname: "Jade")
print(student2)

let student1 = try student.count(pupilname: "Jou")
print(student1)
