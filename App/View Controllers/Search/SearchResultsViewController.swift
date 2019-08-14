//  SearchResultsViewController.swift
//
//  Copyright 2019 Awful Contributors. CC BY-NC-SA 3.0 US https://github.com/Awful/Awful.app

import UIKit
import AwfulCore

private let Log = Logger.get()

class SearchResultsViewController: UIViewController, UITableViewDataSource {

    //MARK: Properties
    var searchResults = [(threadTitle: String, snippet: String)]()
    var searchTerms: String = ""
    @IBOutlet weak var searchTermsLabel: UILabel!
    @IBOutlet weak var searchResultsTable: UITableView!
    
    private func loadSampleResults() {
        let result1 = ("Big Title", """
once upon a time
once upon a time
once upon a time
once upon a time
once upon a time
once upon a time
""")
        let result2 = ("Strong Title", "several upon a time")
        let result3 = ("Fast Title", "never, actually")

        searchResults += [result1, result2, result3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleResults()
        searchTermsLabel.text = searchTerms
        searchResultsTable.dataSource = self

        ForumsClient.shared.fetchSearchResults(searchTerms: searchTerms).promise
        .done { blurbs in
            blurbs.forEach { blurb in
                Log.w(blurb)
            }
        }
        .catch { err in
            Log.e(err.localizedDescription)
        }
    }

    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsSnippetCell", for: indexPath) as? SearchResultSnippetCell else {
            fatalError("got a cell that isn't SearchResultsSnippetCell?")
        }

        let result = searchResults[indexPath.row]
        cell.threadTitleLabel.text = result.threadTitle
        cell.postSnippetLabel.text = result.snippet
        cell.postSnippetLabel.sizeToFit()

        let snippetFrame = cell.postSnippetLabel.frame
        cell.postSnippetLabel.frame = CGRect(x: snippetFrame.minX, y: snippetFrame.minY, width: cell.frame.width, height: min(snippetFrame.height, cell.frame.height - cell.threadTitleLabel.frame.height))

        return cell
    }

}
