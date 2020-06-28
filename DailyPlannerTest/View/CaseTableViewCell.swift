//
//  CaseTableViewCell.swift
//  DailyPlannerTest
//
//  Created by Азат Алекбаев on 20.06.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class CaseTableViewCell: UITableViewCell {

    @IBOutlet weak var caseNameLabel: UILabel!
    @IBOutlet weak var caseHoursLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
