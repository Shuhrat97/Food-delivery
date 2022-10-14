//
//  ItemCollectionViewCell.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 14/10/22.
//

import UIKit

class ItemCollectionViewCell:UICollectionViewCell{
    
    private let label:UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 13)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAndLayoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureAndLayoutSubviews()
    }
    
    func configureAndLayoutSubviews() -> Void {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 16
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
    }
    
    func reload(isActive:Bool, text:String){
        label.text = text
        if isActive {
            contentView.layer.backgroundColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4).cgColor
            contentView.layer.borderWidth = 0
            contentView.layer.borderColor = UIColor.clear.cgColor
            label.textColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1)
            label.font = .systemFont(ofSize: 13, weight: .bold)
        } else {
            contentView.layer.backgroundColor = UIColor.clear.cgColor
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4).cgColor
            label.textColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4)
            label.font = .systemFont(ofSize: 13, weight: .regular)
        }
    }
}
