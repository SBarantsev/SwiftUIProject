//
//  Post.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 28.09.2024.
//

import Foundation
import SwiftUI

struct Post {
    let id = UUID()
    let title: String
    let description: String
    let image: Image
}

struct PostData {
    static let posts: [Post] = [
        Post(
            title: "Начало",
            description: "О чем: талантливый вор сновидений берется за невыполнимое задание",
            image: Image("ПостерНачало")
        ),
        Post(
            title: "Сияние",
            description: "О чем: мрачная история смотрителя уединённого отеля, который сходит с ума",
            image: Image("ПостерСияние")
        ),
        Post(
            title: "Побег из Шоушенка",
            description: "О чем: история простого заключённого, который не потерял веру в свободу",
            image: Image("ПостерПобегИзШоушенко")
        ),
        Post(
            title: "Интерстеллар",
            description: "О чем: Мэтью МакКонахи спасает человечество через время и расстояния",
            image: Image("ПостерИнтерстеллар")
        ),
        Post(
            title: "Отель «Гранд Будапешт»",
            description: "О чем: приключения служащих отеля на фоне потрясающих пейзажей",
            image: Image("ОтельГрандБудапешт")
        )
    ]
}
