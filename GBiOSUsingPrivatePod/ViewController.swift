//
//  ViewController.swift
//  GBiOSUsingPrivatePod
//
//  Created by Guillermo Battistel on 10/03/2021.
//

import UIKit
import GBiOSPrivateSDK

class ViewController: UIViewController {

    @IBOutlet weak var uuidLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let uuid = GBPrivate.getDeviceId() ?? "Unknown"
        self.uuidLabel.text = uuid
    }


}

