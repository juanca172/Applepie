//
//  ViewController.swift
//  Apple Pie
//
//  Created by Juan Camilo Fonseca Gomez on 21/04/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ImagenArbol: UIImageView!
    @IBOutlet var CorrectWordLabel: UILabel!
    @IBOutlet var ScoreLabel: UILabel!
    @IBOutlet var LetterButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func BotonesConLetras(_ sender: UIButton) {
        sender.isEnabled = false
        if let letterString : String = sender.title(for: .normal) {
            let letter = Character(letterString.lowercased())
            currentGame.charactersSelected(letraEscogida: letter)
            newRound()
        }else {
            print("Algo esta mal")
        }
        
    }
    
    
    var currentGame : Game!
    var listOfWords : Array<String> = ["corsario, caballero, televisor, matematicas, ingles, cosina, estufa, nevera, horno, tenedor, parque, pinguinos, leones, perros, caballos, castillo"]
    let incorrectMovesAllowed = 7
    var totalOfWins = 0
    var totalOfLosses = 0
    
    func newRound (){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(incorrectMovesRemain: incorrectMovesAllowed, word: newWord, guessedLetters: [])
        updateUI()
        
    }
    func updateUI() {
        ScoreLabel.text = "Triunfos : \(totalOfWins), derrotas : \(totalOfLosses)"
        ImagenArbol.image = UIImage(named: "Arbol \(currentGame.incorrectMovesRemain)")
    }
}

