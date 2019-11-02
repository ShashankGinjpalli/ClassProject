//
//  movies.swift
//  ClassProject
//
//  Created by Shashank Ginjpalli on 11/2/19.
//  Copyright © 2019 Shashank Ginjpalli. All rights reserved.
//

import Foundation



class movies{
    var movies:[movie] = []
    
    func getMovie(item: Int) -> movie{
        return movies[item];
    }
    
    func getCount() -> Int {
        return movies.count;
    }
    
    func addCity(title:String, id:Int){
        
        
        let m = movie(title:title, ID:id);
        movies.append(m);
    }
    
    func removeMovie(item: Int){
        movies.remove(at: item);
    }
    
    func editMovie(newImage:Data, index:Int){
        movies[index].moviePoster = newImage;
    }
    
}


class movie{
    var movieID:Int?
    var movieTitle:String?
    var movieOverView:String?
    var movieRunTime: String?
    var movieReleaseDate: String?
    var movieBudget:Int?
    var movieCast:[String] = []
    var movieWebRatings:[String] = []
    
    var movieDirector:String?;
    
    var moviePoster: Data?
    var moviePosterPath:String?
    
    init(title:String, ID:Int) {
        self.movieTitle = title;
        self.movieID = ID;
        
        // poll the first api for the image
        
        // poll the api for the data
    }
}
