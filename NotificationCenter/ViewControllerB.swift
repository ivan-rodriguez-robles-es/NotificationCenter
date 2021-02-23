//
//  ViewControllerB.swift
//  NotificationCenter
//
//  Created by ivk on 13/10/2020.
//  Copyright © 2020 irr. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notifAction = notificationAction
        
        observationCenter.instance.addObserver(id: 1, observer: self, notificationId: "Color Changed to systemPink", action: notifAction)
        
        NotificationCenter
            .default.addObserver(self,
                                   selector: #selector(pinkSuscriptionAction),
                                   name: Notification.Name( "Color Changed to systemPink"),
                                   object: nil)
        
        NotificationCenter
            .default.addObserver(self,
                                   selector: #selector(blueSuscriptionAction),
                                   name: Notification.Name( "Color Changed to systemBlue"),
                                   object: nil)

    }
   
    @IBAction func pinkSuscriptionAction () {
        print("Pink Notification received")
        view.backgroundColor = .systemPink
    }
    @IBAction func blueSuscriptionAction () {
        print("Blue Notification received")
        view.backgroundColor = .systemBlue
    }
    
    func notificationAction () {
        print ("generalNotification Action")
    }

}
