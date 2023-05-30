//
//  content_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/29.
//

import SwiftUI

struct content_View: View {
    @Binding var select_list: String
    @State var selected_get_number = 0
    // offset変数でメニューを表示・非表示するためのオフセットを保持します
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero
    
    var body: some View {
        // 画面サイズの取得にGeometoryReaderを利用します
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // メインコンテンツ
                VStack{
                    Text("\(post_name[selected_get_number])").font(.system(size: 50)).fontWeight(.black)
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
                .background(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                // スライドメニューがでてきたらメインコンテンツをグレイアウトします
                Color.gray.opacity(
                    Double((self.closeOffset - self.offset)/self.closeOffset) - 0.4
                )
                // スライドメニュー
                chat_View(selected_get_number2: $selected_get_number)
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.7)
                // 最初に画面のオフセットの値をスライドメニュー分マイナスします。
                    .onAppear(perform: {
                        self.offset = geometry.size.width
                        self.closeOffset = self.offset
                        self.openOffset = geometry.size.width - geometry.size.width * 0.7
                    })
                    .offset(x: self.offset)
                // スライドのアニメーションを設定します
                    .animation(.default)
            }
            // ジェスチャーに関する実装をします
            // スワイプのしきい値を設定してユーザの思わぬメニューの出現を防ぎます
            .gesture(DragGesture(minimumDistance: 5)
                .onChanged{ value in
                    // オフセットの値(メニューの位置)をスワイプした距離に応じて狭めていきます
                    if (self.offset > self.openOffset) {
                        self.offset = self.closeOffset + value.translation.width
                    }
                }
                .onEnded { value in
                    // value.translation.widthを使っても書けます
                    // 移動した距離がマイナス方向だったらメニューを開く
                    if (value.translation.width < 0) {
                        self.offset = self.openOffset
                    } else {
                        self.offset = self.closeOffset
                    }
                }
            )
        }
    }
}

struct chat_View: View{
    @Binding var selected_get_number2: Int
    @State var user_text_enter = ""
    @State var post_chat_view = post_chat
    
    var body: some View{
        VStack{
            Text("チャット内容").font(.system(size: 40)).fontWeight(.black)
            Text(post_chat_view[selected_get_number2]?.joined(separator: "\n") ?? "").font(.title).fontWeight(.black)
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    TextField("返信する", text: $user_text_enter)
                    Button(action: {
                        post_chat_view[selected_get_number2]?.append(user_text_enter)
                        post_chat[selected_get_number2]?.append(user_text_enter)
                    }){
                        Image(systemName: "arrow.up.circle").resizable().frame(width: 50, height: 50).foregroundColor(Color.green)
                    }
                }
                .textFieldStyle(OvalTextFieldStyle())
            }.padding()
        }.background(Color.white).frame(width: 300, height: 750)
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
