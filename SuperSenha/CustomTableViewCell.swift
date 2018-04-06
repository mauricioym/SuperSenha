//
//  CustomTableViewCell.swift
//  SuperSenha
//
//  Created by Mauricio Miyamura on 06/04/18.
//  Copyright © 2018 Yuddi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func copyPassword() {
        let password = cellLabel.text
        UIPasteboard.general.string = password
        
        let alert = UIAlertController(title: password, message: "Senha copiada para a área de transferência", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
