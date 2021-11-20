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
        return cell
    }
}
