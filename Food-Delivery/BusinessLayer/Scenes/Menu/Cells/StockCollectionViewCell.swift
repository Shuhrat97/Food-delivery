//
//  StockCollectionViewCell.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 14/10/22.
//

import UIKit

class StockCollectionViewCell:UICollectionViewCell{
    private let imageView:UIImageView = {
        let imgView = UIImageView()
        return imgView
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
        
        contentView.addSubview(imageView)
        imageView.layer.cornerRadius = 10
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.height.equalTo(112)
        }
        
//        contentView.backgroundColor = .systemBlue
    }
    
    func reload(imageUrl:String){
        imageView.image = UIImage(named: imageUrl)
    }
}
