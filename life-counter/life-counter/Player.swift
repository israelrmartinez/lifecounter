//
//  Player.swift
//  life-counter
//
//  Created by stlp on 4/26/22.
//

import Foundation

class Player {
    var points: Int!
    var chunk: Int!
    var name: String!
    var isLoser: Bool!
    
    init(score points: Int) {
        self.points = points
        self.chunk = 5
        self.name = ""
        self.isLoser = false
    }
    
    func subtract() {
        self.points -= 1
    }
    
    func subtractChunk() {
        self.points -= self.chunk
    }
    
    func setChunk(_ num: String) {
        let newChunk = Int(num) ?? 0
        self.chunk = newChunk
    }
    
    func addChunk() {
        self.points += self.chunk
    }
    
    func add() {
        self.points += 1
    }
}
