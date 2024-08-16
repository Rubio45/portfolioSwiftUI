//
//  SwipeStackPlacesView.swift
//  guiaApp
//
//  Created by Alex Diaz on 12/8/24.
//

import SwiftUI

struct SwipeStackPlacesView: View {
    
    @GestureState private var dragState = DragState.inactive
    private let dragThreshold: CGFloat = 70.0
    @State private var isPresentingDetails: Bool = false
    @State private var lastCardIndex: Int = 1
    @State private var finalTransition = AnyTransition.leadingBottom
    @State private var selectedCardView: PlacesCardView? = nil
    @State var cardViews: [PlacesCardView] = {
        var views = [PlacesCardView]()
        for index in 0..<2 {
            views.append(PlacesCardView(image: places[index].image, name: places[index].name, city: places[index].city))
        }
        return views
    }()
    
    private func moveCard() {
        // Eliminar la primera tarjeta
        withAnimation {
            cardViews.removeFirst()
        }
        lastCardIndex += 1
        // lastCardIndex % places.count es para no pasarse y no reviente, sino que vuelva al principio. Hago un bucle infinito
        let place = places[lastCardIndex % places.count]
        // Crear una nueva tarjeta
        let newCardView = PlacesCardView(image: place.image, name: place.name, city: place.city)
        // Meter otra tarjeta luego de eliminar la primera
        cardViews.append(newCardView)
    }
    
    var body: some View {
        VStack {
            TopBarSwipeStackView()
                .opacity(self.dragState.isDragging ? 0 : 1)
                .animation(.easeInOut, value: self.dragState.isDragging)
            Spacer(minLength: 30)
            ZStack {
                ForEach(self.cardViews) { cardView in
                    
                    let isTopCard = self.isTopCardView(cardView: cardView)
                    
                    cardView
                        .zIndex(isTopCard ? 1 : 0)
                        .overlay {
                            if isTopCard {
                                ZStack {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.green)
                                        .font(.system(size: 120))
                                        .opacity(self.dragState.translation.width < self.dragThreshold ? 0 : 1)
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.red)
                                        .font(.system(size: 120))
                                        .opacity(self.dragState.translation.width < -self.dragThreshold ? 1 : 0)
                                    Image(systemName: "doc.plaintext.fill")
                                        .foregroundStyle(Color.mainColor)
                                        .font(.system(size: 120))
                                        .opacity(self.dragState.translation.height < -self.dragThreshold - 200 ? 1 : 0)
                                }
                            }
                        }
                        .offset(x: isTopCard ? self.dragState.translation.width : 0, y: isTopCard ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && isTopCard ? 0.95 : 1)
                        .rotationEffect(isTopCard ? Angle(degrees: Double(self.dragState.translation.width / 20)) : Angle(degrees: 0))
                        .transition(self.finalTransition)
                        .animation(.interpolatingSpring(stiffness: 200.0, damping: 100), value: self.dragState.translation)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.05)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { (value, state, transaction) in
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else { return }
                                    // Hacer las transiciones dependiendo de la posición del drag
                                    if drag.translation.width < -self.dragThreshold {
                                        self.finalTransition = .trailingBottom
                                    } else if drag.translation.width > self.dragThreshold {
                                        self.finalTransition = .leadingBottom
                                    } else if drag.translation.height < -self.dragThreshold {
                                        self.finalTransition = .topBottom
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else { return }
                                    if drag.translation.width < -self.dragThreshold || drag.translation.width > self.dragThreshold {
                                        self.moveCard()
                                    } else if drag.translation.height < -self.dragThreshold {
                                        self.selectedCardView = cardView
                                        self.isPresentingDetails.toggle()
                                    }
                                })
                        )
                }
            }
            Spacer(minLength: 30)
            BottomBarSwipeStackView(rejectCard: {
                self.finalTransition = .leading
                self.moveCard()
            }, approveCard: {
                self.finalTransition = .trailing
                self.moveCard()
            })
            .opacity(self.dragState.isDragging ? 0 : 1)
            .animation(.easeInOut, value: self.dragState.isDragging)
        }
        .padding(28)
        .sheet(isPresented: $isPresentingDetails) {
            VStack {
                if let cardView = self.selectedCardView {
                    Image(cardView.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .cornerRadius(10)
                    Spacer(minLength: 20)
                    Text(cardView.name)
                        .bold()
                    Text(cardView.city)
                    Spacer()
                } else {
                    Text("No card selected")
                }
            }
            .presentationDetents([.medium, .large])
        }
    }
    
    private func isTopCardView(cardView: PlacesCardView) -> Bool {
        guard let index = self.cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
}

#Preview {
    SwipeStackPlacesView()
}

struct TopBarSwipeStackView: View {
    
    var body: some View {
        HStack {
            Button {
                //TODO: VOLVER A LA VISTA PRINCIPAL
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.grayOwnColor)
                    .bold()
                    .font(.system(size: 30))
            }
            Spacer()
            Button {
                //TODO: Acción para el botón del centro
            } label: {
                Image(systemName: "doc.plaintext.fill")
                    .foregroundColor(.mainColor)
                    .bold()
                    .font(.system(size: 35))
            }
            Spacer()
            Button {
                //TODO: IMPLEMENTAR LA VISTA DE BUSCAR
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                    .foregroundColor(.grayOwnColor)
                    .bold()
                    .font(.system(size: 30))
            }
        }
    }
}

struct PlacesCardView: View, Identifiable {
    
    var id = UUID()
    var image: String
    var name: String
    var city: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 20)
            .overlay(
                Text("\(name), \(city)")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.darkBlue.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(x: 0, y: 230)
            )
    }
}

struct BottomBarSwipeStackView: View {
    
    let rejectCard: () -> Void
    let approveCard: () -> Void
    
    var body: some View {
        HStack {
            // Botón para descartar un lugar
            Button {
                rejectCard()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.red)
                    .bold()
                    .font(.system(size: 30))
            }
            Spacer()
            Button {
                //TODO: Ver detalles del lugar. Saldra un modal de aqui.
            } label: {
                Image(systemName: "square.and.arrow.up.fill")
                    .foregroundColor(.mainColor)
                    .bold()
                    .font(.system(size: 35))
            }
            Spacer()
            Button {
                approveCard()
            } label: {
                Image(systemName: "checkmark")
                    .foregroundStyle(.green)
                    .bold()
                    .font(.system(size: 30))
            }
        }
    }
}

struct Places: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var city: String
}

let places = [
    Places(image: "masaya", name: "Masaya", city: "Nicaragua"),
    Places(image: "somoto", name: "Somoto Canyon", city: "Nicaragua"),
    Places(image: "ojo", name: "Ojo de Agua", city: "Nicaragua"),
]

extension AnyTransition {
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: .move(edge: .bottom).combined(with: .move(edge: .leading)))
    }
    
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: .move(edge: .bottom).combined(with: .move(edge: .trailing)))
    }
    
    static var topBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: .move(edge: .bottom).combined(with: .move(edge: .top)))
    }
    
    static var leading: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: .move(edge: .leading))
    }
    
    static var trailing: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: .move(edge: .trailing))
    }
}
