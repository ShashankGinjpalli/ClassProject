//
//  addView.swift
//  ClassProject
//
//  Created by Shashank Ginjpalli on 11/3/19.
//  Copyright © 2019 Shashank Ginjpalli. All rights reserved.
//

import Foundation
import UIKit

class AddView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        searchButton.layer.cornerRadius = 15;
        searchField.layer.cornerRadius = 10;
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! searchTableCell
        
        return cell
    }


}
