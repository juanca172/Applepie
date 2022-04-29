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
    let word : String
    var guessedLetters : [Character]
    var puntaje : Int

    init (incorrectMovesRemain : Int ,word : String, guessedLetters : [Character], puntaje : Int) {
        self.puntaje = puntaje
        self.incorrectMovesRemain = incorrectMovesRemain
        self.guessedLetters = guessedLetters
        self.word = word
    }
    var FormmatedWord : String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    /*mutating func formattedWord () -> String{
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }*/
    //mutating hace que podamos cambiar el valor predeterminado de una propiedad
     mutating func charactersSelected(letraEscogida : Character) {
        guessedLetters.append(letraEscogida)
        if !word.contains(letraEscogida){
            incorrectMovesRemain -= 1
        } 
    }
    
}
