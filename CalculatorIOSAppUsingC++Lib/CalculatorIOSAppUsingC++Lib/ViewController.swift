//
//  ViewController.swift
//  CalculatorIOSAppUsingC++Lib
//
//  Created by Sahar Hany on 7/2/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit
//import "CalculatorIOSAppUsingC++Lib-Bridging-Header.h"
class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var firstOperand_TF: UITextField!
    
    @IBOutlet weak var secondOperand_TF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func addBtnAction(_ sender: UIButton) {
        if firstOperand_TF.text! != "" && secondOperand_TF.text! != ""  {

            let x : Double = Double(firstOperand_TF.text!)!
            let y : Double = Double(secondOperand_TF.text!)!

            let result = sum(x , y)
            
            resultLabel.text = String(result)
        }else{
            showError()
        }
    }
    
    
    @IBAction func subtractBtnAction(_ sender: UIButton) {
        if firstOperand_TF.text! != "" && secondOperand_TF.text! != ""  {

            let x : Double = Double(firstOperand_TF.text!)!
            let y : Double = Double(secondOperand_TF.text!)!

            let result = subtract(x , y)
            
            resultLabel.text = String(result)
        }else{
            showError()
        }
    }
    
    @IBAction func multiplyBtnAction(_ sender: UIButton) {
        if firstOperand_TF.text! != "" && secondOperand_TF.text! != ""  {
            
            let x : Double = Double(firstOperand_TF.text!)!
            let y : Double = Double(secondOperand_TF.text!)!

            let result = multiply(x , y)
            
            resultLabel.text = String(result)
        }else{
            showError()
        }
    }
    
    func showError(){
        resultLabel.text = "Please Enter valid values to calculate"
    }
    
    func reset(){
        resultLabel.text = "Result"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        reset()
    }
}

