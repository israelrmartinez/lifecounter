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
    @IBOutlet weak var p1Minus5: UIButton!
    @IBOutlet weak var p1pPlus5: UIButton!
    @IBOutlet weak var p1Minus: UIButton!
    @IBOutlet weak var p1Plus: UIButton!
    
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var p2ScoreLabel: UILabel!
    @IBOutlet weak var p2Minus5: UIButton!
    @IBOutlet weak var p2Plus5: UIButton!
    @IBOutlet weak var p2Minus: UIButton!
    @IBOutlet weak var p2Plus: UIButton!
    
    @IBOutlet weak var loser: UILabel!
    
    var score1 = 20
    var score2 = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createButton()
//        createButton2()
        p1ScoreLabel.text = "Life total: \(score1)"
        p2ScoreLabel.text = "Life total: \(score2)"
        loser.isHidden = true
        
//        minusButton2 = UIButton(type: .system)
//        minusButton2.setTitle("-", for: .normal)
//        minusButton2.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(minusButton2)
        
    }
    
    
    @IBAction func detectLoser(_ sender: UILabel) {
        if score1 == 0 {
            loser.text = "Player 1 Loses!"
        } else {
            loser.text = "Player 2 Loses!"
        }
        loser.isHidden = false
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
        p1ScoreLabel.text = "Life total: \(score1)"
        p2ScoreLabel.text = "Life total: \(score2)"
    }
    
    
    
    func addScore() {
    }
//
//    func createButton2() {
//        let button = UIButton(frame: CGRect(x: 300, y: 300, width: 200, height: 50))
////        button.center = view.center
//        button.configuration = createConfig()
//        view.addSubview(button)
//    }
//
//    func createConfig() -> UIButton.Configuration {
//        var config: UIButton.Configuration = .filled()
//        config.baseBackgroundColor = .systemGreen
//        config.title = "Player 1"
//        config.titleAlignment = .center
//        config.cornerStyle = .medium
//        return config
//    }
    
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
