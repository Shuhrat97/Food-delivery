//
//  ItemsSectionHeader.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 14/10/22.
//

import UIKit

protocol ItemsSectionHeaderDelegate:AnyObject{
    func didTapped(indexPath:IndexPath)
}

class ItemsSectionHeader: UICollectionReusableView {
    
    weak var delegate:ItemsSectionHeaderDelegate?
    private var selectedItemIndex = 0
    private var categories:[Category] = []
    
    private let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 90, height: 32)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "ItemCollectionViewCell")
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    let containerView:UIView = {
        let vW = UIView()
        vW.backgroundColor = .clear
        return vW
    }()

     override init(frame: CGRect) {
         super.init(frame: frame)

         addSubview(containerView)
         containerView.addSubview(collectionView)
         
         containerView.snp.makeConstraints { make in
             make.edges.equalToSuperview()
         }

         collectionView.snp.makeConstraints { make in
             make.top.equalTo(24)
             make.leading.trailing.equalToSuperview()
             make.bottom.equalTo(-24)
             make.height.equalTo(32)
         }
         
         collectionView.dataSource = self
         collectionView.delegate = self

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reload(_ categories:[Category]){
        self.categories = categories
        self.collectionView.reloadData()
    }
}

extension ItemsSectionHeader: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as? ItemCollectionViewCell
        let item = categories[indexPath.row]
        cell?.reload(isActive: selectedItemIndex == indexPath.row, text: item.strCategory)
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItemIndex = indexPath.row
        delegate?.didTapped(indexPath: indexPath)
        collectionView.reloadData()
    }
}
