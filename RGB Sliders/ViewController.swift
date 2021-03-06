//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Jake Dobson on 2/27/16.
//  Copyright © 2016 Jake Dobson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorSquare: UIView!
    @IBOutlet weak var openButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.colorSquare.layer.borderColor = UIColor.black.cgColor //add CGFloat black border to UIView
        self.colorSquare.layer.borderWidth = 1 //add border width to UIView
        
        //Loading from NSUser Defaults\\
        let defaults = UserDefaults.standard//reference to shared default objects
        
        //extract the numeric value of the three colors and apply them to the sliders
        self.redSlider.value = defaults.float(forKey: "red")
        self.greenSlider.value = defaults.float(forKey: "green")
        self.blueSlider.value = defaults.float(forKey: "blue")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateBackgroundColor() {
        let red = CGFloat(self.redSlider.value)
        let green = CGFloat(self.greenSlider.value)
        let blue = CGFloat(self.blueSlider.value)
        
        self.colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let defaults = UserDefaults.standard//store a reference to the shared defaults object using the standardUserDefaults() method (where you store all user preferences)
        
        // store the three slider values within the shared defaults object
        defaults.set(self.redSlider.value, forKey: "red")
        defaults.set(self.greenSlider.value, forKey: "green")
        defaults.set(self.blueSlider.value, forKey: "blue")
        
        defaults.synchronize()//To be sure that the data is saved immediately
    }
    // opening 2nd view controller with background of colorSquare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueColor") {
            if let ResultsViewController = segue.destination as? ResultsViewController {
                ResultsViewController.view.backgroundColor = self.colorSquare.backgroundColor
            }
        }
    }

}

