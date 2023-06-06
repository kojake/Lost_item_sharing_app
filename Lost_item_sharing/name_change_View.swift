//
//  name_change_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/06/06.
//

import SwiftUI

struct name_change_View: View {
    //画面を閉じるために使う
    @Environment(\.dismiss) var dismiss
    //new_name_enter
    @State private var new_name_enter = ""
    @State private var new_name_enter_confirmation = ""
    //erroralert
    @State private var error_alert = false
    @State private var error_message = ""
    //読み込む
    @Binding var my_name_main: String
    
    var body: some View {
        ZStack{
            Color.brown.ignoresSafeArea()
            VStack{
                Text("名前を変更").font(.system(size: 50)).fontWeight(.black)
                Spacer()
                Image(systemName: "person.fill").font(.system(size: 50))
                Text("新しい名前を入力").font(.system(size: 30)).fontWeight(.black)
                VStack{
                    Text("新しい名前を入力").font(.system(size: 30)).fontWeight(.black)
                    TextField("タップして新しい名前を入力", text: $new_name_enter).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
                        .textFieldStyle(.plain)
                        .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                        .textContentType(.emailAddress)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding(.top, 15)
                        .padding(.bottom, 10)
                        .foregroundColor(.black)
                        .fontWeight(.black)
                    Text("もう一度名前を入力").font(.system(size: 27)).fontWeight(.black)
                    TextField("タップして新しい名前を入力", text: $new_name_enter_confirmation).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
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
                .frame(width: 280, height: 400)
                .border(Color.gray, width: 10)
                .cornerRadius(20)
                Spacer()
                Button(action: {
                    if new_name_enter == ""{
                        error_message = "新しい名前を入力して下さい"
                        error_alert = true
                    }
                    else if new_name_enter_confirmation == ""{
                        error_message = "新しい名前をもう一度名前を入力して下さい"
                        error_alert = true
                    }
                    else if new_name_enter != new_name_enter_confirmation{
                        error_message = "新しい名前をもう一度入力した新しい名前が一致しません"
                        error_alert = true
                    }
                    else{
                        //名前を登録
                        my_name_main = new_name_enter
                        UserDefaults.standard.set(my_name_main, forKey: "my_name_key")
                        //変更完了したので画面を閉じる
                        dismiss()
                    }
                }) {
                    Text("変更").font(.largeTitle).fontWeight(.black)
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
    }
}
