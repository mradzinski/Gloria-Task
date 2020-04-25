//
//  DataSource.swift
//  gloria
//
//  Created by Matias Radzinski on 4/24/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

class DataSource {
    private static let users: [User] = [
        User(id: 0, name: "Matias", profilePicture: "", uploadedVideosCount: 4, followersCount: 123, followingCount: 45),
        User(id: 1, name: "Matteo", profilePicture: "", uploadedVideosCount: 0, followersCount: 0, followingCount: 0)
    ]
    
    private static let notifications: [Notification] = [
        Notification(type: .like, body: "<span style=\"font-family:HelveticaNeue;font-size:15\"><b>Matteo</b> liked your video</span>", thumbnail: "image1", isRead: false),
        Notification(type: .profile, body: "<span style=\"font-family:HelveticaNeue;font-size:15\"><b>Matias</b> is now following you</span>", thumbnail: "image2", isRead: false),
        Notification(type: .challenge, body: "<span style=\"font-family:HelveticaNeue;font-size:15\">There's a new challenge for you to check out</span>", thumbnail: "image3", isRead: false),
        Notification(type: .challenge, body: "<span style=\"font-family:HelveticaNeue;font-size:15\">New <b>Toilet Paper Challenge</b>. Check it out!</span>", thumbnail: "image4", isRead: true),
        Notification(type: .other, body: "<span style=\"font-family:HelveticaNeue;font-size:15\">Check out <b>Anton</b>'s profile</span>", thumbnail: "image5", isRead: true),
        Notification(type: .like, body: "<span style=\"font-family:HelveticaNeue;font-size:15\">Here is a <b>new video</b> we like</span>", thumbnail: "image6", isRead: true),
        Notification(type: .like, body: "<span style=\"font-family:HelveticaNeue;font-size:15\">Here is a <b>profile</b> we like</span>", thumbnail: "image7", isRead: true)
    ]

    static func getAllUsers() -> [User] {
        return users
    }
    
    static func getUserById(_ id: Int) -> User? {
        users.first { (u) -> Bool in
            return u.id == id
        }
    }
    
    static func getAllNotifications() -> [Notification] {
        return notifications
    }
}
