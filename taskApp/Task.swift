//
//  Task.swift
//  taskApp
//
//  Created by ICHIRO KAWATA on 2018/06/28.
//  Copyright © 2018年 ICHIRO KAWATA. All rights reserved.
//

import RealmSwift

class Task: Object {
    //管理用　ID,プラマリーキー
    @objc dynamic var id = 0
    
    //カテゴリ
    @objc dynamic var category = ""
    
    //タイトル
    @objc dynamic var title = ""
    
    //内容
    @objc dynamic var contents = ""
    
    //日時
    @objc dynamic var date = Date()
    
    /**
     idをプライマリーキーとして設定
 */
    override static func primaryKey() -> String?{
        return "id"
    }
}
