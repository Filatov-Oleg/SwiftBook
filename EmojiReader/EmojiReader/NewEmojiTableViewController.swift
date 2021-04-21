//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Олег Филатов on 15.10.2020.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = Emoji(emoji: "", name: "", description: "", isFavorite: false)
    
    @IBOutlet weak var emojiTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    
    @IBOutlet weak var saveButtom: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateSafeButtonState()
    }
    
    private func updateSafeButtonState(){
        let emojiText = emojiTF.text ?? ""
        let nameText = nameTF.text ?? ""
        let descroptionText = descriptionTF.text ?? ""
        
        saveButtom.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descroptionText.isEmpty
    }
    
    private func updateUI(){
        emojiTF.text = emoji.emoji
        nameTF.text = emoji.name
        descriptionTF.text = emoji.description
    }
    
    @IBAction func textChange(_ sender: UITextField) {
        updateSafeButtonState()
    }
    // MARK: - Table view data source
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSeque" else {
            return
        }
        let emoji = emojiTF.text ?? ""
        let name = nameTF.text ?? ""
        let description = descriptionTF.text ?? ""
        
        self.emoji = Emoji(emoji: emoji, name: name, description: description, isFavorite: self.emoji.isFavorite)
    }
}
