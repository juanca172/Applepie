//
//  ViewController.swift
//  Apple Pie
//
//  Created by Juan Camilo Fonseca Gomez on 21/04/22.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet var ImagenArbol: UIImageView!
    @IBOutlet var CorrectWordLabel: UILabel!
    @IBOutlet var ScoreLabel: UILabel!
    @IBOutlet var LetterButtons: [UIButton]!
    //Constantes
    var currentGame : Game?
    var listOfWords : Array<String> = [
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
        "castillo"]
    let incorrectMovesAllowed = 7
    var totalOfWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalOfLosses = 0 {
        didSet {
            newRound()
        }
    }
    //Mark: View Controller LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    //Mark: Methods
    @IBAction func BotonesConLetras(_ sender: UIButton) {
        sender.isEnabled = false
        if let letterString : String = sender.titleLabel?.text {
            let letter = Character(letterString.lowercased())
            currentGame!.charactersSelected(letraEscogida: letter)
            updateGameUi()
        } else {
            print("Algo esta mal")
        }
        
    }
    func updateGameUi() {
        if currentGame?.incorrectMovesRemain == -1 {
            totalOfLosses += 1
        } else if currentGame?.word == currentGame?.FormmatedWord {
            totalOfWins += 1
        } else {
            updateUI()
        }
    }
    
    func newRound (){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            print(newWord)
            currentGame = Game(incorrectMovesRemain: incorrectMovesAllowed, word: newWord, guessedLetters: [], puntaje: 0)
            enableLetterButtons(isEnable : true)
            updateUI()
        } else {
            enableLetterButtons(isEnable: false)
        }
        
    }
    
    func updateUI() {
        var arrayDeLetras: [String] = []
        if let desEnvolver = currentGame?.FormmatedWord {
            /*/for cadaLetra in desEnvolver{
                arrayDeLetras.append(String(cadaLetra))
            }*/
            desEnvolver.map{arrayDeLetras.append(String($0))}
        } else {
            print("Algo esta mal")
        }
        let wordWithSpacing = arrayDeLetras.joined(separator: " ")
        CorrectWordLabel.text = wordWithSpacing
        ScoreLabel.text = "Triunfos : \(totalOfWins), derrotas : \(totalOfLosses), puntaje = \(currentGame?.puntaje)"
        ImagenArbol.image = UIImage(named: "Arbol \(currentGame!.incorrectMovesRemain)")
    }
    func enableLetterButtons(isEnable : Bool) {
        for button in LetterButtons {
            button.isEnabled = isEnable
        }
    }
    
}

