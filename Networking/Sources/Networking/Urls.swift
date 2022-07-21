//
//  File.swift
//  
//
//  Created by Yago Teixeira on 04/07/22.
//

import Foundation
import Domain

enum RequestUrls {
    enum Urls: String {
        case popularMoviesList = "/movie/popular"
        case latestReleasedMovie = "/movie/latest"
        case topRatedMoviesList = "/movie/top_rated"
        case upcomingMoviesList = "/movie/upcoming"
        
        case movieDetailUrl = "/movie/%s"
    }
    
    public static func buildPath(_ url: Urls) -> String {
        let mainUrl = "http://api.themoviedb.org/3"
        return mainUrl + url.rawValue
    }
}
