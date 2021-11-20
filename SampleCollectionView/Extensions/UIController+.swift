//
//  UIController+.swift
//  SampleCollectionView
//
//  Created by Kumie Miyata on 2021/11/20.
//

import UIKit

extension UIViewController {
    func transition(viewControllerName: String) {
        let storyboard = UIStoryboard(name: viewControllerName, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: viewControllerName)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
