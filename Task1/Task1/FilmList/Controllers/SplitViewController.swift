//
//  SplitViewController.swift
//  Task1
//
//  Created by Mary Matichina on 14.06.2021.
//

import UIKit

final class SplitViewController: UISplitViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.preferredDisplayMode = .oneBesideSecondary
    }
}

extension SplitViewController: UISplitViewControllerDelegate {
    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }
}
