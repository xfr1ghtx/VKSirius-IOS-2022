//
//  ViewController.swift
//  VKSirius
//
//  Created by developer on 13.07.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let viewModel: ViewModel
    
    private let headerLabel = UILabel()
    private let table = UITableView()

    init(viewModel: ViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindToViewModel()
        viewModel.loadApps()
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
        headerLabel.text = NSLocalizedString("mainHeader", comment: "")
        headerLabel.textColor = UIColor.font
        
        headerLabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
    }
    
    private func tableSetup(){
        view.addSubview(table)
        table.backgroundColor = UIColor.background
        
        table.dataSource = self
        table.delegate = self
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 90
        
        table.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func bindToViewModel(){
        viewModel.didReceiveError = {[weak self] in
            let alert = UIAlertController(title: NSLocalizedString("errorAlertTitle", comment: ""), message: NSLocalizedString("errorAlertMessage", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self?.present(alert,animated: true)
        }
        
        viewModel.didUpdate = {[weak self] in
            self?.table.reloadData()
        }
    }
    

}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(app: viewModel.app(at: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
    
}

