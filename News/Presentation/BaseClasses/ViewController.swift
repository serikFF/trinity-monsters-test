//
//  ViewController.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import UIKit

class ViewController: UIViewController {
    
    init() {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        
        if bundle.path(forResource: nibName, ofType: "nib") != nil {
            super.init(nibName: nibName, bundle: bundle)
        } else {
            super.init(nibName: nil, bundle: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

