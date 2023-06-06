//
//  first_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/06/03.
//

import SwiftUI

struct first_View: View {
    //画面を閉じるために使う
    @Environment(\.dismiss) var dismiss
    //読み込む
    @Binding var my_name_main: String
    @Binding var post_name: [String]
    @Binding var lost_tag_list: [String]
    @Binding var post_tag: [String]
    //userenter
    @State private var name_enter = ""
    @State private var tag_1 = ""
    @State private var tag_2 = ""
    //erroralert
    @State private var error_alert = false
    @State var error_message = ""
    //回復キーalert
    @State private var recovery_key_alert = false
    @State private var recovery_key: [String] = ["","",""]
    let words = ["apple", "banana", "cat", "dog", "elephant", "fox", "giraffe", "horse", "igloo", "jaguar"]
    
    var body: some View {
        ZStack{
            Color.brown.ignoresSafeArea()
            VStack{
                HStack{
                    Text("TnrackFound\nようこそ").font(.system(size: 40)).fontWeight(.black).interactiveDismissDisabled()
                    Spacer()
                }.padding()
                Spacer()
                Image(systemName: "person.fill").font(.system(size: 50))
                Text("プロフィールを作成").font(.system(size: 30)).fontWeight(.black)
                VStack{
                    //名前
                    Text("名前を入力").font(.title).fontWeight(.black)
                    TextField("タップして名前を入力", text: $name_enter).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
                        .textFieldStyle(.plain)
                        .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                        .textContentType(.emailAddress)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding(.top, 15)
                        .padding(.bottom, 10)
                        .foregroundColor(.black)
                        .fontWeight(.black)
                    //タグ
                    Text("タグを決める").font(.title).fontWeight(.black)
                    HStack{
                        TextField("タグを入力", text: $tag_1).frame(width: 100,height: 50)
                            .textFieldStyle(.plain)
                            .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                            .textContentType(.emailAddress)
                            .cornerRadius(10)
                            .multilineTextAlignment(.center)
                            .padding(.top, 15)
                            .padding(.bottom, 10)
                            .foregroundColor(.black)
                            .fontWeight(.black)
                        TextField("タグを入力", text: $tag_2).frame(width: 100,height: 50)
                            .textFieldStyle(.plain)
                            .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                            .textContentType(.emailAddress)
                            .cornerRadius(10)
                            .multilineTextAlignment(.center)
                            .padding(.top, 15)
                            .padding(.bottom, 10)
                            .foregroundColor(.black)
                            .fontWeight(.black)
                    }.frame(width: 240, height: 100).background(Color.gray).cornerRadius(20)
                }
                .frame(width: 280, height: 400)
                .border(Color.gray, width: 10)
                .cornerRadius(20)
                Spacer()
                Button(action: {
                    if name_enter.isEmpty{
                        error_message = "名前を入力して下さい"
                        error_alert = true
                    }
                    else if tag_1.isEmpty || tag_2.isEmpty{
                        error_message = "タグを入力して下さい(2つ)"
                        error_alert = true
                    }
                    else{
                        //名前を登録
                        my_name_main = name_enter
                        post_name.append(name_enter)
                        UserDefaults.standard.set(my_name_main, forKey: "my_name_key")
                        //タグを登録
                        lost_tag_list.append(contentsOf: [tag_1, tag_2])
                        post_tag.append(contentsOf: [tag_1, tag_2])
                        UserDefaults.standard.set(lost_tag_list, forKey: "lost_tag_list_key")
                        //回復キーalert
                        recovery_key_alert = true
                        recovery_key.removeAll()
                        for _ in 0..<3 {
                            let randomWord = words.randomElement() ?? ""
                            recovery_key.append(randomWord)
                        }
                        UserDefaults.standard.set(recovery_key, forKey: "recovery_key")
                    }
                }) {
                    Text("登録").font(.largeTitle).fontWeight(.black)
                }
                .frame(width: 300, height: 30)
                .padding()
                .accentColor(Color.white)
                .background(Color.blue)
                .cornerRadius(26)
            }
        }
        .alert(isPresented: $error_alert) {
            Alert(title: Text("エラー"),message: Text("\(error_message)"))
        }
        .alert(isPresented: $recovery_key_alert) {
            Alert(title: Text("回復キー"),
                  message: Text("ユーザ認証をする時に名前を聞きます\nその名前を忘れた時にこの回復キーを入力しないといけません。\n忘れてしまうとアプリを初期化しないといけません。\n回復キー一覧\n\(recovery_key[0])\n\(recovery_key[1])\n\(recovery_key[2])"),
                  dismissButton: .default(Text("OK"),
                                          action: {dismiss()}))
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("閉じる") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            }
        }
    }
}

