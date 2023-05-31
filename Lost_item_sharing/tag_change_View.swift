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
        NavigationView{
            ZStack{
                Color.brown.ignoresSafeArea()
                VStack{
                    HStack{
                        Image(systemName: "tag.fill").font(.largeTitle).fontWeight(.black)
                        Text("タグを変更").font(.system(size: 50)).fontWeight(.black)
                    }
                    Text("現在使用されているタグ").font(.title).fontWeight(.black)
                    VStack{
                        HStack{
                            Text("\(lost_tag_list[0])").frame(width: 100, height: 70).font(.title).fontWeight(.black).background(Color.green).cornerRadius(20)
                            Text("\(lost_tag_list[1])").frame(width: 100, height: 70).font(.title).fontWeight(.black).background(Color.green).cornerRadius(20)
                        }
                    }.frame(width: 350, height: 100).background(Color.white).cornerRadius(20)
                }
            }
        }
    }
}

