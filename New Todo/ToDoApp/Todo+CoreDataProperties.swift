//
//  Todo+CoreDataProperties.swift
//  ToDoApp
//
//  Created by Bill Proudfoot on 20/06/2017.
//  Copyright © 2017 Bill Proudfoot. All rights reserved.
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo");
    }

    @NSManaged public var completed: Bool
    @NSManaged public var name: String?
    @NSManaged public var date: NSDate?

}
