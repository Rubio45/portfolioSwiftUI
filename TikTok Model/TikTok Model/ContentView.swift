//
//  ContentView.swift
//  TikTok Model
//
//  Created by Alex Diaz on 19/7/24.
//
import UIKit
import SwiftUI

struct ContentView: View {
    
    
    // variables de estado para el header
    @State private var isPressedExplore: Bool = true
    @State private var isPressedFollowing: Bool = false
    @State private var isPressedForYou: Bool = false
    
    //variables de estado para el texto
    @State private var isPressedMoreText: Bool = false
    
    //variable de estado para el footer
    @State private var isPressedHome: Bool = true
    @State private var isPressedFriend: Bool = false
    @State private var isPressedInbox: Bool = false
    @State private var isPressedProfile: Bool = false
    @State private var isPressedMore: Bool = false
    
    // variables de estado de la botonera derecha
    @State private var isPressedLike: Bool = false
    @State private var isPressedFavorite: Bool = false
    
    var body: some View {
        VStack{
            
            //Header de TikTok
            HStack(spacing: 15) {
                HeaderImageButton(image: "4k.tv.fill")
                Spacer().frame(width: 16)
                HeaderTextButton(isPressed: $isPressedExplore, title: "Explorar").onTapGesture {
                    changeStateExplore()
                }.animation(.easeInOut, value: isPressedExplore)
                HeaderTextButton(isPressed: $isPressedFollowing, title: "Siguiendo").onTapGesture {
                    changeStateFollowing()
                }.animation(.easeInOut, value: isPressedFollowing)
                HeaderTextButton(isPressed: $isPressedForYou, title: "Para ti").onTapGesture {
                    changeStateForYou()
                }.animation(.easeInOut, value: isPressedForYou)
                Spacer().frame(width: 16)
                HeaderImageButton(image: "magnifyingglass")
                
                
            }.frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)
                .padding(.horizontal, 2)
            Spacer()
            // Textos en la app
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading, spacing: 10) {
                    TitleAndDescriptionFooter(isPressedMoreText: $isPressedMoreText, title: "Ivancito 😎", description: """
                                              Milieruistas de la semana
                                              Hoy vamos a hablar sobre las mejores canciones
                                              """)
                }.frame(width: 250, alignment: .leading)
                Spacer()
                /// Botonera derecha de la app
                //TODO: Completar la botonera derecha
                VStack(alignment: .center, spacing: 20) {
                    ProfilePictureRightBar(image: "ivan")
                    HeartRightBar(isPressed: $isPressedLike, amountOfLikes: 147).onTapGesture {
                        isPressedLike.toggle()
                    }
                    // comentarios en la botonera derecha
                    CommentsRightBar()
                    
                    FavoritesRightBar(isPressed: $isPressedFavorite).onTapGesture {
                        isPressedFavorite.toggle()
                    }
                    //flecha de la barra
                    ShareRightBar()
                    MusicProfileRightBar(image: "jason")
                }
            }.padding(.horizontal, 7)
            
            /// footer de la app con todos los botones
            HStack(alignment: .center ,spacing: 30) {
                ButtonFooter(isPressed: $isPressedHome, nameFooterButton: "Inicio", imageFooterButton: "house")
                    .onTapGesture {
                        changeStateHome()
                    }
                ButtonFooter(isPressed: $isPressedFriend, nameFooterButton: "Amigos", imageFooterButton: "person.2")
                    .onTapGesture {
                        changeStateFriend()
                    }
                
                MoreButtonFooter(isPressed: $isPressedMore)
                    .onTapGesture {
                        self.isPressedMore = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            self.isPressedMore = false
                        }
                    }
                
                
                ButtonFooter(isPressed: $isPressedInbox, nameFooterButton: "Inbox", imageFooterButton: "tray")
                    .onTapGesture {
                        changeStateInbox()
                    }
                ButtonFooter(isPressed: $isPressedProfile, nameFooterButton: "Perfil", imageFooterButton: "person")
                    .onTapGesture {
                        changeStateProfile()
                    }
            }.padding(.top, 7)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.black)
            
                
        }.background(Image("fondo").resizable().scaledToFill().ignoresSafeArea())
        
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    ContentView()
}
extension ContentView {
    // Funciones privadas para cambiar el estado del header
    private func changeStateExplore() {
        isPressedExplore = true
        isPressedFollowing = false
        isPressedForYou = false
    }
    
    private func changeStateFollowing() {
        isPressedExplore = false
        isPressedFollowing = true
        isPressedForYou = false
    }
    
    private func changeStateForYou() {
        isPressedExplore = false
        isPressedFollowing = false
        isPressedForYou = true
    }
    
    // funciones privadas para cambiar el estado del header
    
    private func changeStateHome() {
        isPressedHome = true
        isPressedFriend = false
        isPressedInbox = false
        isPressedProfile = false
    }
    
    private func changeStateFriend() {
        isPressedHome = false
        isPressedFriend = true
        isPressedInbox = false
        isPressedProfile = false
    }
    
