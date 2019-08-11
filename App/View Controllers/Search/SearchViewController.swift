//  SearchViewController.swift
//
//  Copyright 2019 Awful Contributors. CC BY-NC-SA 3.0 US https://github.com/Awful/Awful.app

import AwfulCore
import CoreData
import UIKit

private let Log = Logger.get()

final class SearchViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    class func newFromStoryboard() -> SearchViewController {
        let svc = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() as! SearchViewController
        svc.tabBarItem.title = "Search"
        svc.tabBarItem.image = UIImage(named: "quick-look")
        return svc
    }
}
