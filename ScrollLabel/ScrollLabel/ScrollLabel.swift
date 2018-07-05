//
//  ScrollLabel.swift
//  ScrollLabel
//
//  Created by 防神 on 2018/7/4.
//  Copyright © 2018年 吃面多放葱. All rights reserved.
//

import UIKit

class ScrollLabel: UIView {
    
    // MARK: - Properties
    var centerLabel = UILabel()
    
    var text: String = ""{
        willSet{
            self.centerLabel.text = newValue;
        }
    }
    override var frame: CGRect {
        willSet{
            self.centerLabel.frame = CGRect(x: 0, y: 0, width: newValue.size.width, height: newValue.size.height);
        }
    }
    var textColor: UIColor = .white{
        willSet{
            self.centerLabel.textColor = newValue;
        }
    }
    var align: NSTextAlignment = .center{
        willSet{
            self.centerLabel.textAlignment = newValue;
        }
    }
    
    var font: UIFont = UIFont.systemFont(ofSize: 17) {
        willSet{
            self.centerLabel.font = newValue;
        }
    }
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame);
        addSubview(centerLabel);
        self.layer.masksToBounds = true;
        
        self.centerLabel.frame           = self.bounds;
        self.centerLabel.textColor       = textColor;
        self.centerLabel.textAlignment   = align;
        self.centerLabel.font            = font;
        self.centerLabel.text            = text;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func changeText(newText: String, animated: Bool) {
        
        if animated {
            animation(newText: newText);
        }else{
            self.centerLabel.text = newText;
        }
    }
    
    // MARK: - Animation
    func animation(newText: String) {
        let label           = UILabel();
        label.textColor     = textColor;
        label.textAlignment = align;
        label.font          = font;
        label.text          = newText;
        
        //判断从上移动还是从下移动
        var scrollUP: Bool;
        if newText > self.centerLabel.text! {
            label.frame = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y + self.bounds.size.height, width: self.bounds.size.width, height: self.bounds.size.height);
            scrollUP = true;
        }else if (newText == self.centerLabel.text!){
            self.centerLabel.text = newText;
            return;
        }else{
            label.frame = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y - self.bounds.size.height, width: self.bounds.size.width, height: self.bounds.size.height);
            scrollUP = false;
        }
        self.addSubview(label);
        //开始动画
        UIView.animate(withDuration: 1, animations: {
            label.frame.origin.y = 0;
            if scrollUP {
                self.centerLabel.frame.origin.y = -self.bounds.size.height;
            }else{
                self.centerLabel.frame.origin.y = self.bounds.size.height;
            }
        }) { (finished) in
            self.centerLabel.removeFromSuperview();
            self.centerLabel = label;
        }
    }
    
}
