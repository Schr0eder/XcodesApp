//
//  RuntimeInstallationStep.swift
//  
//
//  Created by Matt Kiazyk on 2023-11-23.
//

import Foundation

public enum RuntimeInstallationStep: Equatable, CustomStringConvertible {
    case downloading(progress: Progress)
    case unarchiving
    case moving(destination: String)
    case trashingArchive
    case checkingSecurity
    case finishing

    public var description: String {
        "(\(stepNumber)/\(stepCount)) \(message)"
    }

    public var message: String {
        switch self {
        case .downloading:
            return localizeString("Downloading")
        case .unarchiving:
            return localizeString("Unarchiving")
        case .moving(let destination):
            return String(format: localizeString("Moving"), destination)
        case .trashingArchive:
            return localizeString("TrashingArchive")
        case .checkingSecurity:
            return localizeString("CheckingSecurity")
        case .finishing:
            return localizeString("Finishing")
        }
    }

    public var stepNumber: Int {
        switch self {
        case .downloading:      return 1
        case .unarchiving:      return 2
        case .moving:           return 3
        case .trashingArchive:  return 4
        case .checkingSecurity: return 5
        case .finishing:        return 6
        }
    }

    public var stepCount: Int { 6 }
}
