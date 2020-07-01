//
//  CompactViewController.swift
//  Plain Ol' Notes MessagesExtension
//
//  Created by Sahar Hany on 6/27/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

protocol CompactDelegate {
    func newNote()
}

class CompactViewController: UIViewController {

    var compactDelegate: CompactDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addNewBtnAction(_ sender: UIButton) {
        compactDelegate?.newNote()
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
