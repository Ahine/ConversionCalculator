//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Andy Hine on 11/6/17.
//  Copyright © 2017 Andy Hine. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    var inputText:String = ""
    var outputText:String = ""
    var currentConverter:Converter = Converter(label: "fahrenheit to celcius", inputUnit: " °F", outputUnit: " °C")
    
    let converters:[Converter] = [
        Converter(label: "fahrenheit to celcius", inputUnit: " °F", outputUnit: " °C"),
        Converter(label: "celcius to fahrenheit", inputUnit: " °C", outputUnit: " °F"),
        Converter(label: "miles to kilometers", inputUnit: " mi", outputUnit: " km"),
        Converter(label: "kilometers to miles", inputUnit: " km", outputUnit: " mi")
    ]

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBAction func buttonPress(_ sender: UIButton) {
        //print(sender.tag)
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
                self.inputDisplay.text = self.inputText + converter.inputUnit
                if let input = Double(self.inputText){
                    self.outputText = String(self.calculateConversion(input: input))
                }
                self.outputDisplay.text = self.outputText + converter.outputUnit
                self.currentConverter = converter
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func handleNumberPressed(num:String){
        inputText.append(num)
        self.inputDisplay.text = inputText + currentConverter.inputUnit
        if let input = Double(inputText){
            outputText = String(calculateConversion(input: input))
        }
        self.outputDisplay.text = outputText + currentConverter.outputUnit
    }
    
    func calculateConversion(input:Double) -> Double{
        
        var output:Double = 0.0
        
        switch currentConverter.label{
        case "fahrenheit to celcius":
            output = (input - 32) * (5/9)
        case "celcius to fahrenheit":
            output = input * (9/5) + 32
        case "miles to kilometers":
            output = input * 0.621371
        case "kilometers to miles":
            output = input * 1.609344
        default:
            break
        }
        return output
    }
    
    func handleSignChange(){
        if(!self.inputText.isEmpty){
            if(self.inputText.first != "-"){
                self.inputText = "-" + self.inputText
            }else{
                self.inputText.remove(at: self.inputText.index(of: "-")!)
            }
            self.outputText = String(calculateConversion(input: Double(self.inputText)!))
            self.inputDisplay.text = inputText + currentConverter.inputUnit
            self.outputDisplay.text = outputText + currentConverter.outputUnit
        }
        
       
    }
    
    func handleDecimal(){
        if(self.inputText.last != "."){
            self.inputText.append(".")
            self.outputText.append(".")
            self.inputDisplay.text = inputText + currentConverter.inputUnit
            self.outputDisplay.text = outputText + currentConverter.outputUnit
        }
    }
    
    func clear(){
        self.inputText = ""
        self.outputText = ""
        self.inputDisplay.text = inputText + currentConverter.inputUnit
        self.outputDisplay.text = outputText + currentConverter.outputUnit
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        let defaultConverter = converters[0]
        currentConverter = defaultConverter
        
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
