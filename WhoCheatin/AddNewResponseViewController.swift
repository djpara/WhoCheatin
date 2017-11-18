//
//  AddNewResponseViewController.swift
//  WhoCheatin
//
//  Created by David Para on 11/18/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import UIKit

class AddNewResponseViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var newResponseTextView: UITextField!
    
    private var newResponses: [String] = []
    
    var delegate: SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUIComponents()
    }

    private func configureUIComponents() {
        
        // ADD BUTTON
        addButton.layer.cornerRadius = 8
        addButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowOpacity = 0.5
        
        //BACK BUTTON
        backButton.layer.cornerRadius = 8
        backButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        backButton.layer.shadowRadius = 5
        backButton.layer.shadowOpacity = 0.5
    }
    

    
    @IBAction func backButtonPressed(_ sender: UIButton) {
    
        if delegate != nil && !newResponses.isEmpty {
            delegate?.appendNewResponses(newResponses)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        guard let text = newResponseTextView.text else { return }
        newResponses.append(text)
        newResponseTextView.text = ""
    }
}
