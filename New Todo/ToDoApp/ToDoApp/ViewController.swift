//
//  ViewController.swift
//  ToDoApp
//
//  Created by Bill Proudfoot on 20/06/2017.
//  Copyright © 2017 Bill Proudfoot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    //MARK: Tableview Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.sharedInstance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let todo = TodoManager.sharedInstance.todoAtIndex(index: indexPath.row)
        cell.textLabel?.text = todo.name
        
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
    
    
    // MARK: TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = TodoManager.sharedInstance.todoAtIndex(index: indexPath.row)
        todo.completed = !todo.completed
        let cell = tableView.cellForRow(at: indexPath)!
        setCheckmarkForCell(cell: cell, completed: todo.completed)
    }
    
    
    
    

   // MARK: View Lifecycle methods
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let count = TodoManager.sharedInstance.count
        print("Todo Count: \(count)")
        
        let t = TodoManager.sharedInstance.todoAtIndex(index: 0)
        print("First Todo: \(t.name)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

