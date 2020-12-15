//
//  QuizCorrectAnswerViewController.swift
//  CATmistry
//
//  Created by N HJ on 15/12/20.
//

import SwiftConfettiView
import UIKit

class QuizCorrectAnswerViewController: UIViewController {
    
    var isSeperation: Bool?
    var currentLevel: Int!
    var currentGame: Int!

    @IBOutlet var nextQuestionButton: UIButton!
    @IBOutlet var congratsLabel: UILabel!
    @IBOutlet var goBackLearningButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextQuestionButton.layer.cornerRadius = 25
        if isSeperation != nil {
            congratsLabel.text = "Yay good job you saved the cat!"
            nextQuestionButton.setTitle("Go Back Home", for: .normal)
            goBackLearningButton.isHidden = true
        } else {
            congratsLabel.text = "Congrats! \n\nThrough your hard work, your cat has been able to avoid the danger. \n\nYou have \(String(9 - currentGame)) rounds remaining in Level \(String(currentLevel + 1)). Keep up the good work!"
            if 9 - currentGame == 0 {
                nextQuestionButton.setTitle("Go Back Home", for: .normal)
                goBackLearningButton.setTitle("Restart", for: .normal)
            }
        }
        let confettiView = SwiftConfettiView(frame: view.bounds)
        view.addSubview(confettiView)
        confettiView.isUserInteractionEnabled = false
        confettiView.startConfetti()
    }

    @IBAction func nextGameClicked(_: Any) {
        if isSeperation != nil {
            presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        } else if 9 - currentGame == 0 {
            presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func restartClicked(_: Any) {
        let alert = UIAlertController(title: "Are you sure you would like to restart?", message: "All progress wil be lost, and you will be taken to the start page of this game.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: { _ in
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
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