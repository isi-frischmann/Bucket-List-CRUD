//
//  addItemTableViewControllerDelegate.swift
//  bucketList
//
//  Created by Isabell Frischmann on 9/11/18.
//  Copyright © 2018 Isabell Frischmann. All rights reserved.
//

import UIKit
import Foundation

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
    
    
}
