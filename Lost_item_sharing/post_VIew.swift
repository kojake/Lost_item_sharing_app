//
//  post_VIew.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/29.
//

import SwiftUI

struct post_VIew: View {
    @Binding var my_name: String
    @Binding var post_name_main: [String]
    @Binding var post_tag: [String]
    //画面を閉じるために使う
    @Environment(\.dismiss) var dismiss
    //設定とプレビュー
    private let stapleFoods = ["本文", "プレビュー"]
    @State private var selectedIndex = 0
    //本文の詳細
    @State private var title = ""
    @State private var content = ""
    @State private var tag = ""
    //タグ選択
    @State private var selectedValue: String = ""
    //error_alert
    @State private var error_alert = false
    @State var alert_message = ""
    //写真を選択
    @State private var image: UIImage? = nil
    
    var body: some View {
        NavigationView{
            VStack{
                GeometryReader { geometry in
                    Picker("", selection: self.$selectedIndex) {
                        ForEach(0..<self.stapleFoods.count) { index in
                            Text(self.stapleFoods[index])
                                .tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 380)
                }
                if selectedIndex == 0{
                    VStack{
                        HStack{
                            VStack{
                                Button(action: {
                                    dismiss()
                                }) {
                                    Text("戻る")
                                }
                                .padding()
                                .accentColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(26)
                            }
                            TextField("タップしてタイトルを入力", text: $title).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
                                .textFieldStyle(.plain)
                                .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                                .textContentType(.emailAddress)
                                .cornerRadius(10)
                                .multilineTextAlignment(.center)
                                .padding(.top, 15)
                                .padding(.bottom, 10)
                                .foregroundColor(.black)
                                .fontWeight(.black)
                        }
                        ZStack{
                            TextEditor(text: $content)
                                .frame(height: 350)
                                .padding()
                                .border(Color.gray, width: 1)
                            VStack{
                                Spacer()
                                HStack{
                                    Spacer()
                                    HStack{
                                        Image(systemName: "tag.fill").foregroundColor(Color.white)
                                        TextField("タグを入力", text: $tag).frame(width: 200, height: 40)
                                            .textFieldStyle(.plain)
                                            .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                                            .textContentType(.emailAddress)
                                            .cornerRadius(10)
                                            .multilineTextAlignment(.center)
                                            .padding(.top, 15)
                                            .padding(.bottom, 10)
                                            .foregroundColor(.black)
                                            .fontWeight(.black)
                                        Picker(selection: $selectedValue, label: Text("タグを選択"), content: {
                                            ForEach(post_tag, id:\.self) { value in
                                                Text("\(value)")
                                                    .tag(value).font(.title).fontWeight(.black)
                                            }
                                        }).frame(width: 50, height: 40).cornerRadius(20).background(Color.white)
                                        Spacer()
                                    }.frame(width: 300, height: 50).background(Color.brown).cornerRadius(20)
                                }
                                Button(action: {
                                    //抜けているところがないか確認する
                                    if title == ""{
                                        alert_message = "タイトルをつけて下さい"
                                        error_alert = true
                                    }
                                    else if content == ""{
                                        alert_message = "内容を入力して下さい"
                                        error_alert = true
                                    }
                                    else if selectedValue == "" && tag.isEmpty{
                                        alert_message = "タグをつけて下さい"
                                        error_alert = true
                                    }
                                    else{
                                        post_title.append(title)
                                        post_content.append(content)
                                        post_name.append(my_name)
                                        post_name_main.append(my_name)
                                        if tag.isEmpty{
                                            post_tag.append(selectedValue)
                                        }
                                        else{
                                            post_tag.append(tag)
                                        }
                                        dismiss()
                                    }
                                }) {
                                    Text("投稿").frame(width: 350,height: 20)
                                }
                                .padding()
                                .accentColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(26)
                                .frame(width: 350,height: 60)
                            }
                        }
                        Spacer()
                    }
                }
                else{
                    VStack{
                        Text("\(title)").font(.system(size: 50)).fontWeight(.black)
                        VStack{
                            Text("\(content)").font(.system(size: 20)).fontWeight(.black)
                        }
                        .frame(width: 350, height: 400)
                        .padding()
                        .border(Color.gray, width: 1)
                        Spacer()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("閉じる") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
            .alert(isPresented: $error_alert) {
                Alert(title: Text("エラー"),
                      message: Text(alert_message))   // 詳細メッセージの追加
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}
