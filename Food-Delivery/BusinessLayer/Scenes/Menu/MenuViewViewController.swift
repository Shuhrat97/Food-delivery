//
//  MenuViewViewController.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//  
//

import UIKit
import SnapKit

protocol MenuViewViewControllerProtocol: BaseViewControllerProtocol {
    func reloadData()
}

class MenuViewViewController: BaseViewController {
    var presenter: MenuViewPresenterProtocol!
    
    private let collectionView:UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(StockCollectionViewCell.self, forCellWithReuseIdentifier: "StockCollectionViewCell")
        collection.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: "FoodCollectionViewCell")
        
        collection.register(ItemsSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    private let customNavBar:UIView = {
        let vW = UIView()
        vW.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return vW
    }()
    
    private let button:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Москва", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        btn.setImage(UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .black
        btn.semanticContentAttribute = .forceRightToLeft
        return btn
    }()
    
    private var header:ItemsSectionHeader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidload()
        
        view.addSubview(customNavBar)
        view.addSubview(button)
        
        customNavBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(button.snp.bottom)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(16)
        }
        
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(customNavBar.snp.bottom)
            make.bottom.trailing.leading.equalToSuperview()
        }
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
        
    private func createLayout() -> UICollectionViewCompositionalLayout!{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            let section:MenuSection = sectionIndex == 0 ? .stock : .items
            switch section {
            case .stock:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                    heightDimension:.fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize:.init(widthDimension:
                        .fractionalWidth(0.8), heightDimension: .estimated(153)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 8, bottom: 0, trailing: 8)
                return section
            case .items:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                    heightDimension:.fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize:.init(widthDimension:
                        .fractionalWidth(1), heightDimension: .estimated(164)) , subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                return section
            }
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem{
        let headerElement:NSCollectionLayoutBoundarySupplementaryItem = .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(52)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerElement.pinToVisibleBounds = true
        
        return headerElement
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 137 {
            customNavBar.backgroundColor = .white
            header?.containerView.backgroundColor = .white
            view.backgroundColor = .white
        } else {
            header?.containerView.backgroundColor = .clear
            customNavBar.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        }
    }
}



extension MenuViewViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! ItemsSectionHeader
            sectionHeader.delegate = self
            sectionHeader.reload(presenter.categoryList())
            self.header = sectionHeader
             return sectionHeader
        } else {
             return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfRows(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = MenuSection.init(rawValue: indexPath.section)
        if section == .stock {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockCollectionViewCell", for: indexPath) as? StockCollectionViewCell
            
            cell?.reload(imageUrl: "firstStockImage")
            return cell!
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as? FoodCollectionViewCell
            
            let meal = presenter.getMeal(index: indexPath.row)
            
            cell?.reload(imageUrl: meal.strMealThumb, title: meal.strMeal, subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", price: "от 345 р", isFirst: indexPath.row == 0)

            return cell!
        }
    }
}

extension MenuViewViewController: ItemsSectionHeaderDelegate{
    func didTapped(indexPath: IndexPath) {
        presenter.getMealsInCategory(index: indexPath)
    }
}


extension MenuViewViewController: MenuViewViewControllerProtocol {
    func reloadData(){
        collectionView.reloadData()
    }
}
