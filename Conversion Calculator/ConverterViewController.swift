//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Andy Hine on 11/6/17.
//  Copyright © 2017 Andy Hine. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    let converters:[Converter] = [
        Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
        Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
        Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
        Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")
    ]

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBAction func buttonPress(_ sender: UIButton) {
        print(sender.tag)
        switch sender.tag{
        case 0:
            handleNumberPressed(num: sender.titleLabel!.text!)
        case 1:
            handleConvertPressed()
        case 2:
            handleSignChange()
        case 3:
            handleDecimal()
        case 4:
            clear()
        default:
            break
        }
        
    }
    
    func handleConvertPressed(){
        let alert = UIAlertController(title: nil, message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        for converter in converters{
            alert.addAction(UIAlertAction(title: converter.label, style: UIAlertActionStyle.default, handler: {
                (alertAction) -> Void in
                self.inputDisplay.text = converter.inputUnit
                self.outputDisplay.text = converter.outputUnit
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func handleNumberPressed(num:String){
        print(num)
    }
    
    func handleSignChange(){
        print("sign change")
    }
    
    func handleDecimal(){
        print("decimal")
    }
    
    func clear(){
        print("clear")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        let defaultConverter = converters[0]
        
        inputDisplay.text = defaultConverter.inputUnit
        outputDisplay.text = defaultConverter.outputUnit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
