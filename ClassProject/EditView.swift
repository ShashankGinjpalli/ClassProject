//
//  EditView.swift
//  ClassProject
//
//  Created by Shashank Ginjpalli on 11/2/19.
//  Copyright © 2019 Shashank Ginjpalli. All rights reserved.
//

import UIKit

class EditView: UIViewController {
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 15
        editButton.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }

    @IBAction func editImage(_ sender: Any) {
    }
    
}

