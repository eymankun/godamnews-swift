//
//  DetailViewController.swift
//  GodamNews
//
//  Created by Aiman on 2021/07/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var urlString = String()

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testLabel.text = urlString
        webView.load(URLRequest(url: URL(string: urlString)!))
        webView.allowsBackForwardNavigationGestures = true
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
