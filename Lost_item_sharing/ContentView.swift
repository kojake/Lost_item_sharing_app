//
//  ContentView.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/28.
//

import SwiftUI

struct ContentView: View {
    @State var my_name = "hoge"
    
    var body: some View {
        VStack {
            HStack{
                Text("忘れ物共有\n").font(.system(size: 35)).fontWeight(.black)
                Spacer()
                Button(action: {
                    
                }){
                    Text("\(my_name)").font(.largeTitle).foregroundColor(Color.black)
                    Image("")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .cornerRadius(75)
                        .overlay(
                            RoundedRectangle(cornerRadius: 75).stroke(Color.black, lineWidth: 4))
                }
            }
            Spacer()
            HStack{
                Text("タイムライン").font(.title).fontWeight(.black)
                Image(systemName: "clock.fill").resizable().scaledToFit().frame(width: 40,height: 40).foregroundColor(Color.green)
            }
            List{
                VStack{
                    HStack{
                        Image("")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .cornerRadius(75)
                            .overlay(
                                RoundedRectangle(cornerRadius: 75).stroke(Color.black, lineWidth: 4))
                        VStack{
                            HStack{
                                Text("\(my_name)").font(.title).fontWeight(.black)
                                Text("さんからの\n忘れ物共有").fontWeight(.black).font(.title3)
                            }
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Text("確認する")
                            }
                            .buttonStyle(ArrowButtonStyle())
                        }
                        
                    }
                }
            }
        }
    }
}

//buttondesign
struct ArrowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 28, weight:.bold, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal,50)
            .padding(5)
            .background(
                ArrowShape()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.green, Color.blue.opacity(0.4)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)))
            .shadow(color:.black, radius: configuration.isPressed ? 2 : 4)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        let xOffset = rect.size.width * 0.07
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width - xOffset, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height / 2))
        path.addLine(to: CGPoint(x: rect.size.width - xOffset, y: rect.size.height))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        path.addLine(to: CGPoint(x: xOffset, y: rect.size.height / 2))
        path.closeSubpath()
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
