//
//  UITableView+Helper.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import UIKit

public extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: String(describing: type)) as? T
    }

    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as! T
    }

    func registerClass(_ classToRegister: AnyClass) {
        if let nib = UINib.nib(withClass: classToRegister) {
            register(nib, forCellReuseIdentifier: String(describing: classToRegister))
        } else {
            register(classToRegister, forCellReuseIdentifier: String(describing: classToRegister))
        }
    }
}
