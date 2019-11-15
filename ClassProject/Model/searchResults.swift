//
//  searchResults.swift
//  ClassProject
//
//  Created by Shashank Ginjpalli on 11/15/19.
//  Copyright © 2019 Shashank Ginjpalli. All rights reserved.
//

import Foundation


class searchResults{
    var searchResults:[search] = [];
    
    func getCount() -> Int{
        return searchResults.count
    }
    
    func addSearchItem(s: String, dt: Data){
        let s: search = search(st: s, d: dt);
        searchResults.append(s);
    }
    
    func clearSearchResults(){
        searchResults = [];
    }
    
    func getSearchItem(item: Int) -> search{
           return searchResults[item];
       }
    
}

class search {
    var searchTitle: String?
    var imageDat: Data?
    
    init(st: String, d: Data){
        self.searchTitle = st
        self.imageDat = d
    }
}
