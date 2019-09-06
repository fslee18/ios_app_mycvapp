//
//  myCVViewController.swift
//  myCV
//
//  Created by Sandy Lee on 2019-09-03.
//  Copyright © 2019 Sandy Lee. All rights reserved.
//

import UIKit

class myCVViewController: UIViewController {
    
    var jsonResponseFirstname = ""
    var jsonResponseLastname = ""
    var jsonResponseEmail = ""
    var jsonResponseCell = ""
    var jsonResponseSummary = ""
    var jsonResponseSkill : [String] = []
    var jsonResponseWork : [[String: String]] = [[:]]
    
    
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingActivity.alpha = 0.0
        loadingActivity.sizeToFit()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewButton(_ sender: Any) {
        
        loadingActivity.alpha = 1.0
        loadingActivity.style = .whiteLarge
        loadingActivity.color = UIColor.blue
        loadingActivity.startAnimating()
        
        getCVdetails()
    }
    
    func getCVdetails() {
        
        guard let url = URL(string: "https://gist.githubusercontent.com/fslee18/16fc9ff447df62997674c87ff8731bcf/raw/2990bb87deba7976b7384dbed433e051f3b72d50/myCVapp.json") else {return}
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print(jsonResponse)
                guard let jsonResponseArray = jsonResponse as? [String: Any] else {
                    return
                }
                print(jsonResponseArray["jemail"]! as! String)
                print(jsonResponseArray["jskill"]! as! [String])
                print(jsonResponseArray["jwork"]! as! [Any])
                
                self.jsonResponseFirstname = jsonResponseArray["jfirstname"]! as! String
                self.jsonResponseLastname = jsonResponseArray["jlastname"]! as! String
                self.jsonResponseEmail = jsonResponseArray["jemail"]! as! String
                self.jsonResponseCell = jsonResponseArray["jcellphone"]! as! String
                self.jsonResponseSummary = jsonResponseArray["jsummary"]! as! String
                self.jsonResponseSkill = jsonResponseArray["jskill"]! as! [String]
                self.jsonResponseWork = jsonResponseArray["jwork"]! as! [[String: String]]

                DispatchQueue.main.async{
                
               self.performSegue(withIdentifier: "moveToSummary", sender: self)
                   //self.loadingActivity.alpha = 0.01
                   self.loadingActivity.stopAnimating()
                }


                
            } catch let parsingError {
                print("Error in parsing", parsingError)
            }
        }
        task.resume()
     
    }
    
   

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let summaryVC = segue.destination as? SummaryViewController {
        summaryVC.sfirstName = self.jsonResponseFirstname
        summaryVC.slastName = self.jsonResponseLastname
        summaryVC.semail = self.jsonResponseEmail
        summaryVC.scellphone = self.jsonResponseCell
        summaryVC.ssummary = self.jsonResponseSummary
        summaryVC.sskill = self.jsonResponseSkill
        summaryVC.swork = self.jsonResponseWork
        
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
