//
//  ViewController.swift
//  shoppingList
//
//  Created by mac_os on 22/08/1440 AH.
//  Copyright © 1440 mac_os. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //title
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    //Create Add Button
    @IBAction func addToList(_ sender: Any) {
        let alertController = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak alertController] _ in
            guard let item = alertController?.textFields?[0].text else { return }
            self?.submit(item)
        }
        alertController.addAction(submitAction)
        present(alertController, animated: true)
    }
    
    func submit(_ item: String) {
        shoppingList.append(item)
        tableView.reloadData()
    }
    
    //Create Delete Button
    @IBAction func deleteItem(_ sender: Any) {
        alertMessage(title: "Alert", message: "Delete Shopping List")
        shoppingList.removeAll()
        tableView.reloadData()
    }
    
    //Create Share Button
    @IBAction func shareList(_ sender: Any) {
        let list = shoppingList.joined(separator: "\n")
        let ViewController = UIActivityViewController(activityItems: [list], applicationActivities: nil)
        ViewController.popoverPresentationController?.sourceView = self.view
        self.present(ViewController, animated: true, completion: nil)
    }
    
    func  alertMessage(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    //tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }

}

