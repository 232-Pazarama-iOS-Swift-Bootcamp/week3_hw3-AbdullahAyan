//
//  SceneDelegate.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        setupWindow(with: windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


    private func setupWindow(with windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        
        let podcastViewController = MainViewController()
        let ebookViewController = MainViewController()
        let movieViewController = MainViewController()
        let softwareViewController = MainViewController()
        let musicViewController = MainViewController()
        
        let favoritesViewController = FavoritesViewController()
        
        
        podcastViewController.tabBarItem = UITabBarItem(title: "Podcast", image: UIImage(systemName: "waveform"), tag: 0)
        ebookViewController.tabBarItem = UITabBarItem(title: "Ebook", image: UIImage(systemName: "book"),tag: 1)
        movieViewController.tabBarItem = UITabBarItem(title: "Movie", image: UIImage(systemName: "popcorn"),tag: 2)
        softwareViewController.tabBarItem = UITabBarItem(title: "Software", image: UIImage(systemName: "desktopcomputer.and.arrow.down"),tag: 3)
        musicViewController.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "airpodspro"),tag: 4)
        
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        let podcastNavigationController = UINavigationController(rootViewController: podcastViewController)
        let ebookNavigationController = UINavigationController(rootViewController: ebookViewController)
        let movieNavigationController = UINavigationController(rootViewController: movieViewController)
        let softwareNavigationController = UINavigationController(rootViewController: softwareViewController)
        let musicNavigationController = UINavigationController(rootViewController: musicViewController)
        
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)

        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [podcastNavigationController,ebookNavigationController,movieNavigationController,softwareNavigationController,musicNavigationController]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}

