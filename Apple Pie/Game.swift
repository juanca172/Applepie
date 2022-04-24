//
//  Game.swift
//  Apple Pie
//
//  Created by Juan Camilo Fonseca Gomez on 23/04/22.
//

import Foundation
import UIKit

class Game {
    
    // MARK: - Variables
    var incorrectMovesRemain : Int
    let word : String
    var guessedLetters : [Character]
    
    // MARK: - Methods
    init(incorrectMovesRemain: Int = 7,
         word: String) {
        self.incorrectMovesRemain = incorrectMovesRemain
        self.word = word
        self.guessedLetters = []
    }
    
    ///mutating hace que podamos cambiar el valor predeterminado de una propiedad
    ///- Parameter letraEscogida: Letra que fue escogida por un jugador
    func charactersSelected(letraEscogida : Character) {
        guessedLetters.append(letraEscogida)
        if !word.contains(letraEscogida) {
            incorrectMovesRemain -= 1
        }
    }
}
