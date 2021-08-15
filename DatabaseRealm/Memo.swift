//
//  Memo.swift
//  DatabaseRealm
//
//  Created by 河村大介 on 2021/08/16.
//

import Foundation
import RealmSwift

// Realmでデータベースに保存できる型を継承する
// データベースを扱う際は、データベースに保存するデータの型を用意すること！
class Memo: Object {
    // @objc dynamic は Realmを使う際に必ず必要な修飾子
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
}
