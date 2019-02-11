//
//  MarkCompleteViewController.swift
//  ToDo
//
//  Created by sahmodak on 2/6/19.
//  Copyright © 2019 Sahil. All rights reserved.
//

import UIKit

class MarkCompleteViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var toDo : ToDo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let currentToDo = toDo {
            let currentName = currentToDo.name
            if currentToDo.isImportant {
                if let unwrappedName = currentName {
                    nameLabel.text = "❗️" + unwrappedName
                }
            }
            else
            {
                nameLabel.text = currentName
            }
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        if let managedObjectContext = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            if let currentToDo = toDo {
                managedObjectContext.delete(currentToDo)
            }
            (UIApplication.shared.delegate as?
                AppDelegate)?.saveContext()
        }
        
        
        navigationController?.popViewController(animated: true)
    }

}
