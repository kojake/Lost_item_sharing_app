//
//  my_profile_View.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/28.
//

import SwiftUI
import Foundation

struct my_profile_View: View {
    //画面を閉じる
    @Environment(\.dismiss) var dismiss
    //名前変更アラート
    @State private var name_change_alert = false
    //アラート入力取得
    @State private var userInput = ""
    //読み込み
    @Binding var my_name: String
    @Binding var my_photo: String
    @Binding var post_name_main: [String]
    //回復key
    @State private var recovery_key: [String] = ["","",""]
    let words = ["apple", "banana", "cat", "dog", "elephant", "fox", "giraffe", "horse", "igloo", "jaguar"]
    //写真選択画面を開く
    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false
    //
    @State var selected_get_number = 0
    //タグ
    @Binding var lost_tag_list: [String]
    //画面遷移
    @State var showShould_tag_change_View = false
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: tag_change_View(lost_tag_list: $lost_tag_list), isActive: $showShould_tag_change_View){
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
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
                Image(my_photo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100).stroke(Color.black, lineWidth: 4))
                Text("\(my_name)").font(.system(size: 35)).fontWeight(.black)
                Spacer()
                Text("_____________________________").font(.title2).fontWeight(.black)
                HStack{
                    ZStack{
                        VStack{
                            HStack{
                                Image(systemName: "key").font(.largeTitle).foregroundColor(Color.yellow)
                                Text("回復キー").font(.title2).fontWeight(.black).foregroundColor(Color.white)
                                Image(systemName: "key").font(.largeTitle).foregroundColor(Color.yellow)
                            }
                            Text("\(recovery_key[0])").frame(width: 180, height: 50).background(Color.gray).foregroundColor(Color.white).font(.title).fontWeight(.black).cornerRadius(20)
                            Text("\(recovery_key[1])").frame(width: 180, height: 50).background(Color.gray).foregroundColor(Color.white).font(.title).fontWeight(.black).cornerRadius(20)
                            Text("\(recovery_key[2])").frame(width: 180, height: 50).background(Color.gray).foregroundColor(Color.white).font(.title).fontWeight(.black).cornerRadius(20)
                            
                            Button(action: {
                                recovery_key.removeAll()
                                for _ in 0..<3 {
                                    let randomWord = words.randomElement() ?? ""
                                    recovery_key.append(randomWord)
                                }
                                UserDefaults.standard.set(recovery_key, forKey: "recovery_key")
                            }){
                                Text("シャッフル")
                                    .font(.title2)
                                    .fontWeight(.black)
                            }
                            .padding()
                            .accentColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(26)
                            .frame(width: 150, height: 50)
                        }.frame(width: 200, height: 400).background(Color.black).cornerRadius(50)
                    }
                    VStack{
                        Text("名前を変更").font(.title2).fontWeight(.black)
                        //名前を変更
                        Button(action: {
                            name_change_alert = true
                        }) {
                            Text("名前を変更")
                        }
                        .padding()
                        .accentColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(26)
                        .shadow(radius: 20)
                        .frame(width: 160, height: 100)
                        Text("________________").fontWeight(.black)
                        //アイコン変更
                        VStack{
                            Text("アイコン変更").font(.title2).fontWeight(.black)
                            HStack{
                                Button(action: {
                                    my_photo = "share_app_men_icon"
                                    UserDefaults.standard.set(my_photo, forKey: "my_photo_key")
                                }){
                                    Image("share_app_men_icon").resizable().frame(width: 70, height: 70)
                                }
                                Button(action: {
                                    my_photo = "share_app_women_icon"
                                    UserDefaults.standard.set(my_photo, forKey: "my_photo_key")
                                }){
                                    Image("share_app_women_icon").resizable().frame(width: 70, height: 70)
                                }
                            }
                        }
                        Text("________________").fontWeight(.black)
                        //タグ
                        VStack{
                            Text("タグを変更").font(.title2).fontWeight(.black)
                            Button(action: {
                                showShould_tag_change_View = true
                            }) {
                                Text("タグを変更")
                            }
                            .padding()
                            .accentColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(26)
                            .shadow(radius: 20)
                            .frame(width: 160, height: 100)
                        }
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
            .alert("名前を変更", isPresented: $name_change_alert, actions: {
                TextField("タップして入力", text: $userInput)
                Button("変える", action: {
                    if let index = post_name.firstIndex(of: (my_name)){
                        selected_get_number = index
                    }
                    post_name_main[selected_get_number] = userInput
                    post_name[selected_get_number] = userInput
                    //名前を保存する
                    UserDefaults.standard.set(userInput, forKey: "my_name_key")
                })
                Button("キャンセル", role: .cancel, action: {})
            }, message: {
                Text("名前を変更するならタップして入力をして下さい")
            })
    }
}

struct PhotoModal: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: PhotoModal
        
        init(_ parent: PhotoModal) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
