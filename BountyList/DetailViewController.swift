//
//  DetailViewController.swift
//  BountyList
//
//  Created by Ji-hoon Ahn on 2021/01/04.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var bountyLabel : UILabel!

    var name:String?
    var bounty: Int?
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
          
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateUI(){
        
        if let name = self.name,let bounty = self.bounty{
            let img = UIImage(named:"\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }

   
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
