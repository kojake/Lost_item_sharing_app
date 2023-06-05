//
//  User_authentication_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/06/05.
//

import SwiftUI

struct User_authentication_View: View {
    //画面を閉じるために使う
    @Environment(\.dismiss) var dismiss
    //読み込む
    @Binding var my_name_main: String
    //userenter
    @State private var name_enter = ""
    //erroralert
    @State private var error_alert = false
    @State private var error_message = ""
    //回復key_arelt
    @State private var recovery_key_enter_alert = false
    @State private var alert_message = ""
    @State private var recovery_key_enter = ""
    
    var body: some View {
        ZStack{
            Color.brown.ignoresSafeArea()
            VStack{
                HStack{
                    Text("TnrackFound\nおかえりなさい").font(.system(size: 40)).fontWeight(.black).interactiveDismissDisabled()
                    Spacer()
                }.padding()
                Spacer()
                Image(systemName: "person.fill").font(.system(size: 50))
                Text("ユーザー認証").font(.system(size: 30)).fontWeight(.black)
                VStack{
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
                    }
                }
                .frame(width: 280, height: 200)
                .border(Color.gray, width: 10)
                .cornerRadius(20)
                
                Button(action: {
                    if name_enter.isEmpty{
                        error_message = "名前を入力して下さい"
                        error_alert = true
                    }
                    else if name_enter != my_name_main{
                        error_message = "名前が間違っています"
                        error_alert = true
                    }
                    else{
                        //一致したので画面を閉じる
                        dismiss()
                    }
                }) {
                    Text("決定").font(.largeTitle).fontWeight(.black)
                }
                .frame(width: 300, height: 30)
                .padding()
                .accentColor(Color.white)
                .background(Color.blue)
                .cornerRadius(26)
                
                Button(action: {
                    recovery_key_enter_alert = true
                }) {
                    Text("パスワードを忘れた").font(.largeTitle).fontWeight(.black)
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
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("閉じる") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            }
        }
        .alert("回復キーを入力", isPresented: $recovery_key_enter_alert, actions: {
            TextField("タップして入力", text: $recovery_key_enter)
            Button("変える", action: {
                let get_recovery_key = UserDefaults.standard.object(forKey: "recovery_key") as! [String]
                
                if get_recovery_key.contains(recovery_key_enter){
                    print("一致するものがある")
                }
                else{
                    print("一致しない")
                }
            })
            Button("キャンセル", role: .cancel, action: {})
        }, message: {
            Text("パスワードを忘れた場合は回復キーを入力して下さい")
        })
    }
}
