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
        
        guard let splitViewController = window?.rootViewController as? UISplitViewController else { fatalError() }
        
        guard let masterNavController = splitViewController.viewControllers.first as? UINavigationController else { fatalError() }
        guard let masterViewController = masterNavController.viewControllers.first as? MasterViewController else { fatalError() }
        
        guard let detailNavController = splitViewController.viewControllers.last as? UINavigationController else { fatalError() }
        guard let detailViewController = detailNavController.viewControllers.first as? DetailViewController else { fatalError() }
        
        masterViewController.delegate = detailViewController
        
        let firstItem = masterViewController.favouriteListData.first
        detailViewController.item = FavouriteListItem(title: "Чистый код (Роберт Мартин)",
                                                      imageName: "Чистый_код",
                                                      price: 722.227,
                                                      myRating: 4.2,
                                                      description: "Эта книга посвящена хорошему программированию. Она полна реальных примеров кода. Мы будем рассматривать код с различных направлений: сверху вниз, снизу вверх и даже изнутри. Прочитав книгу, вы узнаете много нового о коде. Более того, вы научитесь отличать хороший код от плохого. Вы узнаете, как писать хороший код и как преобразовать плохой код в хороший.")
    }
}

