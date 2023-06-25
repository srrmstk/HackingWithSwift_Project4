//
//  TableViewController.swift
//  Project4
//
//  Created by srrmstk on 21.06.2023.
//

import UIKit

class TableViewController: UITableViewController {

  var websites = ["apple.com", "hackingwithswift.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
    var content = cell.defaultContentConfiguration()
    content.text = websites[indexPath.row]
    cell.contentConfiguration = content
    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return websites.count
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let vc = storyboard?.instantiateViewController(identifier: "WebView") as WebViewController? else {
      return
    }
    vc.websites = websites
    vc.initialWebsite = websites[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }
}
