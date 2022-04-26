//
//  ViewController.swift
//  life-counter
//
//  Created by stlp on 4/19/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var editNPlayers: UIStepper!
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var p1ScoreLabel: UILabel!
    @IBOutlet weak var p1InputN: UITextField!
    @IBOutlet weak var p1Controls: UIStackView!
    @IBOutlet weak var p1MinusN: UIButton!
    @IBOutlet weak var p1PlusN: UIButton!
    @IBOutlet weak var p1Minus: UIButton!
    @IBOutlet weak var p1Plus: UIButton!
    
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var p2ScoreLabel: UILabel!
    @IBOutlet weak var p2InputN: UITextField!
    @IBOutlet weak var p2Controls: UIStackView!
    @IBOutlet weak var p2MinusN: UIButton!
    @IBOutlet weak var p2PlusN: UIButton!
    @IBOutlet weak var p2Minus: UIButton!
    @IBOutlet weak var p2Plus: UIButton!
    
    @IBOutlet weak var player3: UILabel!
    @IBOutlet weak var p3ScoreLabel: UILabel!
    @IBOutlet weak var p3InputN: UITextField!
    @IBOutlet weak var p3Controls: UIStackView!
    @IBOutlet weak var p3MinusN: UIButton!
    @IBOutlet weak var p3PlusN: UIButton!
    @IBOutlet weak var p3Minus: UIButton!
    @IBOutlet weak var p3Plus: UIButton!
    
    @IBOutlet weak var player4: UILabel!
    @IBOutlet weak var p4ScoreLabel: UILabel!
    @IBOutlet weak var p4InputN: UITextField!
    @IBOutlet weak var p4Controls: UIStackView!
    @IBOutlet weak var p4MinusN: UIButton!
    @IBOutlet weak var p4PlusN: UIButton!
    @IBOutlet weak var p4Minus: UIButton!
    @IBOutlet weak var p4Plus: UIButton!
    
    @IBOutlet weak var loser: UILabel!
    
    var score1 = 20
    var score2 = 20
    var score3 = 20
    var score4 = 20
    
    var p1Num = 5
    var p2Num = 5
    var p3Num = 5
    var p4Num = 5
    var startGame = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        p1ScoreLabel.text = "Life total: \(score1)"
        p2ScoreLabel.text = "Life total: \(score2)"
        p3ScoreLabel.text = "Life total: \(score3)"
        p4ScoreLabel.text = "Life total: \(score4)"
        
        loser.isHidden = true
    }
    
    @IBAction func add(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            score1 += 1
        case 2:
            score2 += 1
        case 3:
            score3 += 1
        case 4:
            score4 += 1
        default:
            score4 += 1
        }
        updateScore()
    }
    
    @IBAction func addN(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            score1 += p1Num
        case 2:
            score2 += p2Num
        case 3:
            score3 += p3Num
        case 4:
            score4 += p4Num
        default:
            score4 += p4Num
        }
        updateScore()
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        switch sender.tag {
        case -1:
            score1 -= 1
        case -2:
            score2 -= 1
        case -3:
            score3 -= 1
        case -4:
            score4 -= 1
        default:
            score4 -= 1
        }
        updateScore()
    }
    
    @IBAction func subtractN(_ sender: UIButton) {
        switch sender.tag {
        case -1:
            score1 -= p1Num
        case -2:
            score2 -= p2Num
        case -3:
            score3 -= p3Num
        case -4:
            score4 -= p4Num
        default:
            score4 -= p4Num
        }
        updateScore()
    }
    
    @IBAction func updateChunk(_ sender: UITextField) {
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let allowedCharacters = "1234567890"
        let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharcterSet = CharacterSet(charactersIn: string)
        return allowedCharcterSet.isSuperset(of: typedCharcterSet)
    }
    
    @IBAction func getChunks(_ sender: UITextField) {
//        var num = Int(sender.text) ?? 0
//        switch sender.tag {
//        case 1:
//            p1Num = num
//        default:
//            p4Num = num
//        }
    }
    func updateScore() {
        p1ScoreLabel.text = "Life total: \(score1)"
        p2ScoreLabel.text = "Life total: \(score2)"
        if score1 <= 0 && score1 < score2 {
            loser.isHidden = false
            loser.text = "Player 1 Loses!"
        } else if score2 <= 0 && score2 < score1 {
            loser.isHidden = false
            loser.text = "Player 2 Loses!"
        } else {
            loser.isHidden = true
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let topSpaceConstraint = NSLayoutConstraint(
//            item: minusButton2!,
//            attribute: .top,
//            relatedBy: .equal,
//            toItem: minusButton2,
//            attribute: .bottom,
//            multiplier: 1.0,
//            constant: 22.0)
//
//        let centerXConstraint = NSLayoutConstraint(
//            item: minusButton2!,
//            attribute: .centerX,
//            relatedBy: .equal,
//            toItem: minusButton1,
//            attribute: .centerX,
//            multiplier: 1.0,
//            constant: 0)
//
//        minusButton2.addConstraint(topSpaceConstraint)
//        minusButton2.addConstraint(centerXConstraint)
//    }
    
//    @IBAction func minusButtonDidTouchUpInside(_ sender: Any) {
//        score -= 1
//        scoreLabel1.text = "\(score)"
//    }
//
//    @IBAction func plusButtonDidTouchUpInside(_ sender: Any) {
//        score += 1
//        scoreLabel1.text = "\(score)"
//    }}
}
