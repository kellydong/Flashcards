//
//  ViewController.swift
//  Flashcards
//
//  Created by Kelly Dong on 2/15/20.
//  Copyright © 2020 Kelly Dong. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var correctChoice = ""
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
        //creationController.questionTextField.text = frontLabel.text
        //creationController.answerTextField.text = backLabel.text
        if segue.identifier == "EditSegue"{
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }

    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Read saved flashcards
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(question: "What is the captial of Brazil?", answer: "Brasilia", choice1: "Rio de Janeiro", choice2: "Brasilia", choice3: "Sao Paulo")
        }
        else {
            updateLabels()
            updateNextPrevButtons()
        }
            
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
    
    func updateFlashcard(question: String, answer: String, choice1: String, choice2: String, choice3: String){
        let flashcard = Flashcard(question: question, answer: answer)
        self.frontLabel.text = question
        self.backLabel.text = answer
        self.answerA.setTitle(choice1, for: .normal)
        self.answerB.setTitle(choice2, for: .normal)
        self.answerC.setTitle(choice3, for: .normal)
        
        // making sure everything shows normally after changing the inputs
        answerA.isHidden = false
        answerB.isHidden = false
        answerC.isHidden = false
        frontLabel.isHidden = false
        
        correctChoice = answer
        
        // Adding flashcard in the flashcards array
        flashcards.append(flashcard)
        print("😎 Added new flashcard")
        print("😎 We have now \(flashcards.count) flashcards")
        currentIndex = flashcards.count - 1
        print("😎 Our current index is \(currentIndex)")
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    
    @IBAction func didTapA(_ sender: Any) {
        if(answerA.titleLabel?.text == correctChoice){
            frontLabel.isHidden = true
        }
        else {
            answerA.isHidden = true
        }
    }
    
    @IBAction func didTapB(_ sender: Any) {
        if(answerB.titleLabel?.text == correctChoice){
            frontLabel.isHidden = true
        }
        else {
            answerB.isHidden = true
        }
    }
    
    @IBAction func didTapC(_ sender: Any) {
        if(answerC.titleLabel?.text == correctChoice){
            frontLabel.isHidden = true
        }
        else {
            answerC.isHidden = true
        }
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButtons()
    }
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    func updateNextPrevButtons() {
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        //answerA.setTitle(currentFlashcard.answerA, for: .normal)
    }
    
    func saveAllFlashcardsToDisk() {
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question": card.question, "answer": card.answer]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
}

