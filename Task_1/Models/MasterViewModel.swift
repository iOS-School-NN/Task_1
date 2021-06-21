//
//  MasterViewModel.swift
//  Task_1
//
//  Created by KirRealDev on 18.06.2021.
//

import Foundation

struct MasterViewModel {
    private let filmsData: [ItemModel] = [
        ItemModel(title: "Inception", imageName: "Inception", price: 10.838, myRating: 4.38, description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O."),
        ItemModel(title: "Green Mile", imageName: "GreenMile", price: nil, myRating: 4.5, description: "The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift."),
        ItemModel(title: "Cloud Atlas", imageName: "CloudAtlas", price: 14, myRating: 5.0, description: "An exploration of how the actions of individual lives impact one another in the past, present and future, as one soul is shaped from a killer into a hero, and an act of kindness ripples across centuries to inspire a revolution."),
        ItemModel(title: "Tenet", imageName: "Tenet", price: 13.43, myRating: 3.27, description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time."),
        ItemModel(title: "The Gentlemen", imageName: "TheGentlemen", price: 12.89, myRating: 3.815, description: "An American expat tries to sell off his highly profitable marijuana empire in London, triggering plots, schemes, bribery and blackmail in an attempt to steal his domain out from under him."),
        ItemModel(title: "The Matrix (1999)", imageName: "Matrix", price: 11.02, myRating: 4.19, description: "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth - the life he knows is the elaborate deception of an evil cyber-intelligence.")
    ]
    
    func getDataBy(index: Int) -> ItemModel {
        return filmsData[index]
    }
    func getCountOfFilms() -> Int {
        return filmsData.count
    }
    
}
