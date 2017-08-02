//
//  ViewController.swift
//  calc
//
//  Created by 中村 泉 on 2017/08/02.
//  Copyright © 2017年 中村 泉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var circulatorLabel: UILabel!

    @IBOutlet weak var sumLabel: UILabel!
    
    @IBAction func inputNumber(_ sender: UIButton) {
        let num = sender.currentTitle!
        if (isFirstInput){
            self.sumLabel.text = num
            isFirstInput = false
        }
        else {
            self.sumLabel.text = self.sumLabel.text! + num
        }
    }
    var isFirstInput = true
    var cmode : CalcMode = .neutral
    var totalSum = 0
    
    @IBAction func clearSum(_ sender: UIButton) {
        self.sumLabel.text = "0"
        isFirstInput = true
    }
    
    @IBAction func plusClick(_ sender: UIButton) {
        self.cmode = .plus
        isFirstInput = true
        let str = self.sumLabel.text!
        if (!str.isEmpty) {
            self.circulatorLabel.text = self.circulatorLabel.text! + sumLabel.text! + " + "
            totalSum = totalSum + Int(self.sumLabel.text!)!
            self.sumLabel.text = String(totalSum)
        }
    }
    
    @IBAction func minusClick(_ sender: UIButton) {
        self.cmode = .minus
    }
    
    @IBAction func kakeruClick(_ sender: UIButton) {
        self.cmode = .kakeru
    }
    
    @IBAction func waruClick(_ sender: UIButton) {
        self.cmode = .waru
    }
    
    enum CalcMode {
        case plus
        case minus
        case kakeru
        case waru
        case neutral
    }
}

