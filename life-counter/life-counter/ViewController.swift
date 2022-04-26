//
//  ViewController.swift
//  life-counter
//
//  Created by stlp on 4/19/22.
//

import UIKit

class ViewController: UIViewController {

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
    
    @IBOutlet weak var loser: UILabel!
    
    var score1 = 20
    var score2 = 20
    var p1Num = 5
    var p2Num = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        p1ScoreLabel.text = "Life total: \(score1)"
        p2ScoreLabel.text = "Life total: \(score2)"
        loser.isHidden = true
    }
    
    @IBAction func add(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            score1 += 1
        case 2:
            score2 += 1
        default:
            score2 += 1
        }
        updateScore()
    }
    
    @IBAction func addN(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            score1 += p1Num
        case 2:
            score2 += p2Num
        default:
            score2 += p2Num
        }
        updateScore()
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        switch sender.tag {
        case -1:
            score1 -= 1
        case -2:
            score2 -= 1
        default:
            score2 -= 1
        }
        updateScore()
    }
    
    @IBAction func subtractN(_ sender: UIButton) {
        switch sender.tag {
        case -1:
            score1 -= p1Num
        case -2:
            score2 -= p2Num
        default:
            score2 -= p2Num
        }
        updateScore()
    }
    
    @IBAction func editPlayerScores(_ sender: UIButton) {
        switch sender.tag {
        case -4:
            score1 += 5
        case -3:
            score1 -= 5
        case -2:
            score1 += 1
        case -1:
            score1 -= 1
        case 1:
            score2 -= 1
        case 2:
            score2 += 1
        case 3:
            score2 -= 5
        default:
            score2 += 5
        }
        updateScore()
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
