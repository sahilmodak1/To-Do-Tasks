//
//  AddToDoItemViewController.swift
//  ToDo
//
//  Created by sahmodak on 2/6/19.
//  Copyright © 2019 Sahil. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {

    @IBOutlet weak var toDoItem: UITextField!
    @IBOutlet weak var isImportantItem: UISwitch!
    var toDoTableVC : ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToDoItem(_ sender: Any) {
        if let managedObjectContext = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDo(context: managedObjectContext)
            
            toDo.isImportant = isImportantItem.isOn
            if let value = toDoItem.text {
                toDo.name = value
            }
            (UIApplication.shared.delegate as?
                AppDelegate)?.saveContext()
        }
//        toDoTableVC?.toDos.append(toDo)
//        toDoTableVC?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }

}
