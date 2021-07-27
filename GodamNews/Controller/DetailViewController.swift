//
//  DetailViewController.swift
//  GodamNews
//
//  Created by Aiman on 2021/07/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    private var urlString = String()
    
    var wkwebView: WKWebView!
    @IBOutlet var webView: WKWebView!
    
    init(urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let webConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfig)
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(urlString)
        
        webView.load(URLRequest(url: URL(string: urlString)!))
        
//        loadWebView(with: urlString)
    }
    
    func loadWebView(with url: String) {
        
        wkwebView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(wkwebView)
        let request = URLRequest(url: URL(string: urlString)!)
        wkwebView.load(request)
        wkwebView.allowsBackForwardNavigationGestures = true
//        navigationItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(goBack))
        
        
        
        navigationItem.rightBarButtonItems =
            [ UIBarButtonItem(title: ">", style: .plain, target: self, action: #selector(goForward)),
              UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(goBack))
            ]
        
    }
    @objc func goBack() {
        wkwebView.goBack()
    }
    @objc func refreshButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    @objc func goForward() {
        wkwebView.goForward()
    }
    
}


