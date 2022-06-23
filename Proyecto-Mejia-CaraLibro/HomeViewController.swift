//
//  HomeViewController.swift
//  Proyecto-Mejia-CaraLibro
//
//  Created by user191222 on 6/22/22.
//  Copyright © 2022 user191222. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameUser: UILabel?
    @IBOutlet weak var lastnameUser: UILabel?
    
    @IBAction func closeSesion(_ sender: Any) {
            try? Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
    }
    
    private let db = Firestore.firestore()
    
    private var email: String
        
    
    init(email: String) {
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNameUser()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func getNameUser(){
        db.collection("users").document(email).getDocument { (documentSnapshot, error) in
            if let document = documentSnapshot, error == nil {
                if let name = document.get("name") as? String {
                    self.nameUser?.text = name
                }
                if let lastname = document.get("lastname") as? String {
                    self.lastnameUser?.text = lastname
                }
            }
        }
    }
    
    class func buildWithUserName (_ email: String) -> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController
        controller?.email = email
        return controller ?? HomeViewController(email: "String")
    }
}
