//
//  NetworkManager.swift
//  GodamNews
//
//  Created by Aiman on 2021/07/17.
//

import Foundation

protocol NetworkManagerDelegate {
    func didUpdatePostData(networkManager: NetworkManager, post: NewsData)
}

struct NetworkManager {
    
    var delegate: NetworkManagerDelegate?
    
    func getPost() {
        if let url = URL(string: K.url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let safeData = data {
//                    print(safeData)
                    if error == nil {
                        DispatchQueue.main.async {
                            if let postData = parseJSON(safeData) {
                                self.delegate?.didUpdatePostData(networkManager: self, post: postData)
                            }
                        }
                    } else {
                        print(error!)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> NewsData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NewsData.self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
