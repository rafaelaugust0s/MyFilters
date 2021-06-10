//
//  ViewController.swift
//  MyFilters
//
//  Created by Rafael Suarez on 2021-06-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Img: UIImageView!
    
    @IBOutlet weak var LblSliderValue: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var isFiltered = false
    
    var defaultImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func Reset(_ sender: Any) {
        
        if isFiltered == true {
            
            Img.image = defaultImage
        }
       
    }
    
    @IBAction func intensitySlider(_ sender: UISlider) {
        
        
        if isFiltered == true {
            
            Img.image = defaultImage
        }
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
    
        let currentValue = Int((sender.value).rounded())
        LblSliderValue.text = String(sender.value)
        
        if isFiltered == false{
            
            defaultImage = Img.image!
        }
        
        // Get the original image
        
        let originalImage = Img.image!
        
        // Convert the image
        
        let myFilter = CIFilter (name: "CIBoxBlur")
        
        myFilter!.setValue(CIImage(image: originalImage), forKey: kCIInputImageKey)
        myFilter!.setValue(currentValue, forKey: kCIInputRadiusKey)
        
        
        //Raw image format => CGI Image => UIImage
        let context = CIContext(options: nil)
        let outputImg = myFilter!.outputImage
        let cgImag = context.createCGImage(outputImg!, from: outputImg!.extent)
        let proccessedImg = UIImage(cgImage: cgImag!)
        
        //show the result back to the user
        
        Img.image = proccessedImg
        
        isFiltered = true
    }
    
    @IBAction func btnBlur(_ sender: Any) {
        
        
     
    }
   
    
    @IBAction func Comics(_ sender: Any) {
        
        if isFiltered == false{
            
            defaultImage = Img.image!
        }
        
        // Get the original image
        
        let originalImage = Img.image!
        
        // Convert the image
        
        let myFilter = CIFilter (name: "CIComicEffect")
        
        myFilter!.setValue(CIImage(image: originalImage), forKey: kCIInputImageKey)
        
        
        //Raw image format => CGI Image => UIImage
        let context = CIContext(options: nil)
        let outputImg = myFilter!.outputImage
        let cgImag = context.createCGImage(outputImg!, from: outputImg!.extent)
        let proccessedImg = UIImage(cgImage: cgImag!)
        
        //show the result back to the user
        
        Img.image = proccessedImg
        
        isFiltered = true
        
        
    }
}

