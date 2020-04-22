//
//  UpComingExtension.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension DetailsViewController{
    
    func getUpComingEvents(leagueId : String){
           
       let closure = { (upComingEventsArrayNew :[Event]) -> Void in
           DispatchQueue.main.async {
            self.upcomingEventsArray = upComingEventsArrayNew               
            self.count+=1
           }
       }
       detailsPresenter.getUpcomingEvents(byLeagueId: leagueId, completionHandler: closure)
       
    }
    
    func configureUpComingEventsCell(cell : UpcomingCollectionViewCell , index : Int) {
        cell.awayTeamLabel.text = upcomingEventsArray[index].strAwayTeam
        cell.homeTeamLabel.text = upcomingEventsArray[index].strHomeTeam
        cell.dateLabel.text = upcomingEventsArray[index].strDate
        cell.timeLabel.text = upcomingEventsArray[index].strTime
        if isTeamDataLoaded{
            
            let hometeamsList = teamsArray.filter({(value) in value.strTeam ==  upcomingEventsArray[index].strHomeTeam})
            upcomingEventsArray[index].strHomeTeamLogo = hometeamsList[0].strTeamBadge
            
            cell.homeImageView.kf.setImage(with: URL(string: hometeamsList[0].strTeamBadge),placeholder: UIImage(named: ""))
            
            let awayteamsList = teamsArray.filter({(value) in value.strTeam ==  upcomingEventsArray[index].strAwayTeam})
           
           upcomingEventsArray[index].strAwayTeamLogo = awayteamsList[0].strTeamBadge
           cell.awayImageView.kf.setImage(with: URL(string:awayteamsList[0].strTeamBadge),placeholder: UIImage(named: ""))
        }
        
        cell.vsLabel.text = "VS"
    }
}
