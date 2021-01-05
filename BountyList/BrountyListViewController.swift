//
//  BrountyListViewController.swift
//  BountyList
//
//  Created by Ji-hoon Ahn on 2021/01/03.
//

import UIKit

class BrountyListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    let nameList = ["brook", "chopper", "franky","luffy" , "nami" ,"robin", "sanji","zoro"]
    let bountyList = [33000000,50,44000000,300000000,16000000,8000000,7700000,120000000]
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
          //detailViewController데이터를 준다.
            if segue.identifier == "showDetail"{
                let vc = segue.destination as? DetailViewController
                if let index = sender as? Int{
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // UITableViewDataSource에서
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return bountyList.count
        }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"

        return cell
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
//            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//            cell.imgView.image = img
//            cell.nameLabel.text = nameList[indexPath.row]
//            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
//            return cell
//        }else{
//            return UITableViewCell()
//        }
    }
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("---> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}


class ListCell : UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var bountyLabel : UILabel!
}
