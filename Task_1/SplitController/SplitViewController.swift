//
//  SplitViewController.swift
//  Task_1
//
//  Created by KirRealDev on 13.06.2021.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    private let detailNavigationIdentifier = "detailNavigation"
    private let masterModel = MasterViewModel()
    
    private func showDefaultInformation() {
        guard
            let navigationDetailController = storyboard?.instantiateViewController(identifier: detailNavigationIdentifier) as? UINavigationController,
            let detailVC = navigationDetailController.viewControllers.first as? DetailViewController
        else { return }
        detailVC.configure(item: masterModel.getDataBy(index: 0))
        showDetailViewController(navigationDetailController, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        showDefaultInformation()
    }

}

extension SplitViewController {

    @available(iOS 13.0, *)
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }

    @available(iOS 14.0, *)
    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }

}
