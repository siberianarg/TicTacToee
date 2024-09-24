//
//  TicTakToe.swift
//  TicTakToe
//
//  Created by siberianarg on 24.09.2024.
//

import Foundation

class TicTacToe {
    var arrayXO: [XO] = Array(repeating: XO(), count: 9)
    var counter = 0
    let winCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    func setXO(index:Int) {
        counter += 1
        if counter % 2 == 0 {
            arrayXO[index].write = "⭕️"
        } else {
            arrayXO[index].write = "❌"
        }
        arrayXO[index].isOpen = true
    }
    
    func win() -> String? {
        for i in winCombination {
            if arrayXO[i[0]].write == arrayXO[i[1]].write && arrayXO[i[1]].write == arrayXO[i[2]].write && arrayXO[i[0]].isOpen {
                return arrayXO[i[0]].write
            }
        }
        
        if counter == 9 {
            return "Draw"
        }
            
        return nil
    }
}
