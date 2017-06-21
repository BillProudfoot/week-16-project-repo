//
//  AddTodoViewController.swift
//  ToDoApp
//
//  Created by Bill Proudfoot on 20/06/2017.
//  Copyright © 2017 Bill Proudfoot. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController, UITextFieldDelegate {
    
    var date: NSDate!

    
    //BP: IBOutlets
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    
    //BP: IBActions
    
    @IBAction func saveButtonTapped(_ sender: AnyObject) {
        print(date)
        TodoManager.sharedInstance.addNewTodoWithName(name: nameText.text!, date: date)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //BP: Text Field Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateText {
            let datePicker = UIDatePicker()
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        }
    }
    
    func datePickerChanged(sender:UIDatePicker) {
        displayDate(date: sender.date as NSDate)
        
    }
    
    func displayDate(date: NSDate){
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        dateText.text = formatter.string(from: date as Date)
        self.date = date
    }
    
    // BP: Touch events
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        date = NSDate()
        displayDate(date: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameText.delegate = self
        dateText.delegate = self
        date = NSDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // BP: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
