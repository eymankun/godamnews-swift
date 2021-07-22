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
//        testLabel.text = urlString
        loadWebView(with: urlString)
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func loadWebView(with postURLString: String) {
        let url = URL(string: postURLString)
        if url == nil {
            let alert = UIAlertController(title: "Error", message: "This post has no link", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//                print("action button tapped.")
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        } else {
            webView.load(URLRequest(url: url!))
        }
    }

}
