//
//  ViewController.swift
//  Flashcards
//
//  Created by Kelly Dong on 2/15/20.
//  Copyright © 2020 Kelly Dong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backLabel.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        backLabel.clipsToBounds = true
        frontLabel.clipsToBounds = true
        
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        answerA.layer.borderWidth = 3.0
        answerA.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        answerA.layer.cornerRadius = 20.0
        answerB.layer.borderWidth = 3.0
        answerB.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        answerB.layer.cornerRadius = 20.0
        answerC.layer.borderWidth = 3.0
        answerC.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        answerC.layer.cornerRadius = 20.0

    }
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if(frontLabel.isHidden == true){
            frontLabel.isHidden = false
        }
        else {
        frontLabel.isHidden = true
        }
    }
    
    @IBAction func didTapA(_ sender: Any) {
        answerA.isHidden = true
    }
    
    @IBAction func didTapB(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    @IBAction func didTapC(_ sender: Any) {
        answerC.isHidden = true
    }
}

