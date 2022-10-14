//
//  FoodCollectionViewCell.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 14/10/22.
//

import UIKit
import Kingfisher

class FoodCollectionViewCell:UICollectionViewCell{
    
    private let imageView:UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    private let titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 17, weight: .semibold)
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private let subtitleLabel:UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 170/255, green: 170/255, blue: 173/255, alpha: 1)
        lbl.font = .systemFont(ofSize: 13, weight: .regular)
        lbl.numberOfLines = 5
        return lbl
    }()
    
    private let buyBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 6
        btn.layer.borderWidth = 1
        let color = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        btn.layer.borderColor = color.cgColor
        btn.setTitleColor(color, for: .normal)
        return btn
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
        contentView.backgroundColor = .white
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(buyBtn)
        
        imageView.layer.cornerRadius = 10
        
        imageView.snp.makeConstraints { make in
            make.top.leading.equalTo(16)
            make.height.width.equalTo(132)
            make.bottom.equalTo(-16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.trailing.equalTo(-16)
            make.leading.equalTo(imageView.snp.trailing).offset(32)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.trailing.equalTo(-16)
            make.leading.equalTo(imageView.snp.trailing).offset(32)
            make.bottom.equalTo(buyBtn.snp.top).offset(-16)
        }
        
        buyBtn.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(-16)
            make.width.equalTo(87)
            make.height.equalTo(32)
        }
    }
    
    func reload(imageUrl:String, title:String, subtitle:String, price:String, isFirst:Bool){
        
        titleLabel.text = title
        subtitleLabel.text = subtitle
        buyBtn.setTitle(price, for: .normal)
        
        let url = URL(string: imageUrl)
        imageView.kf.setImage(with: url)
        
        if isFirst {
            contentView.layer.cornerRadius = 20
            contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            contentView.layer.cornerRadius = 0
        }
    }
}
