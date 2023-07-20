//public struct LighterComponents {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}
import SwiftUI

public struct LighterButton : View{
    var title : String
    var titleColor : Color
    var background : Color
    var action : () -> Void
    public init(title : String, titleColor : Color, background : Color ,action : @escaping () -> Void) {
        self.title = title
        self.titleColor = titleColor
        self.background = background
        self.action = action
        
    }
    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
 
        }
        
        
        .buttonStyle(GrowingButton(bgColor: background, titleColor: titleColor))
        
    }
}

struct GrowingButton: ButtonStyle {
    var bgColor : Color
    var titleColor : Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: 52)
            .background(bgColor)
            .foregroundStyle(titleColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

extension Color {
    static let primaryColor = Color(red: 48/255, green: 92/255, blue: 210/255) // Gökyüzü Mavisi
    static let secondaryColor = Color(red: 240/255, green: 120/255, blue: 34/255) // Altın Turuncusu
    static let backgroundColor = Color(red: 250/255, green: 248/255, blue: 239/255) // Şeftali Beyazı
    static let textColor = Color(red: 49/255, green: 52/255, blue: 67/255) // Orman Yeşili
    static let accentColor2 = Color(red: 220/255, green: 12/255, blue: 12/255) // Mor Pembe

    static let complementaryColor1 = Color(red: 38/255, green: 167/255, blue: 139/255) // Deniz Yeşili
    static let complementaryColor2 = Color(red: 191/255, green: 22/255, blue: 131/255) // Somon Pembe
    static let fancyGray = Color(red: 150/255, green: 150/255, blue: 150/255) // Fancy Gri Renk
    static let offWhiteColor = Color(red: 245/255, green: 245/255, blue: 245/255)
    static let brightOffWhiteColor = Color(red: 255/255, green: 250/255, blue: 250/255)

    static let whiteGradient = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color(white: 0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
}

struct FancyButtonStyle: ButtonStyle {
    var buttonColor: Color
    var textColor : Color = .white
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(textColor)
            .bold()
            .background(buttonColor)
            .cornerRadius(12)
            
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
            
            
    }
}
struct RoundedRectIconButtonStyle: ButtonStyle {
    var buttonColor: Color // Renk skalasından seçilen renk
    var iconColor : Color = .white
    var textColor : Color = .white
    var cornerRadius : CGFloat = 12
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: "arrow.right") // İstediğiniz simgeyi buraya ekleyebilirsiniz
                .foregroundColor(iconColor)
                .padding()
                .bold()
            configuration.label
                .foregroundColor(textColor)
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
        }
        .background(buttonColor) // Renk skalasından seçilen renk burada kullanılıyor
        .cornerRadius(cornerRadius) // Yuvarlatılmış köşeler
        
        .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    var headIcon : String
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack(alignment: .leading) {
            configuration
                .padding(EdgeInsets(top: 12, leading: 42, bottom: 12, trailing: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                        
                )
            
            Image(systemName: headIcon) // İstediğiniz ikonu buraya ekleyebilirsiniz
                .foregroundColor(.black.opacity(0.5))
                .padding(.leading, 12)
                .bold()
        }
        
        .frame(maxWidth: .infinity)
        
    }
}

struct InfoCardView: View {
    var backgroundColor: Color
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(.textColor)
                .font(.headline)
                .padding()
                .minimumScaleFactor(0.5)
        }
        .frame(maxWidth: 250, maxHeight: 150)
        .background(backgroundColor)
        .cornerRadius(12)
        
    }
}


struct FancyCheckboxStyle: ToggleStyle {
    var size: CGFloat = 24
    var cornerRadius: CGFloat = 6
    var animationDuration: Double = 0.2
    var title : Text?
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(configuration.isOn ? Color.white : Color.gray, lineWidth: 1)
                    .background(configuration.isOn ? Color.green : Color.white)
                    
                    .frame(width: size, height: size)
                    

                if configuration.isOn {
                    Image(systemName: "checkmark")
                    
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                        .scaledToFit()
                        .bold()
                }
            }
            
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            
            title
            .foregroundColor(.black)
            .bold()
            
        }
    }
}


