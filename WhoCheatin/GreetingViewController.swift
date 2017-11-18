//
//  GreetingViewController.swift
//  WhoCheatin
//
//  Created by David Para on 11/18/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var logoButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUIComponents()
    }
    
    private func configureUIComponents() {
        // LOGO
        logoButton.clipsToBounds = true
        logoButton.layer.cornerRadius = 125
        
        // NAME TEXT VIEW
        nameTextField.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        nameTextField.layer.shadowRadius = 5
        nameTextField.layer.shadowOpacity = 0.5
        
        // GAME TEXT VIEW
        gameTextField.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        gameTextField.layer.shadowRadius = 5
        gameTextField.layer.shadowOpacity = 0.5
        
        // NEXT BUTTON
        nextButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        nextButton.layer.shadowRadius = 8
        nextButton.layer.shadowOpacity = 0.5
        nextButton.layer.cornerRadius = 8
    }
    
    private func callPopup(for field: String, in tField: UITextField) {
        let title = "Missing Field"
        let message = "Please enter \(field) in the \(field) box."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) {
            (alert: UIAlertAction!) in
            tField.becomeFirstResponder()
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueContoller = segue.destination as! SecondViewController
        
        segueContoller.receivedPlayerString = nameTextField.text
        segueContoller.receivedGameString = gameTextField.text
        segueContoller.receivedProfileImage = logoButton.imageView?.image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        logoButton.setBackgroundImage(nil, for: .normal)
        logoButton.setImage(image, for: .normal)
        logoButton.imageView?.contentMode = .scaleToFill
        logoButton.imageView?.clipsToBounds = true
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if nameTextField.text == "" {
            callPopup(for: "name", in: nameTextField)
            return
        }
        
        if gameTextField.text == "" {
            callPopup(for: "game", in: gameTextField)
            return
        }
        
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    
    @IBAction func logoButtonPressed(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func backgroundTouched(_ sender: Any) {
        nameTextField.resignFirstResponder()
        gameTextField.resignFirstResponder()
    }
}
