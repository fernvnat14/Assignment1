//
//  ViewController.swift
//  Assignment1
//
//  Created by A667271 A667271 on 23/8/2566 BE.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var repositories: [Repository] = []

    @IBOutlet weak var tableView: UITableView!
    
    struct Avatar {
        let title: String
        let imagename: String
    }

    let data: [Avatar] = [
        Avatar(title: "Wolf Chan", imagename: "skzoo1"),
        Avatar(title: "LeeBit", imagename: "skzoo2"),
        Avatar(title: "Dwaekki", imagename: "skzoo3"),
        Avatar(title: "Jiniret", imagename: "skzoo4"),
        Avatar(title: "HAN QUOKKA", imagename: "skzoo5"),
        Avatar(title: "BbokAri", imagename: "skzoo6"),
        Avatar(title: "PuppyM", imagename: "skzoo7"),
        Avatar(title: "FoxI.Ny", imagename: "skzoo8")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchDataFromAPI()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return data.count
        //return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let avatar = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositoryCell
        //let item = repositories[indexPath.row]
        //cell.repository.text = item.fullname
        cell.repository.text = avatar.title
        cell.avatar.image = UIImage(named: avatar.imagename)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Adjust the size of image (avatar)
        return 150
    }

}

extension ViewController {
  func fetchDataFromAPI() {
      AF.request("https://api.github.com/search/repositories?q=ios&per_page=8&page=1")
      .validate()
      .responseDecodable(of: Repositories.self) { (response) in
        guard let repositories = response.value else { return }
        self.repositories = repositories.all
          
        //self.items = repositories.all
        self.tableView.reloadData()
    }
  }
}
