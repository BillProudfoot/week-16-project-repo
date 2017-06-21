//
//  ViewController.swift
//  ToDoApp
//
//  Created by Bill Proudfoot on 20/06/2017.
//  Copyright © 2017 Bill Proudfoot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //BP: IBOutlets
    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func edit(_ sender: AnyObject) {
        
        tableView.isEditing = !tableView.isEditing
        
        switch tableView.isEditing {
        case true:
            editButton.title = "done"
        case false:
            editButton.title = "edit"
        }
    }
    
    //BP: Allows reordering of cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let item = todos[sourceIndexPath.row]
//        array.remove(at: sourceIndexPath.row)
//        array.insert(item, at: destinationIndexPath.row)
    }
    
    
    
    //BP: Tableview Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        }
        return TodoManager.sharedInstance.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //BP: AddNewCell or cell
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewCell")!
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let todo = TodoManager.sharedInstance.todoAtIndex(index: indexPath.row)
        cell.textLabel?.text = todo.name
        
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
//        let date = NSDate(timeIntervalSince1970: NSDate)
//        cell.detailTextLabel?.text = formatter.string(from: <#T##Date#>)
        
        var dateformatted = "No date";
        
        let dateStuff = todo.date
        
        if dateStuff != nil {
            dateformatted = formatter.string(from: todo.date as! Date)
        }
        
        cell.detailTextLabel?.text = dateformatted
        
        setCheckmarkForCell(cell: cell, completed: todo.completed)
        
        return cell
    }
    
    func setCheckmarkForCell(cell: UITableViewCell, completed: Bool){
        if completed {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    
    // BP: TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = TodoManager.sharedInstance.todoAtIndex(index: indexPath.row)
        todo.completed = !todo.completed
        TodoManager.sharedInstance.saveContext()
        let cell = tableView.cellForRow(at: indexPath)!
        setCheckmarkForCell(cell: cell, completed: todo.completed)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 1 {
            return false
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TodoManager.sharedInstance.removeTodoAtIndex(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
           
            
        }
    }

   // BP: View Lifecycle methods
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
             
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

