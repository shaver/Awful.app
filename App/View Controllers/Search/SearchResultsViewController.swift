//  SearchResultsViewController.swift
//
//  Copyright 2019 Awful Contributors. CC BY-NC-SA 3.0 US https://github.com/Awful/Awful.app

import UIKit

class SearchResultsViewController: UIViewController {
    var searchTerms: String = ""
    @IBOutlet weak var searchTermsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTermsLabel.text = searchTerms
        // Do any additional setup after loading the view.
    }

    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
