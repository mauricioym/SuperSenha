//
//  Password.swift
//  SuperSenha
//
//  Created by Mauricio Miyamura on 05/04/18.
//  Copyright © 2018 Yuddi. All rights reserved.
//

import Foundation
import GameplayKit.GKRandomSource

class PasswordGenerator {
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let numbers = "0123456789"
    private let special = ".,;:!?()[]{}<>/*-+%@#$&\\|"
    private var allCharacters = ""
    
    private let useLetters: Bool
    private let useNumbers: Bool
    private let useCapitalLetters: Bool
    private let useSpecialCharacters: Bool
    
    private var size: Int?
    
    init(size: Int?, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        if let size = size {
            self.size = max(min(size, 16), 4)
        }
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
        
        allCharacters += useLetters ? letters : ""
        allCharacters += useNumbers ? numbers : ""
        allCharacters += useCapitalLetters ? letters.uppercased() : ""
        allCharacters += useSpecialCharacters ? special : ""
    }
    
    func generate() -> String {
        if allCharacters.isEmpty {
            return ""
        }
        
        var actualSize: Int
        if let size = size {
            // Ok, size is an integer number
            actualSize = size
        } else {
            // If size is set to nil, choose a random size
            actualSize = Int(arc4random_uniform(13)) + 4
        }
        
        var password: String = ""
        // Insert at least one character of each selected type
        if useLetters {
            insertCharacter(from: letters, into: &password)
        }
        if useNumbers {
            insertCharacter(from: numbers, into: &password)
        }
        if useCapitalLetters {
            insertCharacter(from: letters.uppercased(), into: &password)
        }
        if useSpecialCharacters {
            insertCharacter(from: special, into: &password)
        }
        
        // Insert the remaining characters
        while password.count < actualSize {
            insertCharacter(from: allCharacters, into: &password)
        }
        
        // Shuffle the characters and return the shuffled string
        return String(GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Array(password)) as! [Character])
    }
    
    private func insertCharacter(from source: String, into password: inout String) {
        let position = Int(arc4random_uniform(numericCast(source.count)))
        let index = source.index(source.startIndex, offsetBy: position)
        password += String(source[index])
    }
}











