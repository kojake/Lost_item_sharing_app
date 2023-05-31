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
    @State var my_name_main = "海斗"
    @State var my_photo = "share_app_men_icon"
    //タイムライン
    @State var post_name_main = post_name
    //タグ
    @State var lost_tag_list = post_tag
    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: my_profile_View(my_name: $my_name_main, my_photo: $my_photo, post_name_main: $post_name_main, lost_tag_list: $lost_tag_list), isActive: $showShould_my_profile_View){
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
                NavigationLink(destination: post_VIew(my_name: $my_name_main, post_name_main: $post_name_main), isActive: $showShould_post_View){
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
                HStack{
                    Text("忘れ物共有\n").font(.system(size: 35)).fontWeight(.black)
                    Spacer()
                    Button(action: {
                        showShould_my_profile_View = true
                    }){
                        Text("\(my_name_main)").font(.largeTitle).foregroundColor(Color.black)
                        Image("share_app_men_icon")
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
                    HStack{
                        Image(systemName: "tag.fill")
                        Text("\(lost_tag_list[0])")
                        .bold()
                        .padding()
                        .frame(width: 140, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        Text("\(lost_tag_list[1])")
                        .bold()
                        .padding()
                        .frame(width: 140, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                    }.frame(width: 430).foregroundColor(Color.white).font(.largeTitle).fontWeight(.black).background(Color.brown).cornerRadius(15)
                }
                ZStack{
                    List{
                        ForEach((0..<post_name.count).reversed(), id: \.self){index in
                            VStack{
                                NavigationLink(destination: content_View(select_list: Binding<String>(
                                    get: { post_name[index] },
                                    set: { post_name[index] = $0 }
                                ))){
                                    VStack{
                                        HStack{
                                            Text("\(post_name_main[index])").font(.title).fontWeight(.black)
                                            Text("さんからの\n忘れ物共有").fontWeight(.black).font(.title3)
                                            HStack{
                                                Image(systemName: "tag.fill").font(.system(size: 19))
                                                Text("\(post_tag[index])").fontWeight(.black).font(.title2)
                                            }.frame(width: 100, height: 50).background(Color.brown).cornerRadius(20).foregroundColor(Color.white)
                                        }
                                        Spacer()
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
