//
//  ViewController.swift
//  TicTakToe
//
//  Created by siberianarg on 24.09.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let game = TicTacToe()
    
    @IBOutlet var arrayButtons: [UIButton]!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBAction func clickButton(_ sender: UIButton) {
        guard let index = arrayButtons.firstIndex(of: sender) else { return }
        game.setXO(index: index)
        updateView()
    }

    @IBAction func clickRestartButton(_ sender: UIButton) {
        restart()
    }
    
    func updateView() {
        for i in arrayButtons.indices {
            let xo = game.arrayXO[i]
            let button = arrayButtons[i]
            
            if xo.isOpen {
                button.setTitle(xo.write, for: .normal)
                button.isEnabled = false
            }
        }
        
        if let win = game.win() {
            winLabel.text = "Winner \(win)"
            for i in arrayButtons {
                i.isEnabled = false
            }
        }
        
        if let win = game.win() {
            if win == "Draw" {
                winLabel.text = "It's a Draw!"
            } else {
                winLabel.text = "Winner \(win)"
            }
            
            for i in arrayButtons {
                i.isEnabled = false
            }
        }
    }
    
    func restart() {
        game.arrayXO = Array(repeating: XO(), count: 9)
        game.counter = 0
        winLabel.text = ""
        
        for button in arrayButtons {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
    }
}

