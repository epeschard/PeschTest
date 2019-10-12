//
//  UIViewControllerSpy.swift
//  PeschCore
//
//  Created by Eugène Peschard on 07/10/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

class UIViewControllerSpy: UIViewController {
    var receivedViewController: UIViewController?

    var spyReporter = Spy()

    override func show(_ vc: UIViewController, sender: Any?) {
        receivedViewController = vc
        spyReporter.addCallToHistory(call: #function, params: [vc, sender])
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedViewController = viewControllerToPresent
        spyReporter.addCallToHistory(call: #function, params: [flag])
    }
}
