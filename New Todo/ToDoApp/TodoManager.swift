//
//  TodoManager.swift
//  ToDoApp
//
//  Created by Bill Proudfoot on 20/06/2017.
//  Copyright © 2017 Bill Proudfoot. All rights reserved.
//

import UIKit

class TodoManager {
    // Singleton 
    static let sharedInstance = TodoManager()
    
    var todos = [Todo]()
    
    var count: Int {
        get {
            return todos.count
        }
    }
    
    func todoAtIndex(index: Int) -> Todo {
        return todos[index]
    }
    
    func addNewTodoWithName(name: String) {
        let todo = Todo(name: name)
        todos.append(todo)
        
    }
    
    // MARK: INIT
    
    private init() {
        todos.append(Todo(name: "Do Project"))
        let t = Todo(name: "Have bacon rolls")
        t.completed = true
        todos.append(t)
        todos.append(Todo(name: "Do PDA Stuff"))
        todos.append(Todo(name: "Buy Beer"))
        todos.append(Todo(name: "Get Chips"))
        
    }
}

