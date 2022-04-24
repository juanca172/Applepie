//
//  Game.swift
//  Apple Pie
//
//  Created by Juan Camilo Fonseca Gomez on 23/04/22.
//

import Foundation
import UIKit

struct Game {
    var incorrectMovesRemain : Int
    var word : String
    var guessedLetters : [Character] 
    //mutating hace que podamos cambiar el valor predeterminado de una propiedad
    mutating func charactersSelected(letraEscogida : Character) {
        guessedLetters.append(letraEscogida)
        if !word.contains(letraEscogida) {
            incorrectMovesRemain -= 1
        }
    }
    
}
