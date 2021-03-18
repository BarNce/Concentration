//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Владислав Кушнарев on 16.03.2021.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        for _ in cards {
//            cards.swapAt(Int(arc4random_uniform(UInt32(cards.count))), Int(arc4random_uniform(UInt32(cards.count))))
            let swapIndex1 = Int(arc4random_uniform(UInt32(cards.count)))
            let swapIndex2 = Int(arc4random_uniform(UInt32(cards.count)))
            cards.swapAt(swapIndex1, swapIndex2)
        }
    }
    
}
