//
//  CustomTableViewCell.swift
//  VKSirius
//
//  Created by developer on 13.07.2022.
//

import UIKit
import SnapKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private let logoOfApp = UIImageView()
    private let arrow = UIImageView()
    private let nameOfApp = UILabel()
    private let descOfApp = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(app: App){
        backgroundColor = UIColor.background
        selectionStyle = .none
        logoOfApp.kf.setImage(with: URL(string: app.iconUrl))
        nameOfApp.text = app.name
        descOfApp.text = app.description
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        logoOfApp.image = nil
        nameOfApp.text = nil
        descOfApp.text = nil
    }
    
    private func setup(){
        logoOfAppSetup()
        arrowSetup()
        nameOfAppSetup()
        descOfAppSetup()
        
    }
    
    private func logoOfAppSetup(){
        contentView.addSubview(logoOfApp)
        
        logoOfApp.backgroundColor = UIColor.background
        logoOfApp.contentMode = .scaleAspectFit
        
        logoOfApp.snp.makeConstraints{ make in
            make.width.height.equalTo(60)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        
        
    }
    
    private func arrowSetup(){
        contentView.addSubview(arrow)
        
        arrow.backgroundColor = UIColor.background
        arrow.contentMode = .scaleAspectFit
        arrow.image = UIImage.arrow
        
        arrow.snp.makeConstraints{ make in
            make.width.height.equalTo(10)
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    private func nameOfAppSetup(){
        contentView.addSubview(nameOfApp)
        nameOfApp.text = "text"
        nameOfApp.font = .boldSystemFont(ofSize: 17)
        nameOfApp.textColor = UIColor.font
        descOfApp.lineBreakMode = .byWordWrapping
        descOfApp.numberOfLines = 1
        
        nameOfApp.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(logoOfApp.snp.trailing).offset(10)
            make.trailing.equalTo(arrow).inset(30)
        }
    }
    
    private func descOfAppSetup(){
        contentView.addSubview(descOfApp)
        
        descOfApp.text = "Игры для ПК, консолей и смартфонов, в которые играют сотни миллионов геймеров"
        descOfApp.font = .systemFont(ofSize: 13)
        descOfApp.textColor = UIColor.font
        descOfApp.lineBreakMode = .byWordWrapping
        descOfApp.numberOfLines = 0
        descOfApp.textAlignment = .left
        
        
        descOfApp.snp.makeConstraints{make in
            make.top.equalTo(nameOfApp.snp.bottom).offset(2)
            make.leading.equalTo(logoOfApp.snp.trailing).offset(10)
            make.trailing.equalTo(arrow).inset(30)
            make.bottom.equalToSuperview().inset(12)
        }
        
    }
    
    
    
    

}
