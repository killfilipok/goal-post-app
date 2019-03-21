//
//  FinishGoalVC.swift
//  goal-post-app
//
//  Created by Philip on 3/21/19.
//  Copyright © 2019 Philip. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    //outlets
    @IBOutlet weak var createGaolBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    //vars
    var goalDescription : String!
    var goalType : GoalType!
    
    func initData(desctiption:String, type: GoalType){
        self.goalType = type
        self.goalDescription = desctiption
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pointsTextField.delegate = self
        createGaolBtn.bindToKeyboard()
    }
    
    //actions
    @IBAction func createGoal(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { (success) in
                if success {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func save(completion: (_ finished: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("SAVE: ERROR \(error.localizedDescription)")
            completion(false)
        }
        
    }
}
