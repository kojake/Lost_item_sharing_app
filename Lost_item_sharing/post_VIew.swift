//
//  post_VIew.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/29.
//

import SwiftUI

struct post_VIew: View {
    //画面を閉じるために使う
    @Environment(\.dismiss) var dismiss
    //設定とプレビュー
    private let stapleFoods = ["本文", "プレビュー"]
    @State private var selectedIndex = 0
    //本文の詳細
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
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
            VStack{
                TextField("タップしてタイトルを入力", text: $title).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
                    .textFieldStyle(.plain)
                    .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                    .textContentType(.emailAddress)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                    .foregroundColor(.blue)
                TextEditor(text: $content)
                    .frame(height: 400)
                    .padding()
                    .border(Color.gray, width: 1)
                Spacer()
            }
            HStack{
                VStack{
                    Text("")
                    Image("")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 4))
                }
                
            }
        }
    }
}

struct post_VIew_Previews: PreviewProvider {
    static var previews: some View {
        post_VIew()
    }
}
