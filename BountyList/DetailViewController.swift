//
//  DetailViewController.swift
//  BountyList
//
//  Created by Ji-hoon Ahn on 2021/01/04.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MVVM
    
    //Model
    // - BountyInfo
    // - BountyInfo 만들자
    
    //View
    // - imgView,  nameLabel, bountyLabel
    // > view 들은 viewModel를 통해서 구성되기 ?

    //ViewModel
    // - DetailViewModel
    // > 뷰 레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기,, BountyInfo 들
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var bountyLabel : UILabel!

    //var name:String?
    //var bounty: Int?
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        if let bountyInfo = self.viewModel.bountyInfo{
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
//        if let name = self.name,let bounty = self.bounty{
//            let img = UIImage(named: "\(name).jpg")
//            imgView.image = img
//            nameLabel.text = name
//            bountyLabel.text = "\(bounty)"
//        }
//    }
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
        
}
class DetailViewModel{
    var bountyInfo: BountyInfo?
    func update(model: BountyInfo?){
        bountyInfo = model
    }
}
