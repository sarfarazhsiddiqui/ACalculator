//
//  ViewController.swift
//  ACalculator
//
//  Created by Admin on 2/21/18.
//  Copyright © 2018 sarfaraz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // init variables & array
//    var preValue = Double()
    var preValue : Double = 0, postValue: Double = 0
    let inputNos : [Double] = [0,1,2,3,4,5,6,7,8,9]
    //var signMultiply = Bool(), signDivide = Bool()
    var signMultiply = false, signDivide = false, signAdd = false, signSubstract = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberDisplay.text = ""
    }
    // outlet collectors
    @IBOutlet var inputSigns: [UIButton]!
    @IBOutlet weak var numberDisplay: UITextField!
    @IBOutlet var inputNumberByButton: [UIButton]!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.ƒs
    }
   
    @IBAction func inputNumberAction(_ sender: Any) {
        let button = sender as! UIButton
        switch button {
        case inputNumberByButton[0]:
            displayNumber(preValueNo: String(Int(inputNos[0])))
        case inputNumberByButton[1]:
            displayNumber(preValueNo: String(Int(inputNos[1])))
//            print("button 2 pressed")
        case inputNumberByButton[2]:
            displayNumber(preValueNo: String(Int(inputNos[2])))
        case inputNumberByButton[3]:
            displayNumber(preValueNo: String(Int(inputNos[3])))
        case inputNumberByButton[4]:
            displayNumber(preValueNo: String(Int(inputNos[4])))
        case inputNumberByButton[5]:
            displayNumber(preValueNo: String(Int(inputNos[5])))
        case inputNumberByButton[6]:
            displayNumber(preValueNo: String(Int(inputNos[6])))
        case inputNumberByButton[7]:
            displayNumber(preValueNo: String(Int(inputNos[7])))
        case inputNumberByButton[8]:
            displayNumber(preValueNo: String(Int(inputNos[8])))
        case inputNumberByButton[9]:
            //numberDisplay.text = numberDisplay.text! + String(Int(inputNos[9]))
            displayNumber(preValueNo: String(Int(inputNos[9])))
        default:
            print ("No result ")
        }
    }
    func displayNumber(preValueNo : String) {
        numberDisplay.text = numberDisplay.text! + preValueNo
     //   let preval = numberDisplay.text
     //   return preval!
    }
    
    func storeFirstValue(){
        preValue = Double(numberDisplay.text!)!
        numberDisplay.text = ""
    }
   
    @IBAction func inputSigns(_ sender: Any) {
        let signs = sender as! UIButton
        switch signs {
        case inputSigns[0]:
            storeFirstValue()
            signMultiply = true
            signAdd=false; signSubstract = false; signDivide = false
        case inputSigns[1]:
            storeFirstValue()
            signDivide = true
            signAdd=false; signSubstract = false; signMultiply = false
        case inputSigns[2]:
            storeFirstValue()
            signAdd = true
            signSubstract = false; signMultiply = false; signDivide = false
        case inputSigns[3]:
            storeFirstValue()
            signSubstract = true
            signAdd=false; signMultiply = false; signDivide = false
        case inputSigns[5]:
        numberDisplay.text = ""
        signAdd=false; signSubstract = false; signMultiply = false; signDivide = false
        case inputSigns[4]:
            showResult()

        default:
            print("No Value")
        }
    }
    func showResult(){
        var result :Double = 0
        if signAdd {
            result = Double(self.preValue) + Double(numberDisplay.text!)!
        } else if signSubstract{
            result  = Double(self.preValue) - Double(numberDisplay.text!)!
        } else if signMultiply{
            result = Double(self.preValue) * Double(numberDisplay.text!)!
        } else if signDivide{
            result = Double(self.preValue) / Double(numberDisplay.text!)!
        }else {
            print("Wring Value Entered")
        }
        numberDisplay.text = String(Int(result))
    }
}

