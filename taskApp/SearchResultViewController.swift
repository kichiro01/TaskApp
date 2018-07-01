//
//  SearchResultViewController.swift
//  taskApp
//
//  Created by ICHIRO KAWATA on 2018/07/01.
//  Copyright © 2018年 ICHIRO KAWATA. All rights reserved.
//

import UIKit
import RealmSwift

class SearchResultViewController: UITableViewController, UISearchResultsUpdating { //UISearchResultsUpdatingを継承する
    
    // Realmインスタンスを取得する
    let realm = try! Realm()
    
    //検索にひっかっかったものを入れる変数
    var filteredItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //セルの名前を設定
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //セルに表示するテキストを設定
        cell.textLabel?.text = filteredItems[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailView = InputViewController()
        DetailView.text = self.filteredItems[indexPath.row]
        self.navigationController?.pushViewController(DetailView, animated: true)
    }
    
    //検索された時に実行される関数
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text{
            let category = try! Realm().objects(Task.self).filter("category == %@", text).value(forKey: "title")
            filteredItems = category as! Array<String>
            tableView.reloadData()
        }
    }
}
