//
//  Home.swift
//  chat
//
//  Created by 현경 on 2021/06/05.
//
import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeModel()
    @AppStorage("current_user") var user = ""
    @State var scrolled = false
    var body: some View {
        VStack(spacing: 0) {
            
            HStack{
                Text("Chatting")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength:0)
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.blue)
            
            ScrollViewReader { reader in
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(homeData.msgs) { msg in
                            ChatRow(chatData: msg)
                                .onAppear{
                                    // First Time Scroll
                                    if msg.id == self.homeData.msgs.last!.id && scrolled{
                                        reader.scrollTo(homeData.msgs.last!.id, anchor: .bottom)
                                        scrolled = true
                                    }
                                }
                        }
                        .onChange(of: homeData.msgs, perform: { value in
                            reader.scrollTo(homeData.msgs.last!.id, anchor: .bottom)
                        })
                    }
                    .padding(.vertical)
                }
            }
            
            HStack(spacing:15){
                TextField("Enter Message",  text: $homeData.txt)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.primary.opacity(0.06))
                    .clipShape(Capsule())
                
                if homeData.txt != "" {
                    
                    Button(action: homeData.writeMsg, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size:22))
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    })
                }
            }
            .animation(.default)
            .padding()
        }
        .onAppear(perform: {
            homeData.onAppear()
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}
