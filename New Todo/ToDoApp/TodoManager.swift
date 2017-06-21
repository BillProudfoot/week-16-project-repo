//
//  TodoManager.swift
//  ToDoApp
//
//  Created by Bill Proudfoot on 20/06/2017.
//  Copyright © 2017 Bill Proudfoot. All rights reserved.
//

import UIKit
import CoreData

class TodoManager {
    // Singleton 
    static let sharedInstance = TodoManager()
    
    private var todos = [Todo]()
    let context: NSManagedObjectContext!
    
    var count: Int {
        get {
            return todos.count
        }
    }
    
    func todoAtIndex(index: Int) -> Todo {
        return todos[index]
    }
    
    func addNewTodoWithName(name: String, date:NSDate) {
        let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context) as! Todo
        
        todo.name = name
        todo.completed = false
        todo.date = date
        
        todos.append(todo)
        
        saveContext()
        
    }
    
    func removeTodoAtIndex(index: Int) {
        context.delete(todoAtIndex(index: index))
        todos.remove(at: index)
        saveContext()
    
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving context: \(error), \(error.userInfo)")
        
        }
    }
    
    
    func fetchTodos() {
        let request : NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do {
            // try
             let results = try context.fetch(Todo.fetchRequest())
            todos = results as! [Todo]
        } catch let error as NSError{
            print("Could not fetch todos: \(error), \(error.userInfo)")
            
        }
    }
    
     //BP: INIT
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.getContext()
        self.fetchTodos()
       
        }
}

