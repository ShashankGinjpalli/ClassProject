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
        cell.movieImage.image = UIImage(data: movieItem.moviePoster!);
        cell.movieTitle.text = movieItem.movieTitle!
        cell.movieRating.text = movieItem.movieRating ?? "N/A";
        
        cell.markWatchedButton.tag = indexPath.row
        
        cell.markWatchedButton.addTarget(self, action: #selector(deleteButton(_:)), for: .touchUpInside)
        
        return cell;
    }
    
    @objc func deleteButton(_ sender: UIButton){
        let index = sender.tag
      
        
        let alert = UIAlertController(title: "Alert", message: "Are you sure you would like to remove this movie from your watchlist?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        alert.addAction(UIAlertAction(title: "Remove", style: .destructive, handler: { action in
            self.m.removeMovie(item: index)
            self.movieTable.reloadData();
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
          
         
          
          if(segue.identifier == "Overview"){
              let selectedIndex: IndexPath = self.movieTable.indexPath(for: sender as! UITableViewCell)!
              if let viewController: DetailedView = segue.destination as? DetailedView {
                viewController.movieObject = m.getMovie(item: selectedIndex.row)
              }
          }
          
          
          
      }
    
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
           if let index = self.movieTable.indexPathForSelectedRow{
               self.movieTable.deselectRow(at: index, animated: true)
           }
           
       }
    
   
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        if let sourceView = segue.source as? AddView {
            
            var mov = movie(title: sourceView.searchObject.searchTitle!, img: sourceView.searchObject.imageDat ?? Data())
            mov = m.callApi(m: mov)
            m.addMovie(m: mov)
            self.movieTable.reloadData()
        }
        
        
    }
    
}

