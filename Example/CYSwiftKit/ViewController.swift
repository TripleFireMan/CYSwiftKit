//
//  ViewController.swift
//  CYSwiftKit
//
//  Created by 成焱 on 01/22/2024.
//  Copyright (c) 2024 成焱. All rights reserved.
//

import UIKit
import CYSwiftKit
import SnapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let lbl = TT.init()
        lbl.font = MCFontPF(20, .Semibold)
        lbl.textColor = UIColor.init(hex: "#333333")
        lbl.text = "1233333"
        view.addSubview(lbl)
        lbl.isUserInteractionEnabled = true
        lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        lbl.setClick(0, MCEmptyClosure({
            print(12333333)
        }))
        lbl.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(self.sss(_:))))

        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func sss(_ sender:UIGestureRecognizer){
        (sender.view as! TT).getClick(0, MCEmptyClosure.self)?.closure()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

