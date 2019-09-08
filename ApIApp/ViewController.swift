//
//  ViewController.swift
//  ApIApp
//
//  Created by Abdalla on 8/28/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Porperties
    
    @IBOutlet weak var tableView: UITableView!
    var ListLanguages: [LanguagesModel] = []
    var cellId = "tableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        getDataFromServer()
    }
    
    func getDataFromServer() {
        let url = URL(string: "https://restcountries.eu/rest/v2/lang/es")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
		   if let error = error {
                print(error)
		      //self.handleClientError(error)
		     return
		   }
        guard let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode) else {
            print(response as Any)
		   //self.handleServerError(response)
		    return
		}
          if let data = data{
		        let string = String(data: data, encoding: .utf8)
            do{
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode([LanguagesModel].self, from: data)
                self.ListLanguages = jsonData
                
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            }catch{
                print(error)
            }
          }
        }
		task.resume()
		}
}

class cellTableView: UITableViewCell{
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTopLevelDomain: UILabel!
    @IBOutlet weak var lblTranslations: UILabel!
    @IBOutlet weak var imageFlag: UIImageView!
}

//MARK:- Handlers

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListLanguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! cellTableView
        
        let lan = ListLanguages[indexPath.row]
        cell.lblName.text = lan.name
        cell.lblTopLevelDomain.text = lan.topLevelDomain?[0]
        cell.lblTranslations.text = lan.translations.fa
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

//MARK:- Model

struct LanguagesModel: Codable {
    
    var name: String?
    var topLevelDomain: [String]?
    var borders: [String]?
    var translations: Trans
}

struct Trans: Codable{
    var de: String?
    var es: String?
    var fr: String?
    var it: String?
    var br: String?
    var pt: String?
    var nl: String?
    var hr: String?
    var fa: String?
}
