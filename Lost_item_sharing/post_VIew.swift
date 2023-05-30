//
//  post_VIew.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/29.
//

import SwiftUI

struct post_VIew: View {
    @Binding var my_name: String
    @Binding var post_name_main: [String]
    //画面を閉じるために使う
    @Environment(\.dismiss) var dismiss
    //設定とプレビュー
    private let stapleFoods = ["本文", "プレビュー"]
    @State private var selectedIndex = 0
    //本文の詳細
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationView{
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
                if selectedIndex == 0{
                    VStack{
                        HStack{
                            VStack{
                                Button(action: {
                                    dismiss()
                                }) {
                                    Text("戻る")
                                }
                                .padding()
                                .accentColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(26)
                            }
                            TextField("タップしてタイトルを入力", text: $title).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
                                .textFieldStyle(.plain)
                                .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                                .textContentType(.emailAddress)
                                .cornerRadius(10)
                                .multilineTextAlignment(.center)
                                .padding(.top, 15)
                                .padding(.bottom, 10)
                                .foregroundColor(.black)
                                .fontWeight(.black)
                        }
                        ZStack{
                            TextEditor(text: $content)
                                .frame(height: 350)
                                .padding()
                                .border(Color.gray, width: 1)
                            VStack{
                                Spacer()
                                Button(action: {
                                    //抜けているところがないか確認する
                                    if title == ""{
                                        print("タイトル無し")
                                    }
                                    else if content == ""{
                                        print("内容無し")
                                    }
                                    else{
                                        post_title.append(title)
                                        post_content.append(content)
                                        post_name.append(my_name)
                                        post_name_main.append(my_name)
                                        dismiss()
                                        print(post_title)
                                        print(post_content)
                                        print(post_name)
                                    }
                                }) {
                                    Text("投稿").frame(width: 350,height: 20)
                                }
                                .padding()
                                .accentColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(26)
                                .frame(width: 350,height: 60)
                            }
                        }
                        Spacer()
                    }
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
                        VStack{
                            Button(action: {
                                
                            }) {
                                Image(systemName: "camera.fill")
                                    .resizable()
                                    .padding()
                                    .frame(width: 80, height: 80)
                                    .imageScale(.large)
                                    .foregroundColor(Color.white)
                                    .background(Color.green)
                                    .clipShape(Circle())
                            }
                            Button(action: {
                                
                            }) {
                                Image(systemName: "photo")
                                    .resizable()
                                    .padding()
                                    .frame(width: 80, height: 80)
                                    .imageScale(.large)
                                    .foregroundColor(Color.white)
                                    .background(Color.green)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
                else{
                    VStack{
                        Text("\(title)").font(.system(size: 50)).fontWeight(.black)
                        VStack{
                            Text("\(content)").font(.system(size: 20)).fontWeight(.black)
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
                                
                            }) {
                                VStack {
                                    Image(systemName: "message.fill")
                                    Text("チャットを\n見てみる")
                                }
                            }.buttonStyle(BlueButtonStyle()).frame(width: 160, height: 100)
                        }
                        Spacer()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("閉じる") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight:.bold, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(5)
            .background(Color.blue.opacity(0.8))
            .cornerRadius(20)
            .shadow(color:.black, radius: 4)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}
