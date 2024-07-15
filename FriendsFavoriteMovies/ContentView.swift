//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Nick Krasnitskiy on 15.07.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink {
                        MovieDetail(movie: movie)
                    } label: {
                        Text(movie.title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .navigationTitle("Movies")
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addMovie) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
        }
    }

    private func addMovie() {
        withAnimation {
            let newMovie = Movie(title: "New Movie", releaseDate: .now)
            modelContext.insert(newMovie)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
