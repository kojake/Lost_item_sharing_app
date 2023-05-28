//
//  my_profile_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/28.
//

import SwiftUI

struct my_profile_View: View {
    //画面を閉じる
    @Environment(\.dismiss) var dismiss
    
    @Binding var my_name: String
    
    var body: some View {
        NavigationView{
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
                    Text("自分のプロフィール").font(.system(size: 30)).fontWeight(.black)
                }
                Image("")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 75).stroke(Color.black, lineWidth: 4))
                Text("\(my_name)").font(.system(size: 40)).fontWeight(.black)
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}
