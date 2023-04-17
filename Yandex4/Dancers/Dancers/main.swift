//
//  main.swift
//  Dancers
//
//  Created by Alexander Kurbatov on 04.04.2023.
//

import Foundation

struct EnterData {
    
    let numberOfDancersGroops: Int
    var groups: [Int]
    let numberOfKindsRooms: Int
    var rooms: [Int: Int]
    
    mutating func findOpportunity() -> String{
        var answer: String = ""
        
        // сортируем группы по количеству танцовщиц
        groups.sort(by: >)
        
        for group in groups {
//            print(rooms)
//            print(group)
            if rooms.isEmpty {
                answer = "No"
                return answer
            }
            for key in rooms.keys.sorted(by: >) {
                print(key)
                if group > key || rooms[key] == nil {
                    answer = "No"
                    return answer
                } else {
                    rooms[key] = rooms[key]! - 1
                    if rooms[key] == 0 {
                        rooms[key] = nil
                    }
                    break
                }
            }
        }
        
        answer = "Yes"
        
        return answer
    }
    
}

final class Application {
    
    func main() {
        let reader = DataReader()
        var enterData = reader.read()
        let result = enterData.findOpportunity()
        
        print(result)
    }
    
    // MARK: - Private
    
    private class DataReader {
        
        
        
        func read() -> EnterData {
            print("Введите число групп танцовщиц:")
            let firstString = readLine() ?? ""
            let numberOfDancersGroops = Int(firstString) ?? 0
            print("Введите количество танцовщиц в i-ой группе:")
            let secondString = readLine() ?? ""
            let groups = secondString.split(separator: " ").map { Int($0)! }
            print("Введите количество типов комнат:")
            let thirdString = readLine() ?? ""
            let numberOfKindsRooms = Int(thirdString) ?? 0
            print("Введите пару тип комнаты-количество таких комнат:")
            
            var rooms: [Int: Int] = [:]
            for _ in 0..<numberOfKindsRooms {
                let room = readLine()!.split(separator: " ").map { Int($0)! }
                if rooms[room[0]] == nil {
                    rooms[room[0]] = room[1]
                } else {
                    rooms[room[0]]! += room[1]
                    
                }
            }
            
            
            let enterData = EnterData(numberOfDancersGroops: numberOfDancersGroops, groups: groups, numberOfKindsRooms: numberOfKindsRooms, rooms: rooms)
            
            return enterData
        }
    }
}

let application = Application()
application.main()


