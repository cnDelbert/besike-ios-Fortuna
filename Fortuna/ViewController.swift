//
//  ViewController.swift
//  Fortuna
//
//  Created by Delbert on 14-10-17.
//  Copyright (c) 2014年 Delbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    @IBOutlet weak var quotationTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        println("Hacking in Swift, since iOS " + String(8))
        
        println("controller: \(self)")
        println("view: \(self.view)")
        println("view's frame: \(self.view.frame)")
            
        let path = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
        println("positive quotes path: \(path)")

        println("viewDidLoad quotationTextView: \(quotationTextView)")
        
        quotationTextView.editable = false
        quotationTextView.selectable = false

        displayRandomQuote()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        println("awakeFromNib quotationTextView: \(quotationTextView)")

    }
    
    func displayRandomQuote(){
        let delegate = UIApplication.sharedApplication().delegate as AppDelegate
        let quotes = delegate.positiveQuotes + delegate.negativeQuotes
        let quote = quotes[Int(arc4random_uniform(UInt32(195)))]
        quotationTextView.text = quote
    }

}

