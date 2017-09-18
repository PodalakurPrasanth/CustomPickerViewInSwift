//
//  ViewController.swift
//  CustomPickerView
//
//  Created by Prasanth on 13/09/17.
//  Copyright © 2017 SriRama. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AKPickerViewDelegate,AKPickerViewDataSource {
    @IBOutlet weak var customPickerview: AKPickerView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backBT: UIButton!

    let titles = ["Tokyo", "Kanagawa", "Osaka", "Aichi", "Saitama", "Chiba", "Hyogo", "Hokkaido", "Fukuoka", "Shizuoka"]
    var countryFlags = ["flag_0","flag_1","flag_2","flag_3","flag_4","flag_5","flag_6","flag_7"]
       override func viewDidLoad() {
        super.viewDidLoad()
        self.customPickerview.delegate = self
        self.customPickerview.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfItemsInPickerView(_ pickerView: AKPickerView) -> Int {
        return countryFlags.count
    }

    func pickerView(_ pickerView: AKPickerView, imageForItem item: Int) -> UIImage {
        return UIImage(named: self.countryFlags[item])!.imageWithSize(CGSize(width: 100, height: 100))
    }
    func pickerView(_ pickerView: AKPickerView, didSelectItem item: Int) {
        self.backBT.isHidden = (item == 0 ) ? true : false
        self.nextButton.isHidden = (item == self.countryFlags.count - 1 ) ? true : false
        
    }
  
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        self.customPickerview.selectItem(self.customPickerview.selectedItem + 1,animated: true)
        
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.customPickerview.selectItem(self.customPickerview.selectedItem - 1, animated: true)
    }
}

