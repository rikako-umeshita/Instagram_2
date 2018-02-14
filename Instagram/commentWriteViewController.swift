//
//  commentWriteViewController.swift
//  Instagram
//
//  Created by 梅下理香子 on 2018/02/06.
//  Copyright © 2018年 rikako.umeshita. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class commentWriteViewController: UIViewController {
    
    @IBOutlet weak var commentWriteTextField: UITextField!
    
    var postData: PostData!
  
    
    @IBAction func commentPostButton(_ sender: Any) {
        
        let commentName = Auth.auth().currentUser?.displayName ?? ""
        let text = commentWriteTextField.text!
        let commentDic = ["name": commentName, "text": text]
        
        postData.commentText.append(commentDic)
        
        // 増えたcommentをFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        postRef.updateChildValues(["comments":postData.commentText])
        
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }

       //キャンセルボタン
    @IBAction func commentCancelButton(_ sender: Any) {
        //画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
