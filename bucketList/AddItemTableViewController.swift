//
//  AddItemTableViewController.swift
//  bucketList
//
//  Created by Isabell Frischmann on 9/11/18.
//  Copyright © 2018 Isabell Frischmann. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
//    call the two Delegates 
    weak var delegate: AddItemTableViewControllerDelegate?
    var itemEdit: String?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var itemTextField: UITextField!
    
//    implement the function from the CancelButtonDelegate
    @IBAction func cancelPressed(_ sender: AddItemTableViewController) {
        delegate?.cancelButtonPressed(by: self)
        print("cancel")
        
    }
    
//    implement the function from the AddItemTableViewControllerDelegate
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.itemSaved(by: self, with: text, at: indexPath)
        print("Saved")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTextField.text = itemEdit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
