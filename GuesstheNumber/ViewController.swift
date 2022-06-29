//
//  ViewController.swift
//  GuesstheNumber
//
//  Created by Deha Süer on 29.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var life: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var enteredNumber: UITextField!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var randım: UILabel!
    
    var correct = 0
    var heart = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadDefaultData()
    }
    func loadDefaultData(){
        button.layer.cornerRadius = 6
        randım.text = ""
        life.text = "❤️❤️❤️"
        heart = 3
        enteredNumber.text = ""
        message.text = ""
        correct = Int(arc4random_uniform(10))
        
    }

    @IBAction func button(_ sender: Any) {
        let firstNumber = enteredNumber.text ?? ""
        
        if let n1 = Int(firstNumber) {
            helper(number: n1)
            if correct == n1 {
                print("Right guess")
                randım.text = "\(correct)"
                defaultAlert(title: "🎉🎊CONGRATS!🎊🎉", message: "You win!!!!!")
            }else {
                heart = heart - 1
                if heart < 1{
                    randım.text = "\(correct)"
                    defaultAlert(title: "🥺GAME OVER!🥺", message: "You lost!!!!!")
                }
                calculateLife(heart: heart)
            }
            
        }
    }
    func defaultAlert(title:String , message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            switch action.style{
            case.default:
                self.loadDefaultData()
            case.cancel:
                print("cancel")
            default:
                print(" ")
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
      
            }
    func calculateLife(heart:Int){
        switch heart {
        case 3:
            life.text = "❤️❤️❤️"
        case 2:
            life.text = "❤️❤️"
        case 1:
            life.text = "❤️"
        default:
            life.text = ""
        }
    }
    func helper(number:Int){
        message.text = correct > number ? "Guess Higher" : "Guess Lower"
    }

        }

