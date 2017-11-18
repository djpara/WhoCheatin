//
//  ViewController.swift
//  WhoCheatin
//
//  Created by David Para on 11/18/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var sbImage: UIImageView!
    
    private var playerName: String = "they"
    private var playerGame: String = "right now"
    private var profileImage: UIImage = #imageLiteral(resourceName: "LogoSample_ByTailorBrands")
    
    var receivedPlayerString: String?
    var receivedGameString: String?
    var receivedProfileImage: UIImage?
    
    var answers: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        configureUIComponents()
    }
    
    private func loadData() {
        // Load player and game information first
        if let rPS = receivedPlayerString, let rGS = receivedGameString {
            playerName = rPS
            playerGame = rGS
        }
            
        if let rPI = receivedProfileImage {
            profileImage = rPI
        }
        
        answers = ["Take a vote",
            "100% cheatin'",
            "WhAt Is ThIs GaMe?",
            "Definitely",
            "\(playerName)'s a shark. Don't trust them.",
            "Watch \(playerName)'s hands",
            "I trust \(playerName)",
            "Take a look under the table, \(playerName) is stashing cards",
            "Beginner's luck",
            "I don't think that \(playerName) would do that",
            "\(playerName) is a saint! Just look at their picture!"]
    }
    
    private func configureUIComponents() {
        
        // QUESTION LABEL
        questionLabel.text = "Does \(playerName) cheat at \(playerGame)?"
        
        // IMAGE
        sbImage.isHidden = true
        sbImage.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        sbImage.layer.shadowRadius = 5
        sbImage.layer.shadowOpacity = 0.5
        
        // TAP BUTTON
        tapButton.layer.cornerRadius = 8
        tapButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        tapButton.layer.shadowRadius = 5
        tapButton.layer.shadowOpacity = 0.5
        
        // CLEAR BUTTON
        clearButton.layer.cornerRadius = 8
        clearButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        clearButton.layer.shadowRadius = 5
        clearButton.layer.shadowOpacity = 0.5
        
        //BACK BUTTON
        backButton.layer.cornerRadius = 8
        backButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        backButton.layer.shadowRadius = 5
        backButton.layer.shadowOpacity = 0.5
    }
    
    public func appendNewResponses(_ newResponses: [String]) {
        answers.append(contentsOf: newResponses)
    }

    @IBAction func tapButtonTapped(_ sender: UIButton) {
        let answerIndex = arc4random_uniform(UInt32(answers.count-1))
        
        sbImage.isHidden = false
        
        switch answerIndex {
        case 2:
            sbImage.image = #imageLiteral(resourceName: "spongebobicon")
        case 4:
            sbImage.image = #imageLiteral(resourceName: "poker-sharks-darya-hrybava")
        default:
            sbImage.image = profileImage
        }
        
        answerLabel.text = answers[Int(answerIndex)]
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        sbImage.isHidden = true
        answerLabel.text = ""
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addResponseController = segue.destination as? AddNewResponseViewController
        
        addResponseController?.delegate = self
    }
}

