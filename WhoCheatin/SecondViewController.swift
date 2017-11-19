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
    
    fileprivate var answers: [String] = []
    fileprivate var randomPics: [UIImage] = [#imageLiteral(resourceName: "monopolyCheater"), #imageLiteral(resourceName: "perfectBalls"), #imageLiteral(resourceName: "cheatingDogs")]
    
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
            randomPics.append(rPI)
        }
        
        answers = ["Take a vote", // 0
            "100% cheatin'",    // 1
            "WhAt Is ThIs GaMe?", // 2
            "Definitely", // 3
            "\(playerName)'s a shark. Don't trust them.", // 4
            "Watch \(playerName)'s hands",  // 5
            "I trust \(playerName)",  // 6
            "Take a look under the table, \(playerName) is stashing cards", // 7
            "Beginner's luck",  // 8
            "I don't think that \(playerName) would do that", // 9
            "\(playerName) is a saint! Just look at their picture!"]  // 10
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
        let randomIndex = arc4random_uniform(UInt32(answers.count))
        
        sbImage.isHidden = false
        
        switch randomIndex {
        case 2:
            sbImage.image = #imageLiteral(resourceName: "spongebobicon")
        case 4:
            sbImage.image = #imageLiteral(resourceName: "poker-sharks-darya-hrybava")
        case 5:
            sbImage.image = #imageLiteral(resourceName: "hands")
        case 7:
            sbImage.image = #imageLiteral(resourceName: "cheatingDogs")
        case 8:
            sbImage.image = #imageLiteral(resourceName: "beginner")
        case 10:
            sbImage.image = profileImage
        default:
            sbImage.image = getPicFromRandom()
        }
        
        sbImage.contentMode = .scaleAspectFit
        
        answerLabel.text = answers[Int(randomIndex)]
    }
    
    private func getPicFromRandom() -> UIImage {
        let randomIndex = arc4random_uniform(UInt32(randomPics.count))
        return randomPics[Int(randomIndex)]
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

