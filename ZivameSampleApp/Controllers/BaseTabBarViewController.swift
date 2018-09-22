//
//  ViewController.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 20/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UIViewController,BaseTabBarViewModelProtocol {
    
    private var containerView: UIView!
    private var tabBarView: UIView!
    
    private let vModel:BaseTabBarViewModel = BaseTabBarViewModel()
    
    private var navBarView:UIView!
    
    private var activeViewController: UIViewController? {
        didSet {
            if(activeViewController != nil){
                removeInactiveViewController(inactiveViewController: oldValue)
                updateActiveViewController()
            }
        }
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            inActiveVC.willMove(toParentViewController: nil)
            inActiveVC.view.removeFromSuperview()
            inActiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            addChildViewController(activeVC)
            activeVC.view.frame = containerView.bounds
            containerView.addSubview(activeVC.view)
            activeVC.didMove(toParentViewController: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vModel.delegate = self
        self.view.backgroundColor = UIColor.white
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vModel.getDataForApp {
            self.setUpTabBarControllerWithFirstViewController()
        }
    }
    
    private func setupView() {
        tabBarView = UIView()
        containerView = UIView()
        navBarView = UIView()
        navBarView.layer.zPosition = 1.0
        navBarView.backgroundColor = UIColor.white
        navBarView.translatesAutoresizingMaskIntoConstraints = false
    
        let viewDict = ["tabBarView":tabBarView!,"containerView":containerView!,"navBarView":navBarView!]
        self.view.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabBarView)
        self.view.addSubview(containerView)
        self.view.addSubview(navBarView)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[navBarView(60.0)]-(15)-[tabBarView(60.0)]-(10)-[containerView]-|", options: [], metrics: nil, views: viewDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tabBarView]|", options: [], metrics: nil, views: viewDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[navBarView]|", options: [], metrics: nil, views: viewDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", options: [], metrics: nil, views: viewDict))
        
        setupNavBar()
        
    }
    
    func setupNavBar() {
        let zivameLabel = UILabel()
        zivameLabel.translatesAutoresizingMaskIntoConstraints = false
        zivameLabel.text = "ZIVAME"
        zivameLabel.textColor = AppColors.selectedPinkColor
        zivameLabel.font = UIFont(name: "Verdana", size: 22.0)
        navBarView.layer.shadowOffset = CGSize(width: 0, height: 3)
        navBarView.layer.shadowRadius = 1
        navBarView.layer.shadowOpacity = 0.5
        navBarView.layer.shadowColor = UIColor.black.cgColor
        navBarView.addSubview(zivameLabel)
        navBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(70.0)-[zivame]", options: [], metrics: nil, views: ["zivame":zivameLabel]))
        
        navBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[zivame]-|", options: [], metrics: nil, views: ["zivame":zivameLabel]))
        
        let refreshButton = UIButton()
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.setImage(UIImage(named: "refresh"), for: .normal)
        refreshButton.addTarget(self, action: #selector(refreshClicked), for: .touchDown)
        navBarView.addSubview(refreshButton)
        navBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[refreshButton(30.0)]-(20)-|", options: [], metrics: nil, views: ["refreshButton":refreshButton]))
        
        navBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[refreshButton]|", options: [], metrics: nil, views: ["refreshButton":refreshButton]))
        
    }
    
    @objc func refreshClicked() {
        vModel.getDataForApp {[weak self] in
            self?.tabBarView.subviews.forEach({ (view)  in
                view.removeFromSuperview()
            })
            
            self?.removeInactiveViewController(inactiveViewController: self?.activeViewController)
            self?.activeViewController = nil
            self?.setUpTabBarControllerWithFirstViewController()
        }
    }
    
    
    func setUpTabBarControllerWithFirstViewController()
    {
        var lastIndex:Int=0
        
        vModel.containerChildViews?.forEach({ (view) in
            tabBarView.addSubview(view)
            
            if lastIndex == 0 {
                let viewDict = ["view":view,"tabBar":tabBarView!]
                tabBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]", options: [], metrics: nil, views: viewDict))
                tabBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: viewDict))
            }else{
                let viewDict = ["view":view,"tabBar":tabBarView!,"lastView": vModel.containerChildViews![lastIndex-1]]
               
                tabBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[lastView]-[view]", options: [], metrics: nil, views: viewDict))
                tabBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: viewDict))
            }
           
            NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: tabBarView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
            
             NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: (UIScreen.main.bounds.size.width - 20.0)/CGFloat(vModel.containerChildViews?.count ?? 0)).isActive=true
            
            lastIndex += 1
            if(lastIndex==vModel.containerChildViews?.count){
                NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0.0).isActive = true
            }
        })

        if(activeViewController==nil){
            activeViewController = vModel.childControllers?.first
            vModel.selectedIndex = 0
        }
        
    }
    
    func didClicked(_ index: Int) {
        activeViewController = vModel.childControllers?[index]
    }
    
}
