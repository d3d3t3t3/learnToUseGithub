//
//  ViewController.swift
//  ServerImageDownloadButton01
//
//  Created by S e on 2023/02/06.
//

import UIKit

///-  최신식: 서버에 있는 이미지 다운로드해서 보여주기
///- 유알엘두기, 리절트업유알엘언유즛 워닝뜨면, 유알엘 둘 데 쓰기
///- 디스패치퀴메인어싱크에다 다운받은 데이타로 이미지보여주기
///- 데이타가 없으니, 또 디스패치퀴글로벌어싱크로 데이타내려받긴데, 있는 유알엘 컨텐츠를 데이타로 트라이해서 받기
///- 클로져속 뷰컨트롤에 이미지뷰라고 밝히기

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(systemName: "clock")
    }
    

    @IBAction func btnDownload(_ sender: UIButton) {
        let urlForData = URL(string: "https://zeushahn.github.io/Test/images/dog.jpg")
        DispatchQueue.global().async {
            let dataForUIImage = try? Data(contentsOf: urlForData!)
            DispatchQueue.main.async {
                self.imgView.image = UIImage(data: dataForUIImage!)
            }
        }
        
    }
}//ViewController

