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
    
    var s:searchResults = searchResults();
    var imageURL = "";
    var results:NSMutableArray = []
    
    
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
        return self.s.getCount();
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! searchTableCell
        let searchResult = self.s.getSearchItem(item: indexPath.row);
        
        cell.searchMovieTitle.text = searchResult.searchTitle
        cell.searchImage.image = UIImage(data: searchResult.imageDat!);
        
        return cell
    }
    
    @IBAction func getData(_ sender: Any) {
        
        self.s.clearSearchResults();
        
        let movieName = searchField.text;
        if(movieName == ""){
            let alert = UIAlertController(title: "Error", message: "Enter a Movie Name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var editMovieName = movieName;
        
        if((editMovieName?.contains(" "))!){
            editMovieName = (movieName?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))!
        }
        
        
        let urlAsString = "https://api.themoviedb.org/3/search/movie?api_key=bf2c357d63cf76d216fb334f6083eeae&language=en-US&query="+editMovieName!+"&page=1&include_adult=false"
        
        self.imageURL = "https://image.tmdb.org/t/p/original"
        
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            
            
            var err: NSError?
            
            
            let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            if (err != nil) {
                print("JSON Error \(err!.localizedDescription)")
            }
            
            
            self.results = jsonResult["results"] as! NSMutableArray
            
            
            
            if(self.results.count != 0){
                for i in self.results{
                    let y = i as? [String: AnyObject]
                    self.s.addSearchItem(s: y?["title"] as! String)
                }
                
            }else{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "No Movies Found", message: "", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            
           
            
            
            for i in 0...self.results.count - 1{
                
                self.imageURL = "https://image.tmdb.org/t/p/original"
                
                let y = self.results[i] as? [String: AnyObject]
                
                var image = NSString()
                
                
                image = (y!["poster_path"] as? NSString) ?? NSString()

                
                self.imageURL = self.imageURL+(image as String)
                
                let url = URL(string: self.imageURL)!
                let session = URLSession.shared
                
                let dataTask = session.dataTask(with: url, completionHandler: { data, response, error -> Void in
                    if (error != nil) {
                        print(error!.localizedDescription)
                    }
                    
                    
                    var err: NSError?
                    
                    
                    self.s.loadImage(n: i, img: data!);
                    
                    
                    
                    
                })
                
                
                dataTask.resume()
                
                print(self.imageURL)
                
            }
            
            DispatchQueue.main.async {
                self.searchTable.reloadData();
            }
            
        })
        
        
        
        jsonQuery.resume()
        
        
        
        
        
        
    }
    
}
