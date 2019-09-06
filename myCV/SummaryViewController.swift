//
//  SummaryViewController.swift
//  myCV
//
//  Created by Sandy Lee on 2019-09-04.
//  Copyright © 2019 Sandy Lee. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    var sfirstName = ""
    var slastName = ""
    var semail = ""
    var scellphone = ""
    var ssummary = ""
    var sskill : [String] = []
    var swork : [[String: String]] = [[:]]
    var skillString = ""
    var workString = ""
    
    
    @IBOutlet weak var summaryTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for n in sskill {
           skillString += " " + n
        }
        print(skillString)
        for i in 0...swork.count-1 {
           workString  +=
            "Title - \(swork[i]["title"]!) \n" +
            "Company - \(swork[i]["company"]!) \n" +
            "Date - From \(swork[i]["from"]!) To \(swork[i]["to"]!) \n" +
            "Main responsibilities - \(swork[i]["responsibilities"]!) \n" +
            "------------------------------ \n"
        }
        print(workString)
        
            summaryTextView.text =
            "My Profile: \n" +
            "Firstname： \(sfirstName.uppercased()) Lastname: \(slastName.uppercased())\n" +
            "Email Address: \(semail)\n" +
            "Cell Phone: \(scellphone)\n" +
        "Technical Skill(s): \(skillString.uppercased())\n"
        self.view.addSubview(summaryTextView)
    }
    
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            summaryTextView.text =
                "My Profile: \n" +
                "Firstname： \(sfirstName.uppercased()) Lastname: \(slastName.uppercased())\n" +
                "Email Address: \(semail)\n" +
                "Cell Phone: \(scellphone)\n" +
            "Technical Skill(s): \(skillString.uppercased())\n"
        case 1:
            summaryTextView.text = "My Professional: \n\(ssummary)"
        case 2:
            summaryTextView.text =
            "My Work Experience: \n" +
            "\(workString)"
        default:
           break
        }
        
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
