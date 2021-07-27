//
//  ViewController.swift
//  GodamNews
//
//  Created by Aiman on 2021/07/11.
//

import UIKit

class FrontPageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var posts = NewsData.init(hits: [])
    var networkManager = NetworkManager()
//    var detailVC = DetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.delegate = self
        tableView.dataSource = self
        networkManager.delegate = self
        
        registerTableViewCell()
        networkManager.getPost()
    }
    
    func registerTableViewCell() {
        let customCell = UINib(nibName: K.customTableViewCell, bundle: nil)
        self.tableView.register(customCell, forCellReuseIdentifier: K.customTableViewCell)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let indexPath = self.tableView.indexPathForSelectedRow!
////        let vc = segue.destination as! DetailViewController
//        if segue.identifier == K.cellIdentifier {
//            if let urlString = posts.hits[indexPath.row].url {
////                vc.urlString = urlString
//                detailVC.urlString = urlString
//            }
//        }
//    }
}

//MARK: - NetworkManagerDelegate

extension FrontPageViewController: NetworkManagerDelegate {
    func didUpdatePostData(networkManager: NetworkManager, post: NewsData) {
        posts = post
//        print(posts)
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate

extension FrontPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(posts.hits[indexPath.row].title)
        
        if posts.hits[indexPath.row].url == nil {
            print("There is no URL for this post.")
        } else if let urlString = posts.hits[indexPath.row].url {
            let vc = DetailViewController(urlString: urlString)
            navigationController?.pushViewController(vc, animated: true)
        }
        
//        performSegue(withIdentifier: "FrontToDetail", sender: FrontPageViewController.self)
    }
}

//MARK: - UITableViewDataSource

extension FrontPageViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.hits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.customTableViewCell, for: indexPath) as! CustomTableViewCell
        cell.postTitle.text = posts.hits[indexPath.row].title
        return cell
    }
}

