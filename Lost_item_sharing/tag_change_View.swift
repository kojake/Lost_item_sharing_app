//
//  tag_change_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/31.
//

import SwiftUI

struct tag_change_View: View {
    //画面を閉じる
    @Environment(\.dismiss) var dismiss
    @Binding var lost_tag_list: [String]
    //tag_change_alert
    @State private var tag_change_alert1 = false
    @State private var tag_change_alert2 = false
    @State var userInput = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.brown.ignoresSafeArea()
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
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "tag.fill").font(.largeTitle).fontWeight(.black)
                        Text("タグを変更").font(.system(size: 50)).fontWeight(.black)
                    }
                    Text("現在使用されているタグ").font(.title).fontWeight(.black)
                    VStack{
                        HStack{
                            VStack{
                                if !lost_tag_list.isEmpty {
                                    Text("\(lost_tag_list[0])").frame(width: 100, height: 70).font(.title).fontWeight(.black).background(Color.green).cornerRadius(20)
                                }
                                else{
                                    Text("").frame(width: 100, height: 70).font(.title).fontWeight(.black).background(Color.green).cornerRadius(20)
                                }
                                Button(action: {
                                    tag_change_alert1 = true
                                }) {
                                    Text("変更")
                                        .bold()
                                        .padding()
                                        .frame(width: 100, height: 50)
                                        .foregroundColor(Color.white)
                                        .background(Color.blue)
                                        .cornerRadius(25)
                                }
                            }
                            VStack{
                                if !lost_tag_list.isEmpty {
                                    Text("\(lost_tag_list[1])").frame(width: 100, height: 70).font(.title).fontWeight(.black).background(Color.green).cornerRadius(20)
                                }
                                else{
                                    Text("").frame(width: 100, height: 70).font(.title).fontWeight(.black).background(Color.green).cornerRadius(20)
                                }
                                Button(action: {
                                    tag_change_alert2 = true
                                }) {
                                    Text("変更")
                                        .bold()
                                        .padding()
                                        .frame(width: 100, height: 50)
                                        .foregroundColor(Color.white)
                                        .background(Color.blue)
                                        .cornerRadius(25)
                                }
                            }
                        }
                    }.frame(width: 350, height: 200).background(Color.white).cornerRadius(20)
                    Spacer()
                }
            }
        }.navigationBarBackButtonHidden(true)
        .alert("タグを変更", isPresented: $tag_change_alert1, actions: {
            TextField("タップして入力", text: $userInput)
            Button("変える", action: {
                if !lost_tag_list.isEmpty {
                    lost_tag_list[0] = userInput
                }
                else{
                    lost_tag_list[0] += userInput
                }
            })
            Button("キャンセル", role: .cancel, action: {})
        }, message: {
            Text("タグをを変更するならタップして入力をして下さい")
        })
        .alert("タグを変更", isPresented: $tag_change_alert2, actions: {
            TextField("タップして入力", text: $userInput)
            Button("変える", action: {
                lost_tag_list[1] = userInput
            })
            Button("キャンセル", role: .cancel, action: {})
        }, message: {
            Text("タグをを変更するならタップして入力をして下さい")
        })
    }
}

