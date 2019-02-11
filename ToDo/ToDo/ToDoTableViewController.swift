//
//  ToDoTableViewController.swift
//  ToDo
//
//  Created by sahmodak on 2/5/19.
//  Copyright © 2019 Sahil. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDoCoreData : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let todo1 = ToDo()
//        todo1.name = "Walk the dog"
//        todo1.isImportant = true
//
//        let todo2 = ToDo()
//        todo2.name = "Buy Milk"
//        todo2.isImportant = false
//
//        toDos = [todo1, todo2]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDosFromCoreData()
    }
    
    func getToDosFromCoreData() {
        
        if let managedObjectContext = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            if let toDos = try? managedObjectContext.fetch(ToDo.fetchRequest()) {
                if let allToDos = toDos as? [ToDo] {
                    toDoCoreData = allToDos
                    tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoCoreData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        let cell = UITableViewCell()
        let currentToDo = toDoCoreData[indexPath.row]
        
        if currentToDo.isImportant
        {
            if let unwrappedName = currentToDo.name {
                cell.textLabel?.text = "❗️ " + unwrappedName
            }
        }
        else
        {
            cell.textLabel?.text = currentToDo.name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDoCoreData[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as?
            AddToDoItemViewController {
            createVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as?
            MarkCompleteViewController {
            if let selectedToDo = sender as? ToDo {
                completeVC.toDo = selectedToDo
                
            }
        }
    }

}
