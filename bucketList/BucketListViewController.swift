//
//  ViewController.swift
//  bucketList
//
//  Created by Isabell Frischmann on 9/11/18.
//  Copyright © 2018 Isabell Frischmann. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    
    var items = ["Sea whales", "Heli skiing", "Swim with dolphins", "Go to Kapstadt", "Go to Vietnam"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

//    create the two protocols for a table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
//    listen when a task is clicked on a specific row!! And then perform the Segue
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditSegue", sender: indexPath)
        
    }
    
//    insert swipe button to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
//    prepare the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            
            //        set the delegates to self and use the variables from the controller where you have the buttons set
            addItemTableViewController.delegate = self
        }
        else if segue.identifier == "EditSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.itemEdit = item
            addItemTableViewController.indexPath = indexPath
            
        }
    }
    
    //    import the function from the CancelButtonDelegate to cancel the action
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        print("I'm the hidden controller, but I am responding to the cancel button press on the top view controller")
        //        dismiss! -> so when the cancel button is pressed is redirects you back to the page where you come from
        dismiss(animated: true, completion: nil)
        
    }
    //    import the second function from the delegate to save the data
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
//        to save the data to the array
        if let ip = indexPath {
            items[ip.row] = text
        }
        else {
            items.append(text)
        }
        tableView.reloadData()
        print("Received text from top view: \(text)")
        dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

