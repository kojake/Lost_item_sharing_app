//
//  content_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/29.
//

import SwiftUI

struct content_View: View {
    @Binding var select_list: Int
    
    var body: some View {
        VStack{
            Text("\(post_title[select_list])").font(.system(size: 50)).fontWeight(.black)
            VStack{
                Text("\(post_content[select_list])").font(.system(size: 20)).fontWeight(.black)
            }
            .frame(width: 350, height: 400)
            .padding()
            .border(Color.gray, width: 1)
        }
    }
}
