//
//  SampleEditPickModel.swift
//  Peekabook
//
//  Created by devxsby on 2023/01/06.
//

import UIKit

struct SampleEditPickModel {
//    var bookId: Int // 서버 연결 시 사용하려고 미리 넣어놓았습니다.
    var bookImage: UIImage
    var countLabel: Int
}

extension SampleEditPickModel {
    static var data: [SampleEditPickModel] {
        return [
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book1!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book2!, countLabel: 1),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book3!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book4!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book5!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book1!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book2!, countLabel: 3),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book3!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book4!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book5!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book1!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book2!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book3!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book4!, countLabel: 2),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book5!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book1!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book2!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book3!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book4!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book5!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book1!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book2!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book3!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book4!, countLabel: 0),
            SampleEditPickModel(bookImage: ImageLiterals.Sample.book5!, countLabel: 0)
        ]
    }
}
