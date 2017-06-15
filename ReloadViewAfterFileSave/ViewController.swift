//
//  ViewController.swift
//  ReloadViewAfterFileSave
//
//  Created by Nayem BJIT on 6/15/17.
//  Copyright © 2017 Nayem BJIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: Notification.Name("FileWrittenCompletion"), object: nil)
        myLabel.text = "File is being saved"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func updateUI() {
        self.myLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.myLabel.text = "File is saved successfully"
        self.view.setNeedsDisplay()
    }

}

