//
//  ViewControllerA.swift
//  NotificationCenter
//
//  Created by ivk on 13/10/2020.
//  Copyright © 2020 irr. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPushed() {
        observationCenter.instance.post(value: "Pink Suscription", notificationID: "Color Changed to systemPink")
        
        NotificationCenter.default.post(name: Notification.Name("Color Changed to systemPink"),
                                        object: nil)
        
        view.backgroundColor = .systemPink
    }

    @IBAction func buttonPushed2() {

        observationCenter.instance.post(value: "Blue Suscription", notificationID: "Color Changed to systemBlue")
        
        NotificationCenter.default.post(name: Notification.Name("Color Changed to systemBlue"),
                                        object: nil)
        
        view.backgroundColor = .systemBlue
    }
}
