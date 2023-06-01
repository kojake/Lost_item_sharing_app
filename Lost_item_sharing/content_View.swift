//
//  content_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/29.
//

import SwiftUI

struct content_View: View {
    //画面を閉じるために使う
    @Environment(\.dismiss) var dismiss
    @Binding var select_list: String
    @State var selected_get_number = 0
    // offset変数でメニューを表示・非表示するためのオフセットを保持します
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero
    
    var body: some View {
        NavigationView{
            // メインコンテンツ
            VStack{
                HStack{
                    Button(action: {
                        dismiss()
                    }) {
                        Text("戻る")
                    }
                    .padding()
                    .accentColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(26)
                    Spacer()
                }
                Spacer()
                Text("\(post_title[selected_get_number])").font(.system(size: 50)).fontWeight(.black)
                VStack{
                    Text("\(post_content[selected_get_number])").font(.system(size: 20)).fontWeight(.black)
                }
                .frame(width: 350, height: 400)
                .padding()
                .border(Color.gray, width: 1)
                HStack{
                    VStack{
                        Text("実際の画像").fontWeight(.black)
                        Image("")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 180)
                            .cornerRadius(0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 4))
                    }
                    Button(action: {
                        if (self.offset == self.openOffset) {
                            self.offset = self.closeOffset
                        } else {
                            self.offset = self.openOffset
                        }
                    }) {
                        VStack {
                            Image(systemName: "message.fill")
                            Text("チャットを\n見てみる")
                        }
                    }.buttonStyle(BlueButtonStyle()).frame(width: 160, height: 100)
                }
            }.onAppear{
                if let index = post_name.firstIndex(of: select_list){
                    selected_get_number = index
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}
