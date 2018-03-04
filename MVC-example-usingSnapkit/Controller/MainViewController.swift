//
//  ViewController.swift
//  MVC-example-usingSnapkit
//
//  Created by Vikentor Pierre on 3/3/18.
//  Copyright © 2018 Vikentor Pierre. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let greenView:UIView = {
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.layer.cornerRadius = 20
        return greenView
    }()

    let blueViewSubView:UIView = {
        let gVS = UIView()
        gVS.backgroundColor = .blue
        gVS.layer.cornerRadius = 20
        return gVS
    }()

    let yellowView:UIView = {
        let yv = UIView()
        yv.backgroundColor = .yellow
        yv.layer.cornerRadius = 20
        return yv
    }()
    let grayView:UIView = {
        let gV = UIView()
        gV.backgroundColor = .gray
        gV.layer.cornerRadius = 20
        return gV
    }()


    lazy var myStackView:UIStackView = {
        let sv = UIStackView(arrangedSubviews: [yellowView,grayView])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 5
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setUpLayout()
    }
    func setupNavigationBar(){
        navigationItem.title = "MVC"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
    }
    
    func setUpLayout()  {
        [greenView].forEach{view.addSubview($0)}
        greenView.addSubview(blueViewSubView)
        blueViewSubView.addSubview(myStackView)
        
        greenView.snp.makeConstraints { (make) in
            make.topMargin.leading.equalTo(15)
            make.bottomMargin.right.equalTo(-20)
        }
        blueViewSubView.snp.makeConstraints { (make) in
            make.width.height.equalTo(270)
            make.center.equalTo(self.greenView)
        }
        myStackView.snp.makeConstraints { (make) in
            make.top.leading.equalTo(10)
            make.bottom.right.equalTo(-10)
        }
        
    }

}

