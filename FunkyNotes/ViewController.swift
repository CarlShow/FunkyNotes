//
//  ViewController.swift
//  FunkyNotes
//
//  Created by CARL SHOW on 9/21/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var inp1: UITextField!
    @IBOutlet weak var inp2: UITextField!
    @IBOutlet weak var theButton: UIButton!
    @IBOutlet weak var printField: UILabel!
    @IBOutlet weak var swapper: UIButton!
    var swappi = [false, false]
    override func viewDidLoad() {
        super.viewDidLoad()
        theButton.layer.cornerRadius = 11
        swapper.layer.cornerRadius = 11
        inp1.delegate = self
        inp2.delegate = self
    }
    @IBAction func buttonPress(_ sender: Any)
    {
        if let x = Double(inp1.text!)
        {
            if let y = Double(inp2.text!)
            {
                if swappi == [true, false]
                {
                    printField.text = "Your perimeter is \(calcPerm(r: x, e: y)) units"
                        printField.backgroundColor = #colorLiteral(red: 0.7318757176, green: 0.8231084943, blue: 0.7646507621, alpha: 1)
//                    print("AAA")
                }
                else if swappi == [false, false]
                {
                    printField.text = "Your area is \(calcRatio(r: x, e: y)) units^2"
                    printField.backgroundColor = #colorLiteral(red: 0.7318757176, green: 0.8231084943, blue: 0.7646507621, alpha: 1)
                }
                else
                {
                    let o = calcRec(r: x, e: y)
                    printField.text = "Your area is \(o.area) and your perimeter is \(o.perimeter)"
                    printField.backgroundColor = #colorLiteral(red: 0.6980804205, green: 0.5548057556, blue: 0.6686703563, alpha: 0.928580682)
                }
            }
            else
            {
                printField.text = "Your second input isn't valid, please re-enter your info."
                printField.backgroundColor = #colorLiteral(red: 0.6686505079, green: 0.339101851, blue: 0.3927092552, alpha: 1)
            }
        }
        else
        {
            printField.text = "Your first input isn't valid, please re-enter your info."
            printField.backgroundColor = #colorLiteral(red: 0.6686505079, green: 0.339101851, blue: 0.3927092552, alpha: 1)
        }
    }
    @IBAction func swapping(_ sender: Any)
    {
        if swappi == [false, true]
        {
            swappi = [false, false]
            swapper.backgroundColor = #colorLiteral(red: 0.5166373253, green: 0.6924422383, blue: 0.5756877065, alpha: 1)
            swapper.setTitle("( Area )", for: .normal)
            theButton.setTitle("Calculate Area", for: .normal)
        }
        else if swappi == [false, false]
        {
            swappi = [true, false]
            swapper.backgroundColor = #colorLiteral(red: 0.3024700284, green: 0.3434299827, blue: 0.6458516121, alpha: 1)
            swapper.setTitle("( Perimeter )", for: .normal)
            theButton.setTitle("Calculate Perimeter", for: .normal)
        }
        else
        {
            swappi = [false, true]
            swapper.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            swapper.setTitle("( Rect )", for: .normal)
            theButton.setTitle("Calculate Rectangle", for: .normal)
        }
    }
    func calcRatio(r: Double, e: Double) -> String
    {
        return String( r * e )
    }
    func calcPerm(r: Double, e: Double) -> String
    {
        return String( 2 * r + 2 * e )
    }
    func calcRec(r: Double, e: Double) -> (area: Double, perimeter: Double)
    {
        return (area: r * e, perimeter: 2 * r + 2 * e)
    }
}

