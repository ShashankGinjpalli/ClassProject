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

    @IBAction func getData(_ sender: Any) {
        let movieName = searchField.text;
        
        let urlAsString = "https://api.themoviedb.org/3/search/movie?api_key=bf2c357d63cf76d216fb334f6083eeae&language=en-US&query="+movieName!+"&page=1&include_adult=false"
        
        
      let url = URL(string: urlAsString)!
      let urlSession = URLSession.shared
      
      
      let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
        if (error != nil) {
            print(error!.localizedDescription)
        }
        var err: NSError?


        var jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
        if (err != nil) {
            print("JSON Error \(err!.localizedDescription)")
        }

        print(jsonResult)

        })
        
        jsonQuery.resume()
        
    print("Pressed")
        
    }
    
}
