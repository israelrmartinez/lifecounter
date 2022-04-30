//
//  ViewController.swift
//  life-counter
//
//  Created by stlp on 4/19/22.
//

import UIKit
import SwiftUI

@MainActor class GameStatus : ObservableObject {
    @Published var gameStarted: Bool = false
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loser: UILabel!
    
    @IBOutlet weak var addRemovePlayers: UILabel!
    @IBOutlet weak var setPlayers: UIStepper!
    @State var loserPlayer: String = ""
    
    var numPlayers = 4
    
    
    var allPlayers: [Player] = [
        Player(score: 20),
        Player(score: 20),
        Player(score: 20),
        Player(score: 20)
    ]
    var history: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        addRemovePlayers.text = "\(numPlayers) Players:"
        print("hello")
        loser.isHidden = true
    }
    
//    @IBAction func historyButtonTouchUpInside(_ sender: Any) {
//        performSegue(withIdentifier: "ShowHistory", sender: self)
//    }
    
    @IBAction func editPlayers(_ sender: UIStepper) {
        numPlayers = Int(sender.value)
        addRemovePlayers.text = "\(numPlayers) Players:"
    }
    
    
    @IBAction func removeStepper(_ sender: Any) {
        setPlayers.isHidden = true
        addRemovePlayers.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHistory" {
            if let hisVC = segue.destination as? HistoryViewController {
                hisVC.history = "\(history)"
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier
//        {
//        case Optional("fromFirstToSecond"):
//            print("Going from first to second")
//            let secondVC = segue.destination as! SecondViewController
//            secondVC.message = "Howdy from First"
//            break;
//        default:
//            print("I have no idea what segue you're using")
//        }
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let allowedCharacters = "1234567890"
        let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharcterSet = CharacterSet(charactersIn: string)
        return allowedCharcterSet.isSuperset(of: typedCharcterSet)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allPlayers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            cell.player = allPlayers[indexPath.section]
            cell.configureCell()
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}


extension ViewController: TableViewCellProtocol {
    func minusChunkButtonTouchUpInside(_ score: Int) {
        history.append(score)
        print(history)
    }
    
    func plusChunkButtonTouchUpInside(_ score: Int) {
        history.append(score)
        print(history)
    }
    
    func minusButtonTouchUpInside(_ score: Int) {
        history.append(score)
        print(history)
    }
    
    func plusButtonTouchUpInside(_ score: Int) {
        history.append(score)
    }
    
    func detectLoser(_ loserPlayer: Player) {
        if loserPlayer.points <= 0 {
            for (index, playerN) in allPlayers.enumerated() {
                if playerN.points == loserPlayer.points {
                    loser.text = "Player \(index + 1) loses!"
                    loser.isHidden = false
                }
            }
//            let loserPlayer: Player = player
        } else {
            loserPlayer.isLoser = true
            loser.isHidden = true
        }
    }
}
