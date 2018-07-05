//
//  ViewController.swift
//  ScrollLabel
//
//  Created by 防神 on 2018/7/4.
//  Copyright © 2018年 吃面多放葱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label : ScrollLabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = ScrollLabel();
        label.frame = CGRect(x: 50, y: 100, width: 150, height: 50);
        label.backgroundColor = UIColor.red;
        view.addSubview(label)
        self.label = label;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.label?.changeText(newText: "12", animated: false)
        self.label?.changeText(newText: "12", animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

