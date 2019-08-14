//  SearchResultSnippetCell.swift
//
//  Copyright 2019 Awful Contributors. CC BY-NC-SA 3.0 US https://github.com/Awful/Awful.app

import UIKit

class SearchResultSnippetCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var threadTitleLabel: UILabel!
    @IBOutlet weak var postSnippetLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
