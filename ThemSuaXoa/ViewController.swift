//
//  ViewController.swift
//  ThemSuaXoa
//
//  Created by Duc on 08/01/2019.
//  Copyright © 2019 Duc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var data : String?
    

    @IBOutlet weak var txtText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if data != nil {
            txtText.text = data
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        data = txtText.text
    }


}

