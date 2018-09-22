//
//  ReviewViewController.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 21/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import Foundation
import UIKit

class ReviewViewController:UIViewController {
    var dataToDisplay:[Review]?
    
    @IBOutlet weak var reviewTableView: UITableView!
    convenience init(withData:[Review]?) {
        self.init(nibName: "ReviewViewController", bundle: nil)
        self.dataToDisplay=withData
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
       self.reviewTableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: "review")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reviewTableView.estimatedRowHeight = 200.0
        self.reviewTableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil).self, forCellReuseIdentifier: "review")
    }
}

extension ReviewViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "review") as! ReviewTableViewCell
        cell.configureCell(dataToDisplay?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}


