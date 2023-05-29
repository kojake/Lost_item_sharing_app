//
//  ContentView.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/28.
//

import SwiftUI

struct ContentView: View {
    //画面遷移用
    @State private var showShould_my_profile_View = false
    @State private var showShould_post_View = false
    @State private var showShould_content_View = false
    //自分の名前
    @State var my_name_main = ""
    //リスト選択
    @State var select_list = 0
    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: my_profile_View(my_name: $my_name_main), isActive: $showShould_my_profile_View){
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
                NavigationLink(destination: post_VIew(), isActive: $showShould_post_View){
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
                NavigationLink(destination: content_View(select_list: $select_list), isActive: $showShould_post_View){
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
                HStack{
                    Text("忘れ物共有\n").font(.system(size: 35)).fontWeight(.black)
                    Spacer()
                    Button(action: {
                        showShould_my_profile_View = true
                    }){
                        Text("\(my_name_main)").font(.largeTitle).foregroundColor(Color.black)
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
                ZStack{
                    List{
                        ForEach(0..<post_name.count, id: \.self){index in
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
                                            Text("\(post_name[index])").font(.title).fontWeight(.black)
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
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Button(action: {
                                showShould_post_View = true
                            }) {
                                Text("投稿する")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .padding()
                                    .frame(width: 150, height: 70)
                                    .foregroundColor(Color.white)
                                    .background(Color.blue)
                                    .cornerRadius(25)
                            }
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
