//
//  ViewController.swift
//  ApIApp
//
//  Created by Abdalla on 8/28/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    // MARK: Porperties
    
    @IBOutlet var tableView: UITableView!
    var ListLanguages: [LanguagesModel] = []
    var cellId = "tableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        getData()
    }
    
    func getData() {
        NetworkManager().getDataFromServer(path: "lang/es", callback: { data in
            do {
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode([LanguagesModel].self, from: data)
                self.ListLanguages = jsonData
                
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        })
    }
}

class cellTableView: UITableViewCell {
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblTopLevelDomain: UILabel!
    @IBOutlet var lblTranslations: UILabel!
    @IBOutlet var lblLanguages: UILabel!
    @IBOutlet var imageFlag: UIImageView!
}

// MARK: - Handlers

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListLanguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! cellTableView
        
        let lan = ListLanguages[indexPath.row]
        cell.lblName.text = lan.name
        cell.lblTopLevelDomain.text = lan.topLevelDomain?[0]
        cell.lblTranslations.text = lan.translations.fa
        print(lan.flag)
        cell.imageFlag.kf.setImage(with: URL(string: "https://restcountries.eu/data/ecu.svg"))
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

// MARK: - Model

struct LanguagesModel: Codable {
    var name: String?
    var topLevelDomain: [String]?
    var translations: Trans
    var borders:[String]
    var flag:String// image url
}

struct Trans: Codable {
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

