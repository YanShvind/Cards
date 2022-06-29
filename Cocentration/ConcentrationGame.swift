//
//  ConcentrationGame.swift
//  Cocentration
//
//  Created by Yan Shvyndikov on 09.06.2022.
//

import Foundation

class ConcentrationGame{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let machingIndex = indexOfOneAndOnlyFaceCard, machingIndex != index{
                if cards[machingIndex].identifier == cards[index].identifier{
                    cards[machingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceCard = nil
            }else{
                for flipDown in cards.indices{
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
}
