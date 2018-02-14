//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 梅下理香子 on 2018/02/08.
//  Copyright © 2018年 rikako.umeshita. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    //コメントボタンの追加
    @IBOutlet weak var commentWriteButton: UIButton!
    //コメント表示欄の追加
    @IBOutlet weak var commentTextLabel: UILabel!
    
   // var commentsField = commentWrite
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dataLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
     //コメントに関する処理
        
        var commentText = ""
        for commentPost in postData.commentText {
            if let name = commentPost["name"], let text = commentPost["text"]{
                commentText += "\(name) : \(text) \n"
            }
        }
        commentTextLabel.text = commentText
    }
}
