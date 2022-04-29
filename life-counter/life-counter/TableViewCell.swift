//
//  TableViewCell.swift
//  life-counter
//
//  Created by stlp on 4/26/22.
//

import UIKit
import SwiftUI

protocol TableViewCellProtocol: AnyObject {
    func minusButtonTouchUpInside(_ score: Int)
    func minusChunkButtonTouchUpInside(_ score: Int)
    func plusChunkButtonTouchUpInside(_ score: Int)
    func plusButtonTouchUpInside(_ score: Int)
}

class TableViewCell: UITableViewCell {
//    var score = 20
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var minusChunkButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var addRemoveLabel: UILabel!
    @IBOutlet weak var plusChunkButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var inputChunk: UITextField!
    
    
    
    
    var player: Player!
    weak var delegate: TableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        player = nil
    }
    
    func configureCell() {
        scoreLabel.text = "Life total: \(player.points ?? 0)"
    }
    
    @IBAction func minusButtonTouchUpInside(_ sender: Any) {
        player.subtract()
        scoreLabel.text = "Life total: \(player.points ?? 0)"
        delegate?.minusButtonTouchUpInside(player.points)
    }
    
    @IBAction func minusChunkButtonTouchUpInside(_ sender: Any) {
        player.subtractChunk()
        scoreLabel.text = "Life total: \(player.points ?? 0)"
        delegate?.minusChunkButtonTouchUpInside(player.points)
    }
    
    @IBAction func chunkInputEditingChanged(_ sender: UITextField) {
        player.setChunk(sender.text ?? "")
        addRemoveLabel.text = "Add/remove \(player.chunk ?? 0)"
        minusChunkButton.setTitle("-\(player.chunk ?? 0)", for: .normal)
        plusChunkButton.setTitle("+\(player.chunk ?? 0)", for: .normal)
    }
    
    
    @IBAction func plusChunkButtonTouchUpInside(_ sender: Any) {
        player.addChunk()
        scoreLabel.text = "Life total: \(player.points ?? 0)"
        delegate?.minusButtonTouchUpInside(player.points)
    }
    
    @IBAction func plusButtonTouchUpInside(_ sender: Any) {
        player.add()
        scoreLabel.text = "Life total: \(player.points ?? 0)"
        delegate?.minusButtonTouchUpInside(player.points)
    }
}
