//
//  CellTapViewController.swift
//  SampleCollectionView
//
//  Created by Kumie Miyata on 2021/11/20.
//

import UIKit

final class CellTapViewController: UIViewController {
    
    var saunaName: String?
    
    @IBOutlet private weak var saunaNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saunaNameLabel.text = saunaName
    }
}
