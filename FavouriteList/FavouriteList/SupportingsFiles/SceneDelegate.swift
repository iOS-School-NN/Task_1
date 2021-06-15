//
//  SceneDelegate.swift
//  FavouriteList
//
//  Created by Alexander on 11.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        guard let splitVC = window?.rootViewController as? UISplitViewController else { fatalError() }
        
        guard let masterNC = splitVC.viewControllers.first as? UINavigationController else { fatalError() }
        guard let masterVC = masterNC.viewControllers.first as? MasterViewController else { fatalError() }
        
        guard let detailNC = splitVC.viewControllers.last as? UINavigationController else { fatalError() }
        guard let detailVC = detailNC.viewControllers.first as? DetailViewController else { fatalError() }
        
        masterVC.delegate = detailVC
        detailVC.item = masterVC.favouriteListData.first
        
        hideBackBarButtonTitle()
    }
    
    private func hideBackBarButtonTitle() {
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .highlighted)
    }
}

