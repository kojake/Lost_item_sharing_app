//
//  first_recovery_key_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/06/06.
//

import SwiftUI

struct first_recovery_key_View: View {
    //画面を閉じるために使う
    @Environment(\.dismiss) var dismiss
    //回復key
    @State private var recovery_key: [String] = ["","",""]
    let words = ["apple", "banana", "cat", "dog", "elephant", "fox", "giraffe", "horse", "igloo", "jaguar"]
    
    var body: some View {
        ZStack{
            Color.brown.ignoresSafeArea()
            VStack{
                Text("回復キー").font(.system(size: 60)).fontWeight(.black)
                Spacer()
                Text("ユーザ認証をする時に名前を聞きます\nその名前を忘れた時にこの回復キーを入力しないといけません。\n忘れてしまうとアプリを初期化しないといけません。").font(.title2).fontWeight(.black)
                VStack{
                    HStack{
                        Image(systemName: "key").font(.largeTitle).foregroundColor(Color.yellow)
                        Text("回復キー").font(.title2).fontWeight(.black).foregroundColor(Color.white)
                        Image(systemName: "key").font(.largeTitle).foregroundColor(Color.yellow)
                    }
                    Text("\(recovery_key[0])").frame(width: 180, height: 50).background(Color.gray).foregroundColor(Color.white).font(.title).fontWeight(.black).cornerRadius(20)
                    Text("\(recovery_key[1])").frame(width: 180, height: 50).background(Color.gray).foregroundColor(Color.white).font(.title).fontWeight(.black).cornerRadius(20)
                    Text("\(recovery_key[2])").frame(width: 180, height: 50).background(Color.gray).foregroundColor(Color.white).font(.title).fontWeight(.black).cornerRadius(20)
                }.frame(width: 300, height: 400).background(Color.black).cornerRadius(50)
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Text("OK").font(.largeTitle).fontWeight(.black)
                }
                .frame(width: 300, height: 30)
                .padding()
                .accentColor(Color.white)
                .background(Color.blue)
                .cornerRadius(26)

            }
        }.onAppear{
            recovery_key.removeAll()
            for _ in 0..<3 {
                let randomWord = words.randomElement() ?? ""
                recovery_key.append(randomWord)
            }
            UserDefaults.standard.set(recovery_key, forKey: "recovery_key")
        }
    }
}

struct first_recovery_key_View_Previews: PreviewProvider {
    static var previews: some View {
        first_recovery_key_View()
    }
}
