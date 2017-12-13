//
//  Extensions_UIView.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright © 2017 EPC. All rights reserved.
//

import UIKit

private var ak_ViewSpinner: UInt8 = 0

extension UIView {
  
  var spinner: UIActivityIndicatorView {
    get {
      if let o = objc_getAssociatedObject(self, &ak_ViewSpinner) as? UIActivityIndicatorView {
        if o.superview == nil {
          addSubview(o)
        }
        return o
      }
      let o = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
      o.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]
      o.hidesWhenStopped = true
      o.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
      addSubview(o)
      objc_setAssociatedObject(self, &ak_ViewSpinner, o, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
      o.startAnimating()
      return o
    }
    set(newValue) {
      objc_setAssociatedObject(self, &ak_ViewSpinner, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
  }
}
