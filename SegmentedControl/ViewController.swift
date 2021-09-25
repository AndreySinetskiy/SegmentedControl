//
//  ViewController.swift
//  SegmentedControl
//
//  Created by Andrey Sinetskiy on 24.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var sliderOne: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 50
        
        label.text = String(format: "%.0f", slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        mainView.isHidden = true
        mainView.layer.cornerRadius = 10
        
        slider.minimumValue = 1
        slider.maximumValue = 100
        
       
        sliderOne.minimumValue = 0
        sliderOne.maximumValue = 1
    
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        label.text =  String(format: "%.0f", slider.value)
    }
    
    
    @IBAction func sliderOneAction(_ sender: UISlider) {
        let background = view.backgroundColor
        view.backgroundColor = background?.withAlphaComponent(CGFloat(sender.value))
    }
    
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        
        mainView.isHidden = false
        runAnimate()
        switch sender.selectedSegmentIndex {
        case 0:
            label.text = "The First segment was selected"
            label.textColor = .red
            mainView.backgroundColor = .red
            runAnimate()
        case 1:
            label.text = "The Second segment was selected"
            label.textColor = .yellow
            mainView.backgroundColor = .yellow
            runAnimate()
        default :
            label.text = "The Third segment was selected"
            label.textColor = .blue
            mainView.backgroundColor = .blue
            runAnimate()
        }
        
    }
    private func runAnimate() {
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: [.autoreverse, .repeat])
        {
            self.mainView.frame.origin.x -= 20
            self.label.frame.origin.y -= 10
        }
    }
}

