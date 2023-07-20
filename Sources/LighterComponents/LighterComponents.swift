//public struct LighterComponents {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}
import SwiftUI


public extension Color {
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

public struct FancyButtonStyle: ButtonStyle {
    var buttonColor: Color
    var textColor : Color
    
    public init(buttonColor: Color, textColor: Color = .white) {
        self.buttonColor = buttonColor
        self.textColor = textColor
    }
    
    
    
    public func makeBody(configuration: Configuration) -> some View {
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
public struct RoundedRectIconButtonStyle: ButtonStyle {
    var buttonColor: Color
    var iconColor : Color
    var textColor : Color
    var cornerRadius : CGFloat
    
    public init(buttonColor: Color, iconColor: Color = .white, textColor: Color = .white, cornerRadius: CGFloat = 12) {
        self.buttonColor = buttonColor
        self.iconColor = iconColor
        self.textColor = textColor
        self.cornerRadius = cornerRadius
    }
    public func makeBody(configuration: Configuration) -> some View {
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

public struct FancyTextFieldStyle: SwiftUI.TextFieldStyle {
    var headIcon : String
    
    public init(headIcon: String) { // Public initializer ekledik
        self.headIcon = headIcon
    }
    public func _body(configuration: TextField<Self._Label>) -> some View {
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

public struct InfoCardView: View {
    var backgroundColor: Color
    var text: String
    public init(backgroundColor: Color = .black, text: String) {
        self.backgroundColor = backgroundColor
        self.text = text
    }
    public var body: some View {
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


public struct FancyCheckboxStyle: ToggleStyle {
    var size: CGFloat
    var cornerRadius: CGFloat
  
    var title : Text?
    
    public init(size: CGFloat = 24, cornerRadius: CGFloat = 6, animationDuration: Double, title: Text? = nil) {
        self.size = size
        self.cornerRadius = cornerRadius

        self.title = title
    }
    public func makeBody(configuration: Configuration) -> some View {
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


