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
    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: my_profile_View(my_name: $my_name_main), isActive: $showShould_my_profile_View){
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
                NavigationLink(destination: post_VIew(), isActive: $showShould_post_View){
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
                                NavigationLink(destination: content_View(select_list: Binding<String>(
                                    get: { post_name[index] },
                                    set: { post_name[index] = $0 }
                                ))){
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
                                        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
