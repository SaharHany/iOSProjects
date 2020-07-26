//
//  ViewControllerWithTableView.swift
//  Challenge
//
//  Created by Sahar Hany on 7/23/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class ViewControllerWithTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myTableView: UITableView!
    var dataSource : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = loadData()
        setupTableView()
    }
    
     func setupTableView() {
        myTableView.delegate   = self
        myTableView.dataSource = self
        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCellIdentifier")
    }
    
    func loadData() -> [String]?{
        return ["One", "Two" , "Three"]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =  tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier2")!
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CustomCellIdentifier") as! (CustomTableViewCell)
        cell.item = dataSource![indexPath.row]
//        cell.titleLabel.text = dataSource?[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController.init(title: "Numbers App", message: dataSource?[indexPath.row] ?? "\(indexPath.row)", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}
