//
//  QuizWrongAnswerViewController.swift
//  CATmistry
//
//  Created by N HJ on 15/12/20.
//

import UIKit

class QuizWrongAnswerViewController: UIViewController {

    var currentLevel: Int!
    var currentGame: Int!
    var isSeperation: Bool?

    @IBOutlet var nextQuestionButton: UIButton!
    @IBOutlet var goBackLearningButton: UIButton!
    @IBOutlet var sadLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextQuestionButton.layer.cornerRadius = 25
        if isSeperation != nil {
            sadLabel.text = "The wizard's beaker overflowed! Now your cat is under a spell...\nReview [Separation Methods] to save your cat. "
        } else {
            sadLabel.text = "Oh no! \n\nYour answer was wrong, and your cat died. \n\nDon't worry though, a cat has 9 lives, and you still have \(String(9 - currentGame)) rounds remaining in Level \(String(currentLevel + 1)). Good luck!"
            if 9 - currentGame == 0 {
                nextQuestionButton.setTitle("Go Back Home", for: .normal)
                goBackLearningButton.isHidden = true
            }
        }
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
     //MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}