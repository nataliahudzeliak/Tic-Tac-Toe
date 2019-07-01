//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by MacOS on 3/10/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: UIButton) {
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
        
        resultLabel.center = CGPoint(x: resultLabel.center.x-500, y: resultLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x-500, y: playAgainButton.center.y)
        
        
         isGameActive = true
        
        gameState = 1
   
        statesOfButtons = [0,0,0,0,0,0,0,0,0]
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
            
        }
        
        
    }
    @IBOutlet weak var resultLabel: UILabel!
    var isGameActive = true
    // 1 for nought and 2 for cross
    var gameState = 1
    //state of button. 0- not filled 1-filled with noughts 2 - filled with crosses
    var statesOfButtons = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2],
                               [3,4,5],
                               [6,7,8],
                               [0,3,6],
                               [1,4,7],
                               [2,5,8],
                               [0,4,8],
                               [2,4,6]
    ]

    @IBAction func buttonPressed(_ sender: UIButton) {
        let activePosition = sender.tag - 1
        
        if statesOfButtons[activePosition] == 0 && isGameActive {
            
             statesOfButtons[activePosition] = gameState
            
            if gameState == 1 {
                
                sender.setImage(UIImage(named: "nought.png"), for: [])
                
               
                gameState = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                gameState = 1
                
            }
        }
        for combination in winningCombinations{
            
            if statesOfButtons[combination[0]] != 0 && statesOfButtons[combination[0]] == statesOfButtons[combination[1]] &&
                statesOfButtons[combination[1]]==statesOfButtons[combination[2]] {
                
                
                resultLabel.isHidden = false
                playAgainButton.isHidden = false
                isGameActive = false
                
                if statesOfButtons[combination[0]]==1{
                    resultLabel.text = "Noughts Have Won!"
                } else {
                    resultLabel.text = "Crosses Have Won!"
                }
                
                UIView.animate(withDuration: 1, animations: {
                    self.resultLabel.center = CGPoint(x: self.resultLabel.center.x+500, y: self.resultLabel.center.y)
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x+500, y: self.playAgainButton.center.y)
                    
                })
                
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
        
        resultLabel.center = CGPoint(x: resultLabel.center.x-500, y: resultLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x-500, y: playAgainButton.center.y)
    }


}

