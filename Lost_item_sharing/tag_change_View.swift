//
//  tag_change_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/31.
//

import SwiftUI

struct tag_change_View: View {
    @Binding var lost_tag_list: [String]
    
    var body: some View {
        VStack{
            Text("タグを変更").font(.system(size: 50))
        }
    }
}
