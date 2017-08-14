//
//  ViewController.swift
//  BHS-Admin
//
//  Created by Ayush Tanna on 11/07/17.
//  Copyright © 2017 Ayush Tanna. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UITableViewController {
    
    let cellId = "cellID"
    
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Comments"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(getter: tableView))
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            handleLogout()
            
        }
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        
        fetchUser()
        
    }
    
    func fetchUser() {
        FIRDatabase.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as?[String: AnyObject] {
                let user = User()
                user.setValuesForKeys(dictionary)
                
                self.users.append(user)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                

            }

        }, withCancel: nil)
    }

    func handleLogout () {
        do{
            
            try FIRAuth.auth()?.signOut()
            
        } catch let logoutError {
            print(logoutError)
        }
                let loginController = LogoutController()
        present(loginController, animated: true, completion: nil)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int  {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        cell.detailTextLabel?.text = user.suggestion
        
        return cell
        
    }

}

class UserCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
//        var delete = UITableViewRowAction(style: .Normal, title: "Delete", handler: { (action:UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
//            
//            self.tableView.dele
//        })
//    }
}

