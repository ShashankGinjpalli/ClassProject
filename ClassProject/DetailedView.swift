//
//  DetailedView.swift
//  ClassProject
//
//  Created by Shashank Ginjpalli on 11/2/19.
//  Copyright © 2019 Shashank Ginjpalli. All rights reserved.
//

import Foundation

import UIKit

class DetailedView: UIViewController {
    
    
    
    var movieObject:movie?
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieCast: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreButton.layer.cornerRadius = 15
        movieImage.layer.cornerRadius = 15
        movieImage.image = UIImage(data: movieObject?.moviePoster ?? Data());
        movieTitle.text = movieObject?.movieTitle ?? ""
        movieDirector.text = movieObject?.movieDirector ?? "Not Found"
        movieCast.text = movieObject?.movieCast ?? "Not Found"
        movieRating.text = movieObject?.movieRating ?? "N/A"
        movieRelease.text = movieObject?.movieReleaseDate ?? "Not Found"
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if(segue.identifier == "Details"){
           
            if let viewController: moreDetailedView = segue.destination as? moreDetailedView {
                viewController.movieObject = self.movieObject
            }
        }
        
        
        
    }


}
