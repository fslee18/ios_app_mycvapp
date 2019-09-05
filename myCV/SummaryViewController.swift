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
    var sskill : [String] = []
    
    
    @IBOutlet weak var summaryTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(sskill)
        summaryTextView.text = "My Profile: \(sfirstName)"
        self.view.addSubview(summaryTextView)
    }
    
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            summaryTextView.text = "My Profile: \(sfirstName)"
        case 1:
            summaryTextView.text = "My Professional \(semail)"
        case 2:
            summaryTextView.text = "My work"
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
