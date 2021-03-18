//
//  ViewController.swift
//  project7
//
//  Created by mac on 2021/3/18.
//

import UIKit



class ViewController: UITableViewController {
    var petitions =  [Petition]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString =  "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
           urlString =  "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
  

        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                //ok to parse data
                parse(json: data)
                return
            }
        }
        
            showError()

    }
    //遇到網路不穩或斷線
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again ", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    //表格列數根據資料計算
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    
    //製作table表單細節  稍後從json抓資料
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    //從DetailViewController拿資料過來
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }


}

