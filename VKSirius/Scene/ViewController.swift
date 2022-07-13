//
//  ViewController.swift
//  VKSirius
//
//  Created by developer on 13.07.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let headerLabel = UILabel()
    private let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup(){
        superviewSetup()
        headerLabelSetup()
        tableSetup()
    }
    
    private func superviewSetup(){
        view.backgroundColor = UIColor.background
    }
    
    private func headerLabelSetup(){
        view.addSubview(headerLabel)
        
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.text = Strings.mainHeader
        headerLabel.textColor = UIColor.font
        
        headerLabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func tableSetup(){
        
        
    }
    
    


}

