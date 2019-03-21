//
//  GoalCell.swift
//  goal-post-app
//
//  Created by Philip on 3/21/19.
//  Copyright © 2019 Philip. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTermLbl: UILabel!
    @IBOutlet weak var progressLbl: UILabel!
    @IBOutlet weak var completeView: UIView!
    
    func configureCell(goal: Goal){
        self.completeView.isHidden = goal.goalProgress != goal.goalCompletionValue
        
        self.goalTermLbl.text = goal.goalType
        self.goalDescriptionLbl.text = goal.goalDescription
        self.progressLbl.text = String(describing: goal.goalProgress)
    }
    
}
