//
//  cancelButtonDelegate.swift
//  bucketList
//
//  Created by Isabell Frischmann on 9/11/18.
//  Copyright © 2018 Isabell Frischmann. All rights reserved.
//

import UIKit
import Foundation

// when the cancel button is pressed you can import this delegate everywhere
protocol CancelButtonDelegate: class {
    func cancelButtonPressed(by controller: UIViewController)
}
