//  SearchViewController.swift
//
//  Copyright 2019 Awful Contributors. CC BY-NC-SA 3.0 US https://github.com/Awful/Awful.app

import AwfulCore
import CoreData
import UIKit

private let Log = Logger.get()

final class SearchViewController: ViewController {
    @IBOutlet weak var searchField: UITextView!
    @IBOutlet weak var searchButton: UIButton!

    private var loadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    class func newFromStoryboard() -> SearchViewController {
        let svc = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() as! SearchViewController
        svc.tabBarItem.title = "Search"
        svc.tabBarItem.image = UIImage(named: "quick-look")
        return svc
    }

    @IBAction func runSearch(_ sender: Any) {
        performSegue(withIdentifier: "ShowResultsSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsVC: SearchResultsViewController = segue.destination as! SearchResultsViewController
        resultsVC.searchTerms = searchField.text
    }
}
