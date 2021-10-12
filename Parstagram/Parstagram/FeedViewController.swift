//
//  FeedViewController.swift
//  parstagram
//
//  Created by Laura Chang on 10/11/21.
//

import UIKit
import Parse
import Alamofire

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // creates as empty array
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    // After finish composing, want table view to refresh
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Posts")
        // otherwise would only have pointer to author
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { posts, Error in
            if posts !=  nil {
                self.posts = posts!
                self.posts = self.posts.reversed()
                self.tableView.reloadData()
            }
        }
        
        // so process is get query
        // store data
        // reload table view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // provides access to those outlets I created
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        // grab  particular post
        let post = posts[indexPath.row]
        
        let user = post["author"] as! PFUser
        cell.usernameLabel.text = user.username
        
        cell.captionLabel.text = post["caption"] as! String
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af_setImage(withURL: url)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
