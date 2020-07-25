//
//  SliderAndProgressBarViewController.swift
//  Challenge
//
//  Created by Sahar Hany on 7/24/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class SliderAndProgressBarViewController: UIViewController {

    
    @IBOutlet weak var myProgressBar: UIProgressView!
    
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sliderValueDidChange(_ sender: UISlider) {
//        let alert = UIAlertController(title: "sliderValueDidChange", message: "slider value = \(sender.value)", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        present(alert, animated: true, completion: nil)
        myProgressBar.progress = sender.value
        if myProgressBar.progress >= 1 {
            myActivityIndicator.stopAnimating()
            myImageView.image = UIImage.init(named: "ic_happyGirl")
        }else{
            myActivityIndicator.startAnimating()
            myImageView.image = UIImage.init(named: "ic_sadGirl")

        }
    }
    
    
    @IBAction func switchValueDidChange(_ sender: UISwitch) {
        if sender.isOn {
            print("Sender is On")
            myImageView.image = UIImage.init(named: "ic_happyGirl")

        }else{
            print("Sender is Off")
            myImageView.image = UIImage.init(named: "ic_sadGirl")
        }
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
