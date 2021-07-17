//
//  ViewController.swift
//  GodamNews
//
//  Created by Aiman on 2021/07/11.
//

import UIKit

class FrontPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let dummyData = NewsData(hits: [
        NewsData.HitData(title: "title1", url: "url1", objectID: 1),
        NewsData.HitData(title: "title2", url: "url2", objectID: 2),
        NewsData.HitData(title: "title3", url: "url3", objectID: 3),
        NewsData.HitData(title: "title4", url: "url4", objectID: 4),
        NewsData.HitData(title: "title5", url: nil, objectID: 5),
        NewsData.HitData(title: "title6", url: "url6", objectID: 6)
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me at \(dummyData.hits[indexPath.row].id)")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.hits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dummyData.hits[indexPath.row].title
        cell.detailTextLabel?.text = dummyData.hits[indexPath.row].url
        
        return cell
    }
    
    


}

