//
//  FabricAndCareViewController.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 21/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import Foundation
import UIKit

class FabricAndCareViewController:UIViewController {
    var dataToDisplay:[String]?
    
    @IBOutlet weak var fabricTableView: UITableView!
    
    convenience init(withData:[String]?) {
        self.init(nibName: nil, bundle: nil)
        self.dataToDisplay=withData
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fabricTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension FabricAndCareViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataToDisplay?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.dataToDisplay?[indexPath.row] ?? HardCodedStrings.defaultString
        cell?.textLabel?.textAlignment = .left
        cell?.textLabel?.font = AppFonts.proximaRegularWithSize
        return cell ?? UITableViewCell()
    }
}

