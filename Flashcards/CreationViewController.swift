//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Kelly Dong on 3/6/20.
//  Copyright © 2020 Kelly Dong. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardsController: ViewController!
    var initialQuestion: String?
    var initialAnswer: String?

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var extraAnswer1: UITextField!
    @IBOutlet weak var extraAnswer2: UITextField!
    @IBOutlet weak var extraAnswer3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer

    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        let answer1Text = extraAnswer1.text
        let answer2Text = extraAnswer2.text
        let answer3Text = extraAnswer3.text

        // check if there's text in both fields
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty) {
            let alert = UIAlertController(title: "Missing Text", message: "You need to enter a question AND an answer", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)

        }
        else {
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, choice1: answer1Text!, choice2: answer2Text!, choice3: answer3Text!)
            dismiss(animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
