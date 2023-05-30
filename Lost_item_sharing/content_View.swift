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
    
    var body: some View {
        VStack{
            Text("\(post_name[selected_get_number])").font(.system(size: 50)).fontWeight(.black)
            VStack{
                Text("\(post_content[selected_get_number])").font(.system(size: 20)).fontWeight(.black)
            }
            .frame(width: 350, height: 400)
            .padding()
            .border(Color.gray, width: 1)
        }.onAppear{
            if let index = post_name.firstIndex(of: select_list){
                selected_get_number = index
            }
        }
    }
}
