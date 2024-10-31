//
//  ContentView.swift
//  ExpandablePlayer
//
//  Created by Alex Diaz on 31/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var dragOffset: CGFloat = 0
    @State var lastDragPosition: CGFloat = 0
    @State var opacity: Double = 0
    var opacity2: Double {
        show ? max( 1 - Double(dragOffset) / 1000 , 0) : min(Double(dragOffset) / 50000, 1)
    }
    
    var body: some View {
        GeometryReader { parent in
            ZStack {
                Group {
                    ZStack(alignment: .trailing) {
                        ImageView(dragOffset: dragOffset, show: show, geo: parent.size)
                    }
                }
                .padding(.top, show ? parent.size.height / 2 - 300 - dragOffset / 8 : 10 + dragOffset / 6)
                .padding(.leading, show ? 0 : max(10 - dragOffset, 10))
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: show ? .infinity : 70 + dragOffset)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: show ? max(40 - dragOffset / 10, 12) : min(12 + dragOffset / 10, 40)))
        .offset(y: show ? dragOffset : 0)
        .gesture(
            DragGesture()
                .onChanged { value in
                    let dragChange = value.translation.height / 2
                    lastDragPosition = value.translation.height
                    
                    if show {
                        withAnimation(.smooth) {
                            dragOffset = dragChange * 2 // to make it faster
                            dragOffset = max(0, dragOffset)
                        }
                    } else {
                        dragOffset -= dragChange
                        dragOffset = max(0, dragOffset)
                    }
                }
                .onEnded({ _ in
                    lastDragPosition = 0
                    if show && dragOffset > 50 {
                        withAnimation(.smooth) {
                            show = false
                        }
                    } else if !show && dragOffset > 50 {
                        withAnimation(.smooth) {
                            show = true
                        }
                    }
                    
                    withAnimation(.spring) {
                        dragOffset = 0
                    }
                })
        )
        .animation(.spring, value: show)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(show ? min(dragOffset / 20, 30): 30 - min (dragOffset / 20 , 30))
        .ignoresSafeArea()
    }
}


#Preview {
    ContentView()
}

struct ImageView: View {
    var dragOffset: CGFloat
    var show: Bool
    var geo: CGSize
    
    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .scaledToFill()
            .frame(
                width: show ? max ( 250 - dragOffset / 4 , 50) : min(50 + dragOffset / 4, 250),
                height: show ? max ( 250 - dragOffset / 4 , 50) : min(50 + dragOffset / 4, 250)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.trailing, show ? 0 + dragOffset / 3 : max(geo.width - dragOffset / 2, geo.width / 10))
    }
}
