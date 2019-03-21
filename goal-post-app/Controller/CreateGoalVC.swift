//
//  CreateGoalVC.swift
//  goal-post-app
//
//  Created by Philip on 3/21/19.
//  Copyright © 2019 Philip. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    
    //autlets
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        switchBtns()
        goalTextView.delegate = self
    }

    //actions
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(desctiption: goalTextView.text!, type: goalType)
            
            presentingViewController?.presentSecondary(finishGoalVC)
        }
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .shortTerm
        switchBtns()
    }
    @IBAction func longTermBtnPressed(_ sender: Any) {
        goalType = .longTerm
        switchBtns()
    }
    
    func switchBtns(){
        if goalType == .shortTerm {
            shortTermBtn.setSelectedColor()
            longTermBtn.setDesekectedColor()
        } else {
            longTermBtn.setSelectedColor()
            shortTermBtn.setDesekectedColor()
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
