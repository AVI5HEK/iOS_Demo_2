//
//  ViewController.swift
//  Country
//
//  Created by framgia on 10/20/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Properties
    var namesOfCountries = [String]()
    var nameDict = [String: [String]]()
    var sectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.\
        
        let imageArray = Bundle.main.urls(
            forResourcesWithExtension: "png", subdirectory: "Flags")
        for n:URL in imageArray!
        {
            let urlString = "\(n)"
            let name = urlString.components(separatedBy: ".")
            let imageName = name.first?.replacingOccurrences(of: "%20", with: " ")
            
            if nameDict["\((imageName?.characters.first)!)"] == nil {
                nameDict["\((imageName?.characters.first)!)"] = [imageName!]
            } else {
                nameDict["\((imageName?.characters.first)!)"]?.append(imageName!)
            }

        }
        sectionTitles = nameDict.keys.sorted(by: <)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let elements = nameDict[sectionTitles[section]]
        
        return (elements?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let sectionTitle = sectionTitles[indexPath.section]
        var sectionCountries = nameDict[sectionTitle]
        cell.textLabel?.text = sectionCountries?[indexPath.row]
        cell.imageView?.image = UIImage(named: "Flags/"+(sectionCountries?[indexPath.row])!)
        
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
}
