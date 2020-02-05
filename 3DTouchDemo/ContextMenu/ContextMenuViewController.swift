//
//  ContextMenuViewController.swift
//  3DTouchDemo
//
//  Created by Masashi Aso on 2020/02/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import UIKit

class ContextMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close() {
        self.dismiss(animated: true)
    }
    
    override func numberOfSections(in _: UITableView) -> Int {
        return 10
    }
    
    override func tableView(
        _ _: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        return 10
    }
    
    override func sectionIndexTitles(
        for tableView: UITableView
    ) -> [String]? {
        return (1...10).map { String($0) }
    }
    
    override func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row) - \(indexPath.section * indexPath.row)"
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        contextMenuConfigurationForRowAt indexPath: IndexPath,
        point: CGPoint
    ) -> UIContextMenuConfiguration? {
        let previewProvider: () -> UIViewController = {
            return DestinationViewController.create()
        }
        
        let actionProvider: ([UIMenuElement]) -> UIMenu? = { elements in
            return nil
        }
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: previewProvider, actionProvider: actionProvider)
    }
    
}
