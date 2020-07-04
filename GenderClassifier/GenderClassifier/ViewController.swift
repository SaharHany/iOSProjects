//
//  ViewController.swift
//  GenderClassifier
//
//  Created by Sahar Hany on 7/2/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit
import CoreML
import ImageIO
import Vision
enum Gender:String {
    case Woman = "Woman"
    case Man   = "Man"
    case Unknown = "Unknown"
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var inputImageView: UIImageView!
    
    @IBOutlet weak var appMainHeaderLabel: UILabel!
    
    var imagePicker = UIImagePickerController()
    
    //ML Model setup
    lazy var classificationRequest : VNCoreMLRequest = {
        do {
            let model   = try VNCoreMLModel(for: GenderClassifierModel_1().model)
            
            let request = VNCoreMLRequest(model: model, completionHandler:{
                [weak self] request, error  in
                self?.processClassifications(for:request, error: error)
            })
            return request
                                        
        }catch{
            fatalError("failed to load vision ML model: \(error)")
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        self.genderSegmentControl.setTitle(NSLocalizedString("Man",          comment: "Man"), forSegmentAt: 0)
        self.genderSegmentControl.setTitle(NSLocalizedString("Woman",        comment: "Woman"), forSegmentAt: 1)
        self.appMainHeaderLabel.text =     NSLocalizedString("MainHeader",   comment: "MainHeader of App")
        resetView()
    }

    @IBAction func importImageBtnAction(_ sender: UIButton) {
        
        resetView()
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){

                imagePicker.delegate = self
                imagePicker.sourceType = .savedPhotosAlbum
                imagePicker.allowsEditing = false

                present(imagePicker, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        picker.dismiss(animated: true)

        let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as! UIImage
        
        inputImageView.image    = image
        inputImageView.isHidden = false

        updateClassifications(for: image)
    }
    
    func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }
    
    func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }
    
    @IBAction func takeImageBtnAction(_ sender: UIButton) {
        resetView()

    }
    
    func shouldShowAnswer(gender : Gender){
        answerLabel.text              = NSLocalizedString("AnswerLabel_Text_AnswerCase", comment: "AnswerLabel text incase of showing answer.")
        genderSegmentControl.isHidden = false
        if gender == Gender.Woman {
            genderSegmentControl.selectedSegmentIndex = 1
        }else{
            genderSegmentControl.selectedSegmentIndex = 0
        }
    }
    
    func shouldShowErrorMessage(error :String){
           answerLabel.text              = error
           genderSegmentControl.isHidden = true
        
    }
    
    func resetView(){
        answerLabel.text              = NSLocalizedString("AnswerLabel_Text_ResetViewCase", comment: "AnswerLabel text incase of reset view.")
        inputImageView.isHidden       = true
        genderSegmentControl.isHidden = true
    }
    
    
    /// Updates the UI with the results of the classification.
    /// - Tag: ProcessClassifications
    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                let errorMsg = NSLocalizedString("errorMessage", comment: "error message")
                self.shouldShowErrorMessage(error: errorMsg)
                print("Unable to classify image.\n\(error!.localizedDescription)")
                return
            }
            // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
            let classifications = results as! [VNClassificationObservation]
        
            if classifications.isEmpty {
                let errorMsg = NSLocalizedString( "errorMessage_NothingRecognizedCase", comment: "error message incase of nothing recognized")
                self.shouldShowErrorMessage(error: errorMsg)
            } else {
                // Display top classifications ranked by confidence in the UI.
                let topClassifications = classifications.prefix(2)
                let descriptions = topClassifications.map { classification in
                    // Formats the classification for display; e.g. "(0.37) cliff, drop, drop-off".
                   return String(format: "  (%.2f) %@", classification.confidence, classification.identifier)
                }
                self.shouldShowAnswer(gender: self.getMaxConfidence(classificationsList: classifications))
            }
        }
    }
    
    /// - Tag: PerformRequests
    func updateClassifications(for image: UIImage) {
        
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }

        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: CGImagePropertyOrientation.up)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                /*
                 This handler catches general image processing errors. The `classificationRequest`'s
                 completion handler `processClassifications(_:error:)` catches errors specific
                 to processing that request.
                 */
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }

    func getMaxConfidence(classificationsList : [VNClassificationObservation] ) -> (Gender){
        
        var max    = 0.0
        var gender = Gender.Unknown
        for item  in classificationsList{

            if Double(item.confidence) > max {
                max   = Double(item.confidence)
                if item.identifier.elementsEqual(Gender.Woman.rawValue) {
                    gender = Gender.Woman
                }else{
                    gender = Gender.Man
                }
            }
            
        }
        return gender
    }
}

