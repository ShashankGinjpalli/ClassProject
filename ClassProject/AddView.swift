//
//  addView.swift
//  ClassProject
//
//  Created by Shashank Ginjpalli on 11/3/19.
//  Copyright © 2019 Shashank Ginjpalli. All rights reserved.
//

import Foundation
import UIKit

class AddView: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        searchButton.layer.cornerRadius = 15;
        searchField.layer.cornerRadius = 10;
        
        // Do any additional setup after loading the view.
    }


}
