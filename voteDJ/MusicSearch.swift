//
//  MusicSearch.swift
//  CrowdDJ
//
//  Created by Joshua Kopen on 7/19/17.
//  Copyright © 2017 Joshua Kopen. All rights reserved.
//

import Foundation
import Alamofire

class MusicSearch {
    
    typealias JSONStandard = [String : AnyObject]
    
    static func searchSong(songName: String, mp: MusicPlayer) -> [JSONStandard]{
        Alamofire.request("https://api.spotify.com/v1/search", method: .get, parameters: ["q":songName, "type":"track"], encoding: URLEncoding.default, headers: ["Authorization": "Bearer "+mp.session.accessToken]).responseJSON(completionHandler: {
            (response) -> [JSONStandard] in
            return self.parseData(JSONData: response.data!)
        })
        return items
    }
    
    static func parseData(JSONData: Data, itemList: [JSONStandard]) {
        do {
            print("WE GET HERE")
            let readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            if let tracks = readableJSON["tracks"] as? JSONStandard {
                if let items = tracks["items"] {
                    for i in 0..<items.count {
                        itemList.append(items[i])
                        print(itemList)
                    }
                }
            }
            print(readableJSON)
        }
        catch {
            print(error)
        }
    }
}


