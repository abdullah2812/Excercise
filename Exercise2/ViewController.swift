//
//  ViewController.swift
//  Exercise2
//
//  Created by Irianda on 12/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UILabel!
    
    @IBOutlet weak var btnlogin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btnlogin.layer.cornerRadius = 10
        btnlogin.clipsToBounds = true
    }
    
    //untuk light Bar Style IOS
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }

}

