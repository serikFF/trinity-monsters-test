//
//  UINib+Helper.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import UIKit

extension UINib {
    class func nib(withClass className: AnyClass) -> UINib? {
        let bundle = Bundle(for: className)
        let name = String(describing: className)
        guard bundle.path(forResource: name, ofType: "nib") != nil else { return nil }
        return UINib(nibName: name, bundle: bundle)
    }
}
