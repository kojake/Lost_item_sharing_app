//
//  first_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/06/03.
//

import SwiftUI

struct first_View: View {
    var body: some View {
        ZStack{
            Color.brown.ignoresSafeArea()
            VStack{
                HStack{
                    Text("TnrackFound\nようこそ").font(.system(size: 40)).fontWeight(.black)
                    Spacer()
                }.padding()
                Text("落とし物や忘れ物チェック").font(.system(size: 30)).fontWeight(.black)
                Spacer()
                Image(systemName: "person.fill").font(.system(size: 50))
                Text("プロフィールを作成").font(.system(size: 30)).fontWeight(.black)
            }
        }
    }
}

struct first_View_Previews: PreviewProvider {
    static var previews: some View {
        first_View()
    }
}
