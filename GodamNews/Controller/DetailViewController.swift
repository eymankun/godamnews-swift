//
//  DetailViewController.swift
//  GodamNews
//
//  Created by Aiman on 2021/07/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var urlString = String()

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testLabel.text = urlString
        print(urlString)
        // Do any additional setup after loading the view.
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
