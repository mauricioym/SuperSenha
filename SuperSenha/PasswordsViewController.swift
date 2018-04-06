//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Mauricio Miyamura on 05/04/18.
//  Copyright © 2018 Yuddi. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var passwordSize: Int?
    var useLetters = true
    var useNumbers = true
    var useCapitalLetters = true
    var useSpecialCharacters = true
    
    var passwordGenerator: PasswordGenerator? = nil
    var passwords: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        passwordGenerator = PasswordGenerator(size: passwordSize, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        for _ in 0..<25 {
            passwords.append(passwordGenerator!.generate())
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell
        
        let text = passwords[indexPath.row]
        
        cell.cellLabel.text = text
        
        let lastElement = passwords.count - 1
        if indexPath.row == lastElement {
            for _ in 0..<25 {
                passwords.append(passwordGenerator!.generate())
            }
            tableView.reloadData()
        }
        
        return cell
    }
    
}
