//
//  File.swift
//  
//
//  Created by Yago Teixeira on 20/07/22.
//

import UIKit

public class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    public override func loadView() {
        view = loginView
    }
    
    public override func viewDidLoad() {
        view.backgroundColor = .black
    }
}
