//
//  ViewController.swift
//  Apple Pie
//
//  Created by Juan Camilo Fonseca Gomez on 21/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet var ImagenArbol: UIImageView!
    @IBOutlet var CorrectWordLabel: UILabel!
    @IBOutlet var ScoreLabel: UILabel!
    @IBOutlet var LetterButtons: [UIButton]!
    
    // Constants
    var currentGame: Game?
    var listOfWords = [
        "corsario",
        "caballero",
        "televisor",
        "matematicas",
        "ingles",
        "cosina",
        "estufa",
        "nevera",
        "horno",
        "tenedor",
        "parque",
        "pinguinos",
        "leones",
        "perros",
        "caballos",
        "castillo"
    ]
    let incorrectMovesAllowed = 7
    var totalOfWins = 0
    var totalOfLosses = 0
    
    // MARK: - ViewController LifeCycle
    // Ciclo de vida de un ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    // MARK: - Methods
    @IBAction func BotonesConLetras(_ sender: UIButton) {
        
        sender.isEnabled = false
        
        guard let letterstring = sender.titleLabel?.text?.lowercased(),
              let currentGame = currentGame else {
            return
        }
        
        let letter = Character(letterstring)
        currentGame.charactersSelected(letraEscogida: letter)
    }
    
    func newRound (){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(incorrectMovesRemain: incorrectMovesAllowed,
                           word: newWord)
        updateUI()
    }
    
    func updateUI() {
        guard let currentGame = currentGame else {
            return
        }
        ScoreLabel.text = "Triunfos : \(totalOfWins), derrotas : \(totalOfLosses)"
        ImagenArbol.image = UIImage(named: "Arbol \(currentGame.incorrectMovesRemain)")
    }
}

