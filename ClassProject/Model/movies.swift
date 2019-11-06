//
//  movies.swift
//  ClassProject
//
//  Created by Shashank Ginjpalli on 11/2/19.
//  Copyright © 2019 Shashank Ginjpalli. All rights reserved.
//

import Foundation



class movies{
    
    init(){
        var movie1 = movie(title: "Hola", ID: 20);
        var movie3 = movie(title: "NO", ID: 20);
        var movie2 = movie(title: "dshfkjhjkdsf", ID: 20);
        
        
        
        movies.append(movie1)
        movies.append(movie2)
        movies.append(movie3)
        
        movie1 = movie(title: "Hola", ID: 20);
        movie3 = movie(title: "NO", ID: 20);
        movie2 = movie(title: "dshfkjhjkdsf", ID: 20);
        
        movies.append(movie1)
        movies.append(movie2)
        movies.append(movie3)

        
    }
    
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
    var movieRunTime: Int?
    var movieReleaseDate: String?
    var movieBudget:Int?
    var movieCast:[String] = []
    var movieWebRatings:[String] = []
    
    var movieRating:String?
    
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
