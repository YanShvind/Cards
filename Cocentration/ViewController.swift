//
//  ViewController.swift
//  Cocentration
//
//  Created by Yan Shvyndikov on 06.06.2022.
//

// sender - наша кнопка, которую мы нажимаем
// квадратик с цветом - #colorLiteral(

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    var touches = 0{
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }

    var emojiCollection = ["🤯","🧚‍♀️","🧑🏻‍💻","👮‍♀️","🧟‍♀️","👤","☃️","🎃","👾","👻","🤖","😈"]
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentyfier(for card: Card)->String{
        if emojiDictionary[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewfromModel(){
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emojiIdentyfier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.8001160026, blue: 0.006338531151, alpha: 1)
        }
    }
    }
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewfromModel()
        }
    }
    @IBOutlet var buttonCollection: [UIButton]!
}

