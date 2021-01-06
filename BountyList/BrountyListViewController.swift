//
//  BrountyListViewController.swift
//  BountyList
//
//  Created by Ji-hoon Ahn on 2021/01/03.
//

import UIKit

class BrountyListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    //MVVM
    
    //Model
    // - BountyInfo
    // - BountyInfo 만들자
    
    //View
    // - ListCell
    // > ListCell필요한 정보를 ViewModel 한테서 받아야겠다.
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
    
    //ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들고, 뷰 레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기,, BountyInfo 들
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty:33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 12000000)
    ]
    
//    let nameList = ["brook", "chopper", "franky","luffy" , "nami" ,"robin", "sanji","zoro"]
//    let bountyList = [33000000,50,44000000,300000000,16000000,8000000,7700000,120000000]
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
          //detailViewController데이터를 준다.
            if segue.identifier == "showDetail"{
                let vc = segue.destination as? DetailViewController
                if let index = sender as? Int{
                    
                let bountyInfo = bountyInfoList[index]
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]
                    vc?.bountyInfo = bountyInfo
          //          vc?.name = bountyInfo.name
            //        vc?.bounty = bountyInfo.bounty
                
                }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        // 기술 부채가 있다!
    // UITableViewDataSource에서
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return bountyInfoList.count
        }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        let bountyInfo = bountyInfoList[indexPath.row]
        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        return cell
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

struct BountyInfo {
    let name: String
    let bounty:Int
    
    var image: UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(name:String, bounty:Int) {
        self.name = name
        self.bounty = bounty
    }
}
