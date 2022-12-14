import Foundation

//MARK: Button style

enum ButtonStyle {
    case white
    case blue
}

//MARK: Font

enum CustomFont: String {
    case RobotoBlack   = "Roboto-Black"
    case RobotoBold    = "Roboto-Bold"
    case RobotoLight   = "Roboto-Light"
    case RobotoMedium  = "Roboto-Medium"
    case RobotoRegular = "Roboto-Regular"
    case RobotoThin    = "Roboto-Thin"
}

//MARK: Color

enum CustomColor: String {
    case Blue        = "CustomBlue"
    case BlueLight   = "CustomBlueLight"
    case VioletLight = "CustomVioletLight"
    case Green       = "CustomGreen"
}

//MARK: Color

enum ConstantsForConstraints: CGFloat {
    case LeftIntoView = 30
    case RightIntoView = -30
}
