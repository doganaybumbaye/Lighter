//
//  SwiftUIView.swift
//  
//
//  Created by Doğanay Şahin on 29.07.2023.
//

import SwiftUI
import LighterComponents
import StoreKit

public struct LighterNewSettings: View {
    @State var showPaywall = false

    @Environment(\.requestReview) var requestReview
    @Environment(\.openURL) var openURL
    
    public init(){}
    public var body: some View {
        NavigationView {
            VStack{

                Button(action: {
                    
                }, label: {
                    HStack{
                        Image(systemName: "star")
                        Text("Get your premium")
                            
                        
                    }
                    .bold()
                })
                .buttonStyle(RectButtonStyle(height: 54.sp))
                Shadowed(content: {

                    HelpButton(imageName: "arrow.clockwise", buttonText: "Restore Subcription") {
                                           
                    }
                    Divider()
                    HelpButton(imageName: "questionmark.circle", buttonText: "Contact Us") {
                        openURL(URL(string: "https://forms.gle/Zy4eyr1fdnGsS7t27")!)
//
                    }
                }, title: "Support")

                

                Shadowed(content: {
                    HelpButton(imageName: "star.leadinghalf.filled", buttonText: "Rate Us") {
                        requestReview()
                    }
                    Divider()
                    HelpButton(imageName: "square.and.arrow.up", buttonText: "Share with friends") {
//
                    }
                    Divider()
                    HelpButton(imageName: "person.badge.key", buttonText: "Privacy Policy") {
                        openURL(URL(string: "https://doganaybumbaye.github.io")!)
                    }
                    Divider()
                    HelpButton(imageName: "doc.plaintext", buttonText: "Terms of use") {
                                          openURL(URL(string: "https://doganaybumbaye.github.io/termsofuse.html")!)
                                      }
                }, title: "About")
                Spacer()

            }.navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal)
            
        }
        
        .fullScreenCover(isPresented: $showPaywall) {
            Text("paywallme")
                .padding(.bottom)
        }
        
    }
}


struct SettingsTitle : View{
    var title : String
    var body: some View{
        HStack{
            Text(title)
                .bold()
                .font(.title3)
                
            Spacer()
        }.padding(.horizontal)
    }
}
struct HelpButton : View{
    var imageName : String
    var buttonText : String
    var rightImage : String?
    var action : () -> Void
    var body: some View{
        
        Button {
            action()
        } label: {
            HStack(spacing : 12.sp){
                Image(systemName: imageName)
                    .resizable()
                    
                    .scaledToFit()
                    .frame(width: 24.sp, height: 24.sp)
                    .foregroundColor(.gray)
                Text(buttonText)
                    .bold()
                    .font(.callout)
                
                    
                Spacer()
                if let extraImage = rightImage{
                    Image(extraImage)
                        .resizable()
                        .frame(width: 14.sp, height: 14.sp)
                        .scaledToFill()
                }
                
            }.padding(.horizontal, 12.sp)
                
            
        }
        .frame(minHeight: 32.sp)
        .tint(.black)
        
    }
}


struct Shadowed<Content: View>: View {
    var title : String
    var content: Content
    
    
    init(@ViewBuilder content: () -> Content, title : String) {
        self.title = title
        self.content = content()
        
    }
    
    var body: some View {
        
        VStack{
            SettingsTitle(title: title)

        VStack {
            VStack{
                content
            }
            .padding([.top, .bottom], 8.sp)
            .padding(.horizontal, 8.sp)
        }
        .frame(maxWidth: .infinity)
        
        
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12.sp))
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.13), radius: 6, x: 0, y: 2)
        .padding(.horizontal)
    }
    }
}

//struct LighterNewSettings_Previews: PreviewProvider {
//    static var previews: some View {
//        LighterNewSettings()
//    }
//}
