//
//  ViewController.swift
//  SuperSenha
//
//  Created by Mauricio Miyamura on 05/04/18.
//  Copyright © 2018 Yuddi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfSize: UITextField!
    @IBOutlet var swLetters: UISwitch!
    @IBOutlet var swNumbers: UISwitch!
    @IBOutlet var swCapitalLetters: UISwitch!
    @IBOutlet var swSpecial: UISwitch!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        if let passwordSize = Int(tfSize.text!) {
            passwordsViewController.passwordSize = passwordSize
        }
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecial.isOn
    }
    
    @IBAction func sizeValidation(_ sender: UITextField) {
        if let passwordSize = Int(sender.text!) {
            sender.text = String(max(min(passwordSize, 16), 4))
        }
    }
    
    @IBAction func switchChange() {
        view.endEditing(true)
    }

    @IBAction func generatePasswords() {
        if swLetters.isOn || swNumbers.isOn || swCapitalLetters.isOn || swSpecial.isOn {
            performSegue(withIdentifier: "generateSegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Aviso", message: "Selecione pelo menos um tipo de caractere", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

