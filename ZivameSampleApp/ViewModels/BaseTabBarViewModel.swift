//
//  BaseTabBarViewModel.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 22/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import Foundation
import UIKit

protocol BaseTabBarViewModelProtocol:class {
    
    func didClicked(_ : Int)
}

class BaseTabBarViewModel {
    
    var delegate:BaseTabBarViewModelProtocol?
    
    var childControllers:[UIViewController]? = []
    var containerChildViews:[CustomTabView]? = []
    
    var selectedIndex:Int? = 0
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    func populateArray(_ modelObject:DetailsModel?) {
        containerChildViews=[]
        childControllers=[]
        for basicTabData in modelObject?.details?.basicDetailsTab?.values ?? [] {
            let basicTabViewController = storyBoard.instantiateViewController(withIdentifier: HardCodedStrings.basicDetailsTabViewControllerIdentifier) as! BasicDetailViewController
            basicTabViewController.dataToDisplay=basicTabData.text
            childControllers?.append(basicTabViewController)
            
            let tabBarView = CustomTabView(withTitle: HardCodedStrings.basicDetailsTabTitle,andIndex:containerChildViews?.count)
            tabBarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clicked(_:))))
            tabBarView.translatesAutoresizingMaskIntoConstraints = false
            
            containerChildViews?.append(tabBarView)
        }
        
        for fabricTabData in modelObject?.details?.fabricAndCareTab?.values ?? [] {
            let basicTabViewController = storyBoard.instantiateViewController(withIdentifier: HardCodedStrings.fabricAndCareTabViewControllerIdentifier) as! FabricAndCareViewController
            basicTabViewController.tabBarItem = UITabBarItem.init(title: HardCodedStrings.fabricAndCareTabTitle, image: nil, selectedImage: UIImage(named:"bottomSelectedLine")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
            basicTabViewController.dataToDisplay = fabricTabData.list
            childControllers?.append(basicTabViewController)
            
            let tabBarView = CustomTabView(withTitle: HardCodedStrings.fabricAndCareTabTitle,andIndex:containerChildViews?.count)
            tabBarView.isUserInteractionEnabled = true
            tabBarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clicked(_:))))
            tabBarView.translatesAutoresizingMaskIntoConstraints = false
           
            containerChildViews?.append(tabBarView)
        }
        
        for reviewTabData in modelObject?.details?.reviewsTab?.values ?? [] {
            let basicTabViewController = storyBoard.instantiateViewController(withIdentifier: HardCodedStrings.reviewTabViewControllerIdentifier) as! ReviewViewController
            basicTabViewController.tabBarItem = UITabBarItem.init(title: HardCodedStrings.reviewsTabTitle, image: nil, selectedImage: UIImage(named:"bottomSelectedLine")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
            basicTabViewController.dataToDisplay = reviewTabData.reviews
            childControllers?.append(basicTabViewController)
            
            let tabBarView = CustomTabView(withTitle: HardCodedStrings.reviewsTabTitle,andIndex:containerChildViews?.count)
            tabBarView.isUserInteractionEnabled = true
            tabBarView.translatesAutoresizingMaskIntoConstraints = false
            tabBarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clicked(_:))))
            
            containerChildViews?.append(tabBarView)
        }
    }
    
    
    func getDataForApp(completion:@escaping(()->())) {
        NetworkManager.sharedNetworkManagerInstance.getJsonModelsForTabs(completion: {[weak self](model) in
            self?.populateArray(model)
            completion()
        })
    }
    
    @objc func clicked(_ tab:UITapGestureRecognizer) {
        
        let oldSelectedTabView = (containerChildViews?[selectedIndex!])
        oldSelectedTabView?.isSelected = false
        let newSelectedView = (tab.view as! CustomTabView)
        newSelectedView.isSelected = true
        selectedIndex = newSelectedView.indexVal
        delegate?.didClicked(selectedIndex!)
    }
    
}
