//
//  TableViewController.swift
//  UXSnappyTableView
//
//  Created by Michael Nino Evensen on 01/05/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class TableViewController: UITableViewController {
    
    // keeps track of if list is expanded or not
    var expandedView = false
    
    // additional view to expand to
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        
        let totalContentHeight = tableView.rowHeight * CGFloat(tableView.numberOfRowsInSection(0))
        
        // set the contentsize to full frame height
        tableView.contentSize = CGSize(width: tableView.frame.width, height: totalContentHeight)
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! TableViewCell
        
        return cell
        
    }
    
    // MARK: - Controls snapping at bottom
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        // threshold beyond bottom that reacts to snap
        let snapThreshold:CGFloat = 50
        
        if !expandedView && scrollView.contentOffset.y > (tableView.contentSize.height-self.view.frame.height)+snapThreshold {
            
            // toggle expanded list
            expandedView = true
            
            tableView.contentSize = CGSize(width: tableView.contentSize.width, height: tableView.contentSize.height + containerView.frame.height)
        }
    }
}
