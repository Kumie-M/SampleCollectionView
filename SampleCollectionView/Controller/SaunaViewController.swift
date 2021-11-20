//
//  SaunaViewController.swift
//  SampleCollectionView
//
//  Created by Kumie Miyata on 2021/10/06.
//

import UIKit

final class SaunaViewController: UIViewController {
    
    private let saunaNameList = ["黄金湯",
                                 "ひだまりの湯 萩の湯",
                                 "両国湯屋江戸遊",
                                 "サウナセンター",
                                 "新宿天然温泉 テルマー湯",
                                 "ソロサウナtuna",
                                 "タイムズスパ・レスタ",
                                 "ドシー恵比寿",
                                 "サウナ錦糸町",
                                 "湊湯"]
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nib = UINib(nibName: SaunaCollectionViewCell.className, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SaunaCollectionViewCell.className)
        
        let layout = SaunaCollectionViewCell()
        layout.setupCollectionViewLayout(collectionView: collectionView)
    }
}

extension SaunaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        saunaNameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaunaCollectionViewCell.className, for: indexPath) as? SaunaCollectionViewCell else {
            return SaunaCollectionViewCell() }
        let name = saunaNameList[indexPath.row]
        cell.setupSaunaNameLabel(name: name)
        
        cell.locationBlock = { [weak self] in
            guard let self = self else { return }
            self.transition(viewControllerName: ButtonTapViewController.className)
        }
        return cell
    }
}


extension SaunaViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        transition(viewControllerName: CellTapViewController.className)
    }
}
