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


