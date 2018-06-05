

public enum MAPSEnvironment {
    case f5production
    case production
    case f5qa
    case qa
    case f5development
    case development
}

public struct MAPSEnvironmentManager {
    /**
     Returns the current environment.
     */
    public static var current: MAPSEnvironment = .f5production
    
    /**
     This method sets the environment for the client app based on the target's environment.
     */
    public static func configure() {
        #if PROD
            current = .f5production
        #elseif QA
            current = .f5qa
        #elseif DEV
            current = .development
        #endif
    }

}
