//
//  SportAppMocks.swift
//  SportyAppTests
//
//  Created by Ghadeer El-Mahdy on 4/30/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation

@testable import SportyApp
class MockSportsHandler{
    
    var shouldReturnError : Bool
    init(shouldReturnError : Bool){
        self.shouldReturnError = shouldReturnError
    }
    
    let mockSportsJSONResponse : [[String:Any]] = [
       [
        "idSport": "102",
        "strSport": "Soccer",
        "strSportThumb": "https://www.thesportsdb.com/images/sports/soccer.jpg",
        "strSportDescription": "Association football, more commonly known as football or soccer, is a team sport played between two teams of eleven players with a spherical ball. It is played by 250 million players in over 200 countries and dependencies, making it the world's most popular sport. The game is played on a rectangular field with a goal at each end. The object of the game is to score by getting the ball into the opposing goal.\r\n\r\nPlayers are not allowed to touch the ball with their hands or arms while it is in play, unless they are goalkeepers (and then only when within their penalty area). Other players mainly use their feet to strike or pass the ball, but may also use any part of their body except the hands and the arms. The team that scores the most goals by the end of the match wins. If the score is level at the end of the game, either a draw is declared or the game goes into extra time or a penalty shootout depending on the format of the competition. The Laws of the Game were originally codified in England by The Football Association in 1863. Association football is governed internationally by the International Federation of Association Football (FIFA; French: Fédération Internationale de Football Association), which organises World Cups for both men and women every four years."
        ],
        [
        "idSport": "103",
        "strSport": "Motorsport",
        "strSportThumb": "https://www.thesportsdb.com/images/sports/motorsport.jpg",
        "strSportDescription": "Motorsport or motor sport is a global term used to encompass the group of competitive sporting events which primarily involve the use of motorised vehicles, whether for racing or non-racing competition. The terminology can also be used to describe forms of competition of two-wheeled motorised vehicles under the banner of motorcycle racing, and includes off-road racing such as motocross.\r\n\r\nFour- (or more) wheeled motorsport competition is globally governed by the Fédération Internationale de l'Automobile (FIA); and the Fédération Internationale de Motocyclisme (FIM) governs two-wheeled competition."
        ],[
        "idSport": "104",
        "strSport": "Fighting",
        "strSportThumb": "https://www.thesportsdb.com/images/sports/fighting.jpg",
        "strSportDescription": "Combat (French for fight) is a purposeful violent conflict meant to weaken, establish dominance over, or kill the opposition, or to drive the opposition away from a location where it is not wanted or needed.\r\n\r\nCombat is typically between opposing military forces in warfare. Combat violence can be unilateral, whereas fighting implies at least a defensive reaction. A large-scale fight is known as a battle. A verbal fight is commonly known as an argument. Combat effectiveness, in the strategic field, requires combat readiness. In military areas, the term is applied also to personnel, that has to receive proper training and be qualified to carry out combat operations in the unit to which they are assigned."
        ]
    ]
    
    enum ResponseWithError : Error{
        case responseError
    }
    
 }

extension MockSportsHandler {
    
    func loadDataFromURL( completionHandler: @escaping ([Sport]?, Error?) -> Void) {
        
        if shouldReturnError{
            completionHandler(nil,ResponseWithError.responseError)
        }else{
            
            var sportsArray = [Sport]()
            for sport in mockSportsJSONResponse{
                let idSport = sport["idSport"]
                let strSport = sport["strSport"]
                let strSportThumb = sport["strSportThumb"]
                   let strSportDescription = sport["strSportDescription"]
                               
                sportsArray.append(Sport(idSport: Int.init(idSport as! String)! , strSport: strSport as! String, strSportThumb: strSportThumb as! String, strSportDescription: strSportDescription as! String))
                
            }
            completionHandler(sportsArray,nil)
        }
        
    }
    
    
}

