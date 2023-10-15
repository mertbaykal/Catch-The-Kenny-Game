//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Mert Baykal on 01/10/2023.
//

import UIKit

class ViewController: UIViewController {

    var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    @objc var hideTimer = Timer()
    var highScore = 0
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        //highscore check
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil { // eger highscore 0 ise bunu yap
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int { // eger highscore 0 degil ise bunun yap
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
            
        }
        
        kenny1.isUserInteractionEnabled = true // kenny'e tiklanabilir hale gelmesi icin
        kenny2.isUserInteractionEnabled = true //kenny'e tiklanabilir hale gelmesi icin
        kenny3.isUserInteractionEnabled = true //kenny'e tiklanabilir hale gelmesi icin
        kenny4.isUserInteractionEnabled = true //kenny'e tiklanabilir hale gelmesi icin
        kenny5.isUserInteractionEnabled = true //kenny'e tiklanabilir hale gelmesi icin
        kenny6.isUserInteractionEnabled = true //kenny'e tiklanabilir hale gelmesi icin
        kenny7.isUserInteractionEnabled = true //kenny'e tiklanabilir hale gelmesi icin
        kenny8.isUserInteractionEnabled = true //kenny'e tiklanabilir hale gelmesi icin
        kenny9.isUserInteractionEnabled = true //kenny'e tiklanabilir hale gelmesi icin
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        kennyArray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        
        //Timer
        counter = 10
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        //hideTimer
        hideTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        
        hideKenny()
        
    }
    
      @objc func hideKenny() {
        //kenny1.isHidden = true // kenny gorunmez yapmak
        
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
       let random =  Int((arc4random_uniform(UInt32(kennyArray.count - 1))))// -1 cokmesin diye
        kennyArray[random].isHidden = false
    }

    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }

    @objc func countDown(){
        counter -= 1
        timeLabel.text = "Time: \(counter)"
        
        if counter == 0 {
            timer.invalidate() // timeri durdurma
            hideTimer.invalidate() // hideTimer i durdurmaya yariyor
            
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            //highScore
            if self.score > self.highScore{
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            // Allert
            let alert = UIAlertController(title: "time's Up", message: "Do You Want To Play ", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { [self] UIAlertAction in
                //replay function
                score = 0
                scoreLabel.text = "Score: \(score)"
                self.counter = 10
                self.timeLabel.text = "Time: \(counter)"
                
                
            
                //timer
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
                //hideTimer
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
                self.hideKenny()

            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true)
            
        }
    }
}

