//
//  Data.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 28.09.2024.
//

import Foundation
import SwiftUI

struct Film: Equatable {
    let id = UUID()
    let title: String
    let description: String
    let image: Image
    var isWatched = false
}

class FilmStore: ObservableObject {
    @Published var films: [Film] = [
        Film(
            title: "Начало",
            description: "О чем: талантливый вор сновидений берется за невыполнимое задание",
            image: Image("ПостерНачало")
        ),
        Film(
            title: "Сияние",
            description: "О чем: мрачная история смотрителя уединённого отеля, который сходит с ума",
            image: Image("ПостерСияние")
        ),
        Film(
            title: "Побег из Шоушенка",
            description: "О чем: история простого заключённого, который не потерял веру в свободу",
            image: Image("ПостерПобегИзШоушенко")
        ),
        Film(
            title: "Интерстеллар",
            description: "О чем: Мэтью МакКонахи спасает человечество через время и расстояния",
            image: Image("ПостерИнтерстеллар")
        ),
        Film(
            title: "Отель «Гранд Будапешт»",
            description: "О чем: приключения служащих отеля на фоне потрясающих пейзажей",
            image: Image("ОтельГрандБудапешт")
        )
    ]
}
