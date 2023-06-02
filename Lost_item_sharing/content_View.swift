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
    //写真をshare
    @State private var sharedText: String? = "あなたが探していた落とし物はこれではないでしょうか"
    
    
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
                ZStack{
                    VStack{
                        Text("\(post_content[selected_get_number])").font(.system(size: 20)).fontWeight(.black)
                        Spacer()
                        HStack{
                            Spacer()
                            Button(action: {
                                shareContent()
                            }){
                                Text("Share").frame(width: 100, height: 100)
                            }
                            .font(.system(.title2, design: .rounded, weight: .bold))
                            .foregroundColor(.yellow)
                            .background(Capsule().stroke(.yellow, lineWidth: 2))
                        }
                    }
                }
                .frame(width: 350, height: 400)
                .padding()
                .border(Color.gray, width: 1)
            }.onAppear{
                if let index = post_name.firstIndex(of: select_list){
                    selected_get_number = index
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    func shareContent() {
        var activityItems: [Any] = []
        
        if let text = sharedText {
            activityItems.append(text)
        }

        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            rootViewController.present(activityViewController, animated: true, completion: nil)
        }
    }
}
