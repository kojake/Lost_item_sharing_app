//
//  my_profile_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/28.
//

import SwiftUI

struct my_profile_View: View {
    //画面を閉じる
    @Environment(\.dismiss) var dismiss
    //名前変更アラート
    @State private var name_change_alert = false
    @State private var userInput = ""
    @Binding var my_name: String
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button(action: {
                        dismiss()
                    }) {
                        Text("戻る")
                            .bold()
                            .padding()
                            .frame(width: 100, height: 50)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25)
                    }
                    Spacer()
                    Text("自分のプロフィール").font(.system(size: 30)).fontWeight(.black)
                }
                Image("")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 75).stroke(Color.black, lineWidth: 4))
                Text("\(my_name)").font(.system(size: 35)).fontWeight(.black)
                Spacer()
                Text("_____________________________").font(.title2).fontWeight(.black)
                HStack{
                    ZStack{
                        VStack{
                            Text("自分が無くしたり\n忘れた物").font(.title2).fontWeight(.black)
                            List{
                                Text("カバン")
                                Text("財布")
                            }
                        }
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                Button(action: {
                                    print("Button")
                                }) {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .padding()
                                        .frame(width: 50, height: 50)
                                        .imageScale(.large)
                                        .foregroundColor(Color.white)
                                        .background(Color.green)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                    VStack{
                        Text("自分の\nプロフィール\n変更").font(.title).fontWeight(.black)
                        //な目を変更
                        Button(action: {
                            name_change_alert = true
                        }) {
                            Text("名前を変更")
                        }
                        .padding()
                        .accentColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(26)
                        .shadow(radius: 20)
                        .frame(width: 160, height: 100)
                        //アイコン変更
                        Button(action: {
                            
                        }) {
                            Text("アイコンを変更")
                        }
                        .padding()
                        .accentColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(26)
                        .shadow(radius: 20)
                        .frame(width: 160, height: 100)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
            .alert("名前を変更", isPresented: $name_change_alert, actions: {
                TextField("Username", text: $userInput)
                Button("変える", action: {
                    my_name = userInput
                })
                Button("Cancel", role: .cancel, action: {})
            }, message: {
                Text("名前を変更するならタップして入力をして下さい")
            })
    }
}
