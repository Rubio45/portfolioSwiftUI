//
//  PlanYourTrip.swift
//  guiaApp
//
//  Created by Alex Diaz on 11/8/24.
//

import SwiftUI


/// Es la pagina de entrada de la aplicacion, se podra ver informacion basica sobre la app.
/// El boton de inicio de sesion se encuentra en la parte inferior derecha de la vista.
struct OnboardingAppView: View {
    
    @State private var currentPage: Int = 0
    let pages: [OnboardingViewModel] = [
        OnboardingViewModel(title: "Plan Your Trip", description: "Save places and book your perfect trip with Nicaragua App", image: " ", buttonTitle: "Next"),
        OnboardingViewModel(title: "Begin The Adventure", description: "Begin your Experience with Nicaragua APP alone or your family & friends", image: " ", buttonTitle: "Next"),
        OnboardingViewModel(title: "Enjoy Your Trip", description: "Enjoy the Nicaragua App packages and stay relax", image: "", buttonTitle: "Get Started"),
    ]
    
    
    var body: some View {
        VStack {
            HStack {
                if currentPage > 0 {
                    Button {
                        if currentPage > 0 {
                            currentPage -= 1
                        } else if currentPage == 0 {
                            currentPage = 0
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.mainColor)
                            .bold()
                    }
                }
                Spacer()
                Button {
                    // TODO: PONER LA LOGICA para llevarlo a incio de sesion
                } label: {
                    Text("Skip")
                        .foregroundColor(.mainColor)
                }
            }
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 250, height: 250)
                .foregroundColor(.textFieldColor)
            
            PageView(pages: pages, currentPage: $currentPage)
            
            Spacer().frame(height: 50)
            Text(pages[currentPage].title)
                .font(.system(size: 32,weight: .bold, design: .rounded))
                .foregroundColor(.darkBlue)
            Text(pages[currentPage].description)
                .font(.system(size: 18,weight: .medium, design: .rounded))
                .foregroundColor(.darkBlue)
                .padding(10)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                if currentPage < pages.count - 1 {
                    currentPage += 1
                } else {
                    // TODO: PONER LA LOGICA para llevarlo a incio de sesion
                }
            } label: {
                Text(pages[currentPage].buttonTitle)
                    .foregroundStyle(.white)
                    .font(.system(size: 16, design: .rounded))
            }
            .defaultButtonStyle()
            
        }.padding()
            .animation(.bouncy, value: currentPage)
            .gesture(
                // MARK: HACIENDO QUE SE CAMBIE EL CONTENIDO CON GESTOS
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < -50 {
                            // deslizo a la izquierda
                            print("Swipe left")
                            withAnimation {
                                if currentPage < pages.count - 1 {
                                    currentPage += 1
                                }
                            }
                        } else if value.translation.width > 50 {
                            // deslizo a la derecha
                            print("Swipe right")
                            withAnimation {
                                if currentPage > 0 {
                                    currentPage -= 1
                                }
                            }
                            
                        }
                    }
            )
    }
}
#Preview {
    OnboardingAppView()
}


///My own page View selection
struct PageView: View {
    
    let pages: [OnboardingViewModel]
    
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(pages.indices, id: \.self) { index in
                if index == currentPage {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 20, height: 10)
                        .foregroundColor(.mainColor)
                } else {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.textFieldColor)
                }
                
            }
        }.padding(.top, 30)
    }
}