    private func changeStateInbox() {
        isPressedHome = false
        isPressedFriend = false
        isPressedInbox = true
        isPressedProfile = false
    }
    
    private func changeStateProfile() {
        isPressedHome = false
        isPressedFriend = false
        isPressedInbox = false
        isPressedProfile = true
    }
}

struct HeaderTextButton: View {
    
    @Binding var isPressed: Bool
    var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 18, weight: (isPressed ? .bold : .regular ),design: .rounded))
            .foregroundStyle(isPressed ? .white : .gray)
            .overlay{
                if isPressed {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 30,height: 2)
                        .offset(y: 13)
                }
            }
    }
}

struct HeaderImageButton: View {
    
    var image: String
    
    var body: some View {
        Image(systemName: image)
            .font(.system(size: 23))
            .foregroundStyle(.white)
    }
}
//Texto y descripcion en el texto
struct TitleAndDescriptionFooter: View {
    
    @Binding var isPressedMoreText: Bool
    
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 18, weight: .bold,design: .rounded))
                .foregroundStyle(.white)
            HStack {
                Text(description)
                    .font(.system(size: 14, weight: .regular,design: .rounded))
                    .foregroundStyle(.white)
                    .lineLimit(isPressedMoreText ? 5 : 2)
                Button {
                    isPressedMoreText.toggle()
                } label: { Text(isPressedMoreText ? "menos" : "más")
                        .font(.system(size: 14, weight: .bold,design: .rounded))
                        .foregroundStyle(.white)
                }
            }.animation(.easeInOut, value: isPressedMoreText)
        }
    }
}

// Botones del footer
struct ButtonFooter: View {
    
    @Binding var isPressed: Bool
    var nameFooterButton: String
    var imageFooterButton: String
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: isPressed ? imageFooterButton + ".fill" : imageFooterButton)
                .font(.system(size: 23))
                .foregroundStyle(isPressed ? .white : .gray)
            Text(nameFooterButton)
                .font(.system(size: 14, weight: .bold,design: .rounded))
                .foregroundStyle(isPressed ? .white : .gray)
                .lineLimit(1)
        }.animation(.easeInOut, value: isPressed)
    }
}


// Boton de MAS en el footer
struct MoreButtonFooter: View {
    
    @Binding var isPressed: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.cyan)
                .frame(width: isPressed ? 50 : 40, height: isPressed ? 40 : 30)
                .offset(x: 5, y: 0)
            RoundedRectangle(cornerRadius: 10)
                .fill(.red)
                .frame(width: isPressed ? 50 : 40, height: isPressed ? 40 : 30)
                .offset(x: -5, y: 0)
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: isPressed ? 50 : 40, height: isPressed ? 40 : 30)
            Image(systemName: "plus")
        }.animation(.spring, value: isPressed)
        .frame(width: 60)
    }
}

struct ProfilePictureRightBar: View {
    
    var image: String
    var body: some View {
        
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 1)
            }
            .overlay {
                Circle().fill(.pink)
                    .frame(width: 23, height: 23)
                    .offset(x: 0, y: 30)
                    .overlay {
                        Image(systemName: "plus")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                            .offset(x: 0, y: 30)
                    }
            }
    }
}

struct HeartRightBar: View {
    
    @Binding var isPressed: Bool
    var amountOfLikes: Int
    
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundStyle(isPressed ? .pink : .white)
                .scaleEffect(isPressed ? 1.0 : 0.9)
                .animation(.spring, value: isPressed)
            Text("\(amountOfLikes) mil")
                .font(.system(size: 14, weight: .bold,design: .rounded))
                .foregroundStyle(.white)
        }
    }
}

struct CommentsRightBar: View {
    var body: some View {
        VStack {
            Image(systemName: "ellipsis.message.fill")
                .font(.system(size: 40))
                .foregroundStyle(.white)
                .scaleEffect(0.9)
            Text("2 mil")
                .font(.system(size: 14, weight: .bold,design: .rounded))
                .foregroundStyle(.white)
        }
    }
}

struct ShareRightBar: View {
    var body: some View {
        VStack {
            Image(systemName: "arrowshape.turn.up.forward.fill")
                .font(.system(size: 40))
                .foregroundStyle(.white)
                .scaleEffect(0.9)
            Text("1,4 mil")
                .font(.system(size: 14, weight: .bold,design: .rounded))
                .foregroundStyle(.white)
        }
    }
}

struct FavoritesRightBar: View {
    
    @Binding var isPressed: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "bookmark.fill")
                .font(.system(size: 40))
                .foregroundStyle(isPressed ? .yellow : .white)
                .scaleEffect(isPressed ? 1.0 : 0.9)
                .animation(.spring, value: isPressed)
            Text("192,4 mil")
                .font(.system(size: 14, weight: .bold,design: .rounded))
                .foregroundStyle(.white)
        }
    }
}


struct MusicProfileRightBar: View {
    
    var image: String
    var body: some View {
        
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
    }
}
