//
//  NotificationsViewControl,er.swift
//  gloria
//
//  Created by Matias Radzinski on 4/24/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit

class NotificationsViewController: UIViewController {
    private let notifications = DataSource.getAllNotifications()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        tableView.showTopSeparatorWhenScrolled(true)
        
        closeButton.addTarget(self, action: #selector(didCloseButtonTap(_:)), for: .touchUpInside)
    }
    
    @objc func didCloseButtonTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension NotificationsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notifications.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
        
        cell.setupNotification(notifications[indexPath.item])
        
        return cell
    }
}

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeMoveUpWithFade(rowHeight: cell.frame.height, duration: 0.5, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let notification = notifications[indexPath.row] as Notification? {
            print(notification)
            
            if notification.type == .profile {
                let storyboard = UIStoryboard(name: "Profile", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as UIViewController
            
                vc.modalPresentationStyle = .fullScreen
                
                present(vc, animated: true, completion: nil)
            }
        }
    }
}
