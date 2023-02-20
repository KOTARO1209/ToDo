//
//  ToDoListViewController.swift
//  ToDo
//
//  Created by まちだこうたろう on 2023/02/20.
//

import UIKit

class ToDoListViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    var titles: [String] = []
    var contents: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveData.register(defaults: ["titles": [], "contents": [] ])
        titles = saveData.object(forKey: "titles") as! [String]
        contents = saveData.object(forKey: "contents") as! [String]
        
        collectionView.dataSource = self
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        var contentConfiguration = UIListContentConfiguration.cell()
        contentConfiguration.text = titles[indexPath.item]
        contentConfiguration.secondaryText = contents[indexPath.item]
        cell.contentConfiguration = contentConfiguration
        return cell
    }
    
    //スワイプでデータを削除する
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            let title = titleTextField.text!
    //            let content = contentTextField.text!
    //
    //            titles.remove(at: 1)
    //            contents.remove(at: 1)
    //
    //            saveData.set(titles, forKey: "titles")
    //            saveData.set(contents, forKey: "contents")
    //        }
    //    }
    
    func collectionView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 先にデータを削除しないと、エラーが発生します。
        titles.remove(at: 1)
        contents.remove(at: 1)
        //self.saveData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
