//
//  FomerViewController.swift
//  Former-Demo
//
//  Created by Ryo Aoyama on 7/23/15.
//  Copyright © 2015 Ryo Aoyama. All rights reserved.
//

import UIKit

public class FormViewController: UIViewController {
    
    // MARK: Public
    
    public private(set) var tableView = UITableView(frame: CGRect.zero, style: .Grouped)
    public lazy var former: Former = {
        return Former(tableView: self.tableView)
    }()
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Private
    
    private final func setup() {
        view.backgroundColor = .groupTableViewBackgroundColor()
        tableView.backgroundColor = .clearColor()
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.01))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.01))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(tableView, atIndex: 0)
        let tableConstraints = [
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-0-[table]-0-|",
                options: [],
                metrics: nil,
                views: ["table": tableView]
            ),
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-0-[table]-0-|",
                options: [],
                metrics: nil,
                views: ["table": tableView]
            )
            ].flatMap { $0 }
        view.addConstraints(tableConstraints)
    }
}