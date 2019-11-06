//
//  ViewController.swift
//  ClassProject
//
//  Created by Shashank Ginjpalli on 10/30/19.
//  Copyright © 2019 Shashank Ginjpalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var m:movies = movies()
    @IBOutlet weak var movieTable: UITableView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m.getCount();
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDataCell", for: indexPath) as! movieTableCell
        
        let movieItem = m.getMovie(item:indexPath.row)
//        cell.movieImage.image = UIImage(data: movieItem.moviePoster!);
        cell.movieTitle.text = movieItem.movieTitle!
//        cell.movieTitle.text = movieItem.movieRating!
        
        return cell;
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
           if let index = self.movieTable.indexPathForSelectedRow{
               self.movieTable.deselectRow(at: index, animated: true)
           }
           
       }
    
   

    @IBAction func addMovie(_ sender: Any) {
    }
    
}

