//
//  CustomTabView.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 22/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import Foundation
import UIKit

class CustomTabView:UIView {
    
    var titleLabel : UILabel = UILabel()
    var titleLabelView : UIView = UIView()
    var titleName:String = "" {
        didSet{
            self.titleLabel.text = titleName
        }
    }
    var indexVal:Int = 0
    var isSelected:Bool = false{
        didSet{
            if(isSelected){
                titleLabel.textColor = AppColors.selectedPinkColor
                titleLabelView.backgroundColor = AppColors.selectedPinkColor
            }else{
                titleLabel.textColor = AppColors.blackColor
                titleLabelView.backgroundColor = AppColors.whiteColor
            }
        }
    }
    
    convenience init(withTitle:String?,andIndex:Int?) {
        self.init(frame: CGRect.zero)
        self.indexVal = andIndex ?? 0
        self.titleLabel.text = withTitle ?? ""
        commonInitializer()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInitializer()
    {
        if(indexVal==0){
            self.isSelected = true
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.backgroundColor = AppColors.clearColor
        titleLabel.font = AppFonts.proximaRegularWithSize
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabelView)
        
        let subViewDictionary = ["titleLabel" : titleLabel , "titleLabelView" : titleLabelView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel(47)]-(5)-[titleLabelView(3.0)]-(5)-|", options: [], metrics: nil, views: subViewDictionary))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[titleLabel]|", options: [], metrics: nil, views: subViewDictionary))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[titleLabelView]|", options: [], metrics: nil, views: subViewDictionary))
    }
}
