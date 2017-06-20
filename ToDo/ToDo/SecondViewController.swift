//
//  SecondViewController.swift
//  ToDo
//
//  Created by Bill Proudfoot on 20/06/2017.
//  Copyright © 2017 Bill Proudfoot. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    @IBAction func addItem(_ sender: AnyObject)
    {
        if (input.text != "")
        {
            list.append(input.text!)
            input.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

