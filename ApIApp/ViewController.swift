//
//  ViewController.swift
//  ApIApp
//
//  Created by Abdalla on 8/28/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var ListLanguages: [LanguagesModel] = []
    var cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(cellTableView.self, forCellReuseIdentifier: cellId)
    
    }


}

class cellTableView: UITableViewCell{
    
    @IBOutlet weak var txtShow: UILabel!
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListLanguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? cellTableView
        cell?.txtShow.text = ListLanguages[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


struct LanguagesModel {
    
    var name: String
    var code: String
}

















class NetworkHttpClient{
    
//    func getDataFromServer() {
//        let url = URL(string: "http://restcountries.eu/rest/v2/lang/es")!
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                self.handleClientError(error)
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse,
//                (200...299).contains(httpResponse.statusCode) else {
//                    self.handleServerError(response)
//                    return
//            }
//            if let mimeType = httpResponse.mimeType, mimeType == "text/html",
//                let data = data,
//                let string = String(data: data, encoding: .utf8) {
//                DispatchQueue.main.async {
//                    self.webView.loadHTMLString(string, baseURL: url)
//                }
//            }
//        }
//        task.resume()
//    }
}
