//public struct LighterComponents {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}
import SwiftUI


public struct LighterButtonStyle: ButtonStyle {
    var buttonColor: Color
    var gradientColor: LinearGradient?
    var textColor : Color
    var cornerRadius : CGFloat
    
    public init(buttonColor: Color = .lighterPrimaryColor, textColor: Color = .white, gradientColor : LinearGradient? = nil, cornerRadius : CGFloat = 12) {
        self.buttonColor = buttonColor
        self.textColor = textColor
        self.gradientColor = gradientColor
        self.cornerRadius = cornerRadius
    }
    
    
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(textColor)
            .bold()
            .background(
                Group{
                    if let gradient = gradientColor{
                        buttonColor
                            .overlay(gradient)
                    }else{
                        buttonColor
                    }
                }

                
            
            )
            
            .cornerRadius(cornerRadius)
            
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
            
            
    }
}
public struct LighterRoundedRectIconButtonStyle: ButtonStyle {
    var buttonColor: Color
    var iconColor : Color
    var textColor : Color
    var cornerRadius : CGFloat
    var iconName : String
    var gradientColor : LinearGradient?
    
    public init(buttonColor: Color, iconColor: Color = .white, textColor: Color = .white, cornerRadius: CGFloat = 12, iconName : String = "arrow.right", gradientColor : LinearGradient? = nil) {
        self.buttonColor = buttonColor
        self.iconColor = iconColor
        self.textColor = textColor
        self.cornerRadius = cornerRadius
        self.iconName = iconName
        self.gradientColor = gradientColor
    }
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: iconName) // İstediğiniz simgeyi buraya ekleyebilirsiniz
                .foregroundColor(iconColor)
                .padding()
                .bold()
            configuration.label
                .foregroundColor(textColor)
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
        }
        .background(
            Group{
                if let gradient = gradientColor{
                    buttonColor
                        .overlay(gradient)
                }else{
                    buttonColor
                }
            }

        
        ) // Renk skalasından seçilen renk burada kullanılıyor
        .cornerRadius(cornerRadius) // Yuvarlatılmış köşeler
        
        .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        
    }
}

public struct LighterTextFieldStyle: SwiftUI.TextFieldStyle {
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

public struct LighterInfoCardView: View {
    var backgroundColor: Color
    var text: String
    public init(backgroundColor: Color = .black, text: String) {
        self.backgroundColor = backgroundColor
        self.text = text
    }
    public var body: some View {
        VStack {
            Text(text)
                .foregroundColor(.lighterTextColor)
                .font(.headline)
                .padding()
                .minimumScaleFactor(0.5)
        }
        .frame(maxWidth: 250, maxHeight: 150)
        .background(backgroundColor)
        .cornerRadius(12)
        
    }
}


public struct LighterCheckboxStyle: ToggleStyle {
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


struct RectButtonStyle: ButtonStyle {

    @State var height : CGFloat = 56.sp
    @State var cornerRadius : CGFloat = 12.sp
    @State var foreground : Color = .white
    var backgroundColor : Color?
    
    let colors = [
        Color.prettyPrimary1,
        Color.prettyPrimary2
    ]

    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            
            
            .frame(maxWidth: .infinity, minHeight: height)
            
            .foregroundColor(foreground)
            .background{
                if let bgColor = backgroundColor{
                    bgColor
                }else{
                    LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
                }
                
            }
            .cornerRadius(cornerRadius)
            
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.2)
                        .cornerRadius(cornerRadius)
                }
            }
            
    }
}
