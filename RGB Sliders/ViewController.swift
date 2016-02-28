//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Jake Dobson on 2/27/16.
//  Copyright © 2016 Jake Dobson. All rights reserved.
//

//test comment

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //@IBAction func updateBackgroundColor() {
    
    
    @IBAction func updateBackgroundColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(redSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
    }

}

