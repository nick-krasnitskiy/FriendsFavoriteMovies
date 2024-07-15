//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Nick Krasnitskiy on 15.07.2024.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            
            DatePicker("Reelase date", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle("Movie")
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}
