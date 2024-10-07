//
//  QuizView.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 27.09.2024.
//

import SwiftUI

struct QuizView: View {
    
//    @Binding var filmStore: FilmStore
//    @State var currentFilm: Film
        @StateObject var filmStore = FilmStore()
        @State private var currentFilm = FilmStore().films.randomElement()!
    @State private var options: [Film] = []
    @State private var selectedOptions: Film?
    @State private var isCorrect: Bool = false
    @State private var showAlert: Bool = false
    @State private var showNextQuestion: Bool = false
    
    
    var body: some View {
        VStack {
            currentFilm.image
                .resizable()
//                            .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .cornerRadius(10)
                .padding(50)
            
            ForEach(options, id: \.title) { option in
                Button(action: {
                    self.selectedOptions = option
                    self.checkAnswer()
                }) {
                    Text(option.title)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(self.isSelected(option) ? (self.isCorrect ? Color.green : Color.red) : Color.yellow)
                        .cornerRadius(10)
                }
            }
        }
        .onAppear {
            //            initializeCurrentFilm()
            self.generateOptions()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Видели ли вы этот фильм?"),
                  message: nil,
                  primaryButton: .default(Text("Да")) {
                self.currentFilm.isWatched = true
                if let index = filmStore.films.firstIndex(of: currentFilm) {
                    filmStore.films[index].isWatched = true
                }
                self.showNextQuestion = true
            }, secondaryButton: .cancel(Text("Нет")) {
                self.showNextQuestion = true
            })
        }
        .onChange(of: showNextQuestion) { value in
            if value {
                self.generateNewQuestion()
            }
        }
    }
    
    func checkAnswer() {
        if selectedOptions == currentFilm {
            isCorrect = true
            showAlert = true
        } else {
            isCorrect = false
        }
    }
    
    //    func initializeCurrentFilm() {
    //        if let randomFilm = filmStore.films.randomElement() {
    //            currentFilm = randomFilm
    //            generateOptions()
    //        } else {
    //            print("Ошибка: нет фильмов в коллекции")
    //        }
    //    }
    
    func generateNewQuestion() {
        let randomFilm = filmStore.films.randomElement()!
        currentFilm = randomFilm
        generateOptions()
        selectedOptions = nil
        isCorrect = false
        showNextQuestion = false
    }
    
    func isSelected(_ option: Film) -> Bool {
        return selectedOptions == option
    }
    
    func generateOptions() {
        var options: [Film] = []
        options.append(currentFilm)
        while options.count < 4 {
            let randomFilm = filmStore.films.randomElement()!
            if !options.contains(randomFilm) {
                options.append(randomFilm)
            }
        }
        self.options = options.shuffled()
    }
}

//struct HelloView_Previews: PreviewProvider {
//    static var previews: some View {
//        HelloView()
//    }
//}
