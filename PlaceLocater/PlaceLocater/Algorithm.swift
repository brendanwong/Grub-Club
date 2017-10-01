//
//  Algorithm.swift
//  PlaceLocater
//
//  Created by Abhinav on 9/30/17.
//  Copyright © 2017 Abhinav. All rights reserved.
//

import Foundation
func suggest(mainUser:[Restaurant]) -> String? {
    var goalPrice = 2
    var userCounter = 4
    
    var user1 = [Restaurant(name: "Taco Bell",
        placeID: "ChIJ1_MHGHQtjoARxf2FfIfiYkk",
        priceLevel: 1, rating: 3),
                 Restaurant(name: "KFC",
                    placeID: "ChIJz47sXnQtjoARCNWyDP-etxI",
                    priceLevel: 1,rating: 0),
                 Restaurant(name: "Olive Garden Italian Restaurant",
                    placeID: "ChIJP5NLubt9j4ARb-KDFbSOYcE",
                    priceLevel: 2,rating: 4),
                 Restaurant(name: "Domino's Pizza",
                    placeID: "ChIJy3jRZA_Kj4AR_Fy_h8ieOr8",
                    priceLevel: 1, rating: 0),
                 Restaurant(name: "La Baguette Bistro",
                    placeID: "ChIJzwAnH1UasocRkt2ql_DSb9o",
                    priceLevel: 2,rating: 0),
                 Restaurant(name: "Gordon Ramsay Steak",
                    placeID: "ChIJvUdRyzDEyIARh86Fi1C2hqI",
                    priceLevel: 2, rating: 5),
                 Restaurant(name: "Alain Ducasse au Plaza Athénée",
                    placeID: "ChIJ7zXfwNxv5kcRy19nZfwMjko",
                    priceLevel: 4, rating: 0)]
    // KFC - 4, Olive Garden - 3, Domino's - 5
    var user2 = [Restaurant(name: "Taco Bell",
        placeID: "ChIJ1_MHGHQtjoARxf2FfIfiYkk",
        priceLevel: 1, rating: 0),
                 Restaurant(name: "KFC",
                    placeID: "ChIJz47sXnQtjoARCNWyDP-etxI",
                    priceLevel: 1,rating: 4),
                 Restaurant(name: "Olive Garden Italian Restaurant",
                    placeID: "ChIJP5NLubt9j4ARb-KDFbSOYcE",
                    priceLevel: 2,rating: 3),
                 Restaurant(name: "Domino's Pizza",
                    placeID: "ChIJy3jRZA_Kj4AR_Fy_h8ieOr8",
                    priceLevel: 1, rating: 5),
                 Restaurant(name: "La Baguette Bistro",
                    placeID: "ChIJzwAnH1UasocRkt2ql_DSb9o",
                    priceLevel: 2,rating: 0),
                 Restaurant(name: "Gordon Ramsay Steak",
                    placeID: "ChIJvUdRyzDEyIARh86Fi1C2hqI",
                    priceLevel: 2, rating: 0),
                 Restaurant(name: "Alain Ducasse au Plaza Athénée",
                    placeID: "ChIJ7zXfwNxv5kcRy19nZfwMjko",
                    priceLevel: 4, rating: 0)]
    // Taco Bell - 1, La Baguette - 3, Alain - 4
    var user3 = [Restaurant(name: "Taco Bell",
        placeID: "ChIJ1_MHGHQtjoARxf2FfIfiYkk",
        priceLevel: 1, rating: 1),
                 Restaurant(name: "KFC",
                    placeID: "ChIJz47sXnQtjoARCNWyDP-etxI",
                    priceLevel: 1,rating: 0),
                 Restaurant(name: "Olive Garden Italian Restaurant",
                    placeID: "ChIJP5NLubt9j4ARb-KDFbSOYcE",
                    priceLevel: 2,rating: 0),
                 Restaurant(name: "Domino's Pizza",
                    placeID: "ChIJy3jRZA_Kj4AR_Fy_h8ieOr8",
                    priceLevel: 1, rating: 0),
                 Restaurant(name: "La Baguette Bistro",
                    placeID: "ChIJzwAnH1UasocRkt2ql_DSb9o",
                    priceLevel: 2,rating: 3),
                 Restaurant(name: "Gordon Ramsay Steak",
                    placeID: "ChIJvUdRyzDEyIARh86Fi1C2hqI",
                    priceLevel: 2, rating: 0),
                 Restaurant(name: "Alain Ducasse au Plaza Athénée",
                    placeID: "ChIJ7zXfwNxv5kcRy19nZfwMjko",
                    priceLevel: 4, rating: 4)]
    var userList = [user1,user2,user3, mainUser]
    var dictRating = ["": 0.0]
    var finalRating = ["": 0.0]
    for user in userList{
        userCounter += 1
        var dictPrice = ["": 0]
        for restaurant in user{
            // Dictionary with all ratings
            dictRating[restaurant.name] = restaurant.rating
            // Dictionary with all Prices
            dictPrice[restaurant.name] = restaurant.priceLevel
        }
        dictRating[""] = nil
        dictPrice[""] = nil
        // Removes all values where the price isn't the goal price
        for (key,value) in dictRating{
            for (key1, value1) in dictPrice{
                if key == key1{
                    if value1 != goalPrice && value1 != goalPrice + 1 && value1 != goalPrice - 1 {
                        dictRating[key] = nil
                        dictPrice[key] = nil
                    }
                }
            }
        }
        for (key,value) in dictRating{
            if finalRating[key] == nil{
                finalRating[key] = value
            } else {
                finalRating[key]! += value
            }
        }
        // At this point, dictRating holds
        // Steve 2.0
        // Steve 4.0
        // Steve 5.0
    }
    finalRating[""] = nil
    
    // Grabs avg rating per restaurant in a dictionary
    var finalDict = ["": 0.0]
    var finalCounter = ["": 0.0]
    func grabScores(id: Int){
        for (key, value) in finalRating{
            if value <= 1.0{
                finalDict[key] = 0
                finalCounter[key] = 1.0
            } else if finalDict[key] == nil{
                finalDict[key] = value
                finalCounter[key] = 1.0
            } else {
                finalDict[key]! += value
                finalCounter[key]! += 1.0
            }
        }
    }
    finalDict[""] = nil
    
    for i in 1 ... userCounter{
        // Some function to grab dictionary of all ratings for a user's visited restaurants
        // Examples of dictionaries
        grabScores(i)
    }
    
    finalDict[""] = nil
    // Get average value per store, get how many users went to that store
    finalCounter[""] = nil
    for (key,_) in finalDict{
        finalDict[key]! /= finalCounter[key]!
    }
    // Return scores with calculation
    // BB = 95, JS = 155, SSS = 35	
    var scores = ["": 0.0]
    for (key,value) in finalDict{
        for (key1, value1) in finalCounter{
            let value2 = Double(userCounter) - value1
            if key1 == key{
                scores[key] = (value/value1 * 20 + value1 * 50 - value2 * 15)		
            }
        }
    }
    
    scores[""] = nil
    // Choose highest 5 scores that are open and display the stores with those in order
    let byValue = {
        (elem1:(key: String, val: Double), elem2:(key: String, val: Double))->Bool in
        if elem1.val > elem2.val {
            return true
        } else {
            return false
        }
    }
    let sortedDict = scores.sort(byValue)
    return sortedDict.first?.0
}