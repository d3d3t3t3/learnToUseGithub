//
//  ViewController.swift
//  ServerImageDownloadButton
//
//  Created by S e on 2023/02/06.
//

import UIKit

///-  예전방식: 서버에 있는 이미지 다운로드해서 보여주기
///- 유알엘두기, 리절트업유알엘언유즛 워닝뜨면, 유알엘 둘 데 쓰기
///- 그다음엔 데이타로 받아서 이미지를 보여주는걸 쓰자, 이럼 데이타를 둘 곳을 마련해 둬야지
///- 다운로딧데이타를 어찌받지? 메소드가 있나? 이게 유알엘세션 클래스, 데이타태스크 펑션이네, 이걸 어찌 쓰나? 어짜든, 데이타태스크를 리줌해주면, 에러뜨거나 데이타가 받아지네.
///- 근데 서버에서 데이타를 받는 메소드를 돌려주자, 태스크를 엑스큐션하는 디스패치퀴쓰고 메인쓰레드를 어싱크하자, 메인쓰레드를 따로하자
///- 태스크리줌을 써주니 콘솔에 성공 프린트는 돼는데 그림은 아직 안뜸, 그림파일주소유알엘에 파일이름이 틀림, 근데 바이트는 나옴
///- 유알엘세션에 디폴트타입으로 데이타태스크를 유알엘에서 데이타 다운로드 엑스큐션하기
///- 태스크꾸리기
///- 클로져써서, 에러나면 에러프린트하고, 아님, 이미지보여주기

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(systemName: "clock")
    }
    

    @IBAction func btnDownload(_ sender: UIButton) {
        let url = URL(string: "https://zeushahn.github.io/Test/images/dog.jpg")
        let defaultURLSession = Foundation.URLSession(configuration: .default)
//        print("defaultSession :\(defaultSession)")
        let dataTask = defaultURLSession.dataTask(with: url!){(downloadedData, response, error) in
            if error != nil{
                print("Fail")
            }else{
                print("Sucess : \(downloadedData!)")
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: downloadedData!)
                }//async
            }//else
        }//closer
        dataTask.resume()
    }
}//ViewController

