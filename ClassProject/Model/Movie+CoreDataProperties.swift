//
//  Movie+CoreDataProperties.swift
//  ClassProject
//
//  Created by Shashank Ginjpalli on 11/5/19.
//  Copyright © 2019 Shashank Ginjpalli. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var movieBudget: Int64
    @NSManaged public var movieCast: NSObject?
    @NSManaged public var movieDirector: String?
    @NSManaged public var movieID: Int64
    @NSManaged public var movieOverview: String?
    @NSManaged public var moviePoster: Data?
    @NSManaged public var moviePosterPath: String?
    @NSManaged public var movieRating: String?
    @NSManaged public var movieReleaseDate: String?
    @NSManaged public var movieRunTime: Int64
    @NSManaged public var movieTitle: String?
    @NSManaged public var movieWebReviews: NSObject?

}
