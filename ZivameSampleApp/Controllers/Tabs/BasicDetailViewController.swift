//
//  BasicDetailViewController.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 21/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import Foundation
import UIKit

class BasicDetailViewController:UIViewController {
    var dataToDisplay:String?
    
    @IBOutlet weak var basicTextView: UITextView!

  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicTextView.text = dataToDisplay ?? ""
    }
    
    
}
