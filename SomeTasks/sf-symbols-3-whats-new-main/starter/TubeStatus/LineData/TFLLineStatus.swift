/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import SwiftUI

struct TFLLineStatus {
  let displayName: String
  let statusColor: Color
  let image: Image

  static func tflLineStatus(from apiStatus: String) -> TFLLineStatus {
    guard let tflLineStatus = TFLLineStatuses.all[apiStatus] else {
      #if DEBUG
        fatalError("Unknown status: \(apiStatus)")
      #else
      return TFLLineStatus(
        displayName: "Unrecognized Status: \(apiStatus)",
        statusColor: Color(uiColor: .systemRed),
        image: Image(systemName: "questionmark.circle"))
      #endif
    }
    return tflLineStatus
  }

  func uiImage() -> Image {
    self.image
  }
}

private enum TFLLineStatuses {
  static let xxx = TFLLineStatus(
    displayName: "XXX",
    statusColor: Color(uiColor: .systemGreen),
    image: Image(systemName: "xxx"))

  static let busService = TFLLineStatus(
    displayName: "Bus Service",
    statusColor: Color(uiColor: .systemGreen),
    image: Image(systemName: "bus"))
  static let changeOfFrequency = TFLLineStatus(
    displayName: "Change Of Frequency",
    statusColor: Color("warning-color"),
    image: Image(systemName: "clock.arrow.2.circlepath"))
  static let closed = TFLLineStatus(
    displayName: "Closed",
    statusColor: Color(uiColor: .systemRed),
    image: Image(systemName: "xmark.octagon"))
  static let diverted = TFLLineStatus(
    displayName: "Diverted",
    statusColor: Color(uiColor: .systemYellow),
    image: Image(systemName: "arrowshape.zigzag.right"))
  static let exitOnly = TFLLineStatus(
    displayName: "Exit Only",
    statusColor: Color(uiColor: .systemRed),
    image: Image(systemName: "rectangle.portrait.and.arrow.right"))
  static let goodService = TFLLineStatus(
    displayName: "Good Service",
    statusColor: Color(uiColor: .systemGreen),
    image: Image(systemName: "tram"))
  static let information = TFLLineStatus(
    displayName: "Information",
    statusColor: Color(uiColor: .systemBlue),
    image: Image(systemName: "info.circle"))
  static let issuesReported = TFLLineStatus(
    displayName: "Issues Reported",
    statusColor: Color("warning-color"),
    image: Image(systemName: "exclamationmark.circle"))
  static let minorDelays = TFLLineStatus(
    displayName: "Minor Delays",
    statusColor: Color("warning-color"),
    image: Image(systemName: "clock.arrow.circlepath"))
  static let noIssues = TFLLineStatus(
    displayName: "No Issues",
    statusColor: Color(uiColor: .systemGreen),
    image: Image(systemName: "checkmark.diamond"))
  static let noStepFreeAccess = TFLLineStatus(
    displayName: "No Step Free Access",
    statusColor: Color("warning-color"),
    image: Image("custom.figure.steps"))
  static let notRunning = TFLLineStatus(
    displayName: "Not Running",
    statusColor: Color(uiColor: .systemRed),
    image: Image(systemName: "x.circle.fill"))
  static let partClosed = TFLLineStatus(
    displayName: "Part Closed",
    statusColor: Color("warning-color"),
    image: Image(systemName: "octagon.lefthalf.filled"))
  static let partClosure = TFLLineStatus(
    displayName: "Part Closure",
    statusColor: Color("warning-color"),
    image: Image(systemName: "octagon.bottomhalf.filled"))
  static let partSuspended = TFLLineStatus(
    displayName: "Part Suspended",
    statusColor: Color("warning-color"),
    image: Image(systemName: "hand.raised"))
  static let plannedClosure = TFLLineStatus(
    displayName: "Planned Closure",
    statusColor: Color(uiColor: .systemRed),
    image: Image(systemName: "hammer"))
  static let reducedService = TFLLineStatus(
    displayName: "Reduced Service",
    statusColor: Color("warning-color"),
    image: Image(systemName: "tortoise.fill"))
  static let severeDelays = TFLLineStatus(
    displayName: "Severe Delays",
    statusColor: Color(uiColor: .systemRed),
    image: Image(systemName: "exclamationmark.arrow.circlepath"))
  static let specialService = TFLLineStatus(
    displayName: "Special Service",
    statusColor: Color("warning-color"),
    image: Image(systemName: "exclamationmark.triangle"))
  static let serviceClosed = TFLLineStatus(
    displayName: "Service Closed",
    statusColor: Color(uiColor: .systemRed),
    image: Image(systemName: "xmark.octagon.fill"))
  static let suspended = TFLLineStatus(
    displayName: "Suspended",
    statusColor: Color(uiColor: .systemRed),
    image: Image(systemName: "hand.raised.circle"))
  static let unknown = TFLLineStatus(
    displayName: "Unknown",
    statusColor: Color("warning-color"),
    image: Image(systemName: "questionmark.circle"))

  static let all = [
    busService.displayName: busService,
    changeOfFrequency.displayName: changeOfFrequency,
    closed.displayName: closed,
    diverted.displayName: diverted,
    exitOnly.displayName: exitOnly,
    goodService.displayName: goodService,
    information.displayName: information,
    issuesReported.displayName: issuesReported,
    minorDelays.displayName: minorDelays,
    noIssues.displayName: noIssues,
    noStepFreeAccess.displayName: noStepFreeAccess,
    notRunning.displayName: notRunning,
    partClosed.displayName: partClosed,
    partClosure.displayName: partClosure,
    partSuspended.displayName: partSuspended,
    plannedClosure.displayName: plannedClosure,
    reducedService.displayName: reducedService,
    severeDelays.displayName: severeDelays,
    specialService.displayName: specialService,
    suspended.displayName: suspended,
    serviceClosed.displayName: serviceClosed,
    unknown.displayName: unknown
  ]
}
