//
//  ViewController.swift
//  gloria
//
//  Created by Matias Radzinski on 4/24/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var notificationsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationsButton.addTarget(self, action: #selector(didNotificationsTap(_:)), for: .touchUpInside)
    }


    @objc func didNotificationsTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Notifications", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationsViewController") as UIViewController
        
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true, completion: nil)
    }
}
