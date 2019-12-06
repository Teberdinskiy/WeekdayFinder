//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by 🧔🏻Alikhan Batchaev on 06.12.2019.
//  Copyright © 2019 Alikhan Batchaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.isHidden = true
    }
    
    @IBAction func findWeekday(_ sender: UIButton) {
        
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        guard let day = dateTF.text, let month = monthTF.text,
            let year = yearTF.text else { return }
        
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let dateFormatter = DateFormatter()
        
        /* dateFormatter.locale = Locale(identifier: "ru_Ru")
         This is not necessary, as you can simply add the country to Localization */
        
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        
        resultLabel.isHidden = false
        resultLabel.text = capitalizedWeekday
    }
    
    //Hiding the keyboard when touching an empty place
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

