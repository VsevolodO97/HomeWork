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

// 1
let bakerlooLineDebug = LineData(
  name: "BakerlooDebug",
  color: Color("bakerloo-text"))
let centralLineDebug = LineData(
  name: "CentralDebug",
  color: Color("central-text"))
let circleLineDebug = LineData(
  name: "CircleDebug",
  color: Color("circle-text"))
let districtLineDebug = LineData(
  name: "DistrictDebug",
  color: Color("district-text"))
let hammersmithAndCityLineDebug = LineData(
  name: "Hammersmith & CityDebug",
  color: Color("hammersmith-text"))
let jubileeLineDebug = LineData(
  name: "JubileeDebug",
  color: Color("jubilee-text"))
let metropolitanLineDebug = LineData(
  name: "MetropolitanDebug",
  color: Color("metropolitan-text"))
let northernLineDebug = LineData(
  name: "NorthernDebug",
  color: Color("northern-text"))
let piccadillyLineDebug = LineData(
  name: "PiccadillyDebug",
  color: Color("piccadilly-text"))
let victoriaLineDebug = LineData(
  name: "VictoriaDebug",
  color: Color("victoria-text"))

let debugData = AllLinesStatus(
  lastUpdated: Date(),
  linesStatus: [
    // 2
    LineStatus(line: bakerlooLine, status: TFLLineStatus.tflLineStatus(from: "Good Service")),
    LineStatus(line: centralLine, status: TFLLineStatus.tflLineStatus(from: "No Issues")),
    LineStatus(line: circleLine, status: TFLLineStatus.tflLineStatus(from: "Bus Service")),
    LineStatus(line: districtLine, status: TFLLineStatus.tflLineStatus(from: "Part Suspended")),
    LineStatus(line: hammersmithAndCityLine, status: TFLLineStatus.tflLineStatus(from: "Part Closure")),
    LineStatus(line: jubileeLine, status: TFLLineStatus.tflLineStatus(from: "Reduced Service")),
    LineStatus(line: metropolitanLine, status: TFLLineStatus.tflLineStatus(from: "Minor Delays")),
    LineStatus(line: northernLine, status: TFLLineStatus.tflLineStatus(from: "Part Closed")),
    LineStatus(line: piccadillyLine, status: TFLLineStatus.tflLineStatus(from: "No Step Free Access")),
    LineStatus(line: victoriaLine, status: TFLLineStatus.tflLineStatus(from: "Change Of Frequency")),
    LineStatus(line: waterlooAndCityLine, status: TFLLineStatus.tflLineStatus(from: "Diverted")),
    LineStatus(line: dlr, status: TFLLineStatus.tflLineStatus(from: "Issues Reported")),
    // 3
    LineStatus(line: bakerlooLineDebug, status: TFLLineStatus.tflLineStatus(from: "Unknown")),
    LineStatus(line: centralLineDebug, status: TFLLineStatus.tflLineStatus(from: "Special Service")),
    LineStatus(line: circleLineDebug, status: TFLLineStatus.tflLineStatus(from: "Severe Delays")),
    LineStatus(line: districtLineDebug, status: TFLLineStatus.tflLineStatus(from: "Suspended")),
    LineStatus(line: hammersmithAndCityLineDebug, status: TFLLineStatus.tflLineStatus(from: "Not Running")),
    LineStatus(line: jubileeLineDebug, status: TFLLineStatus.tflLineStatus(from: "Planned Closure")),
    LineStatus(line: metropolitanLineDebug, status: TFLLineStatus.tflLineStatus(from: "Exit Only")),
    LineStatus(line: northernLineDebug, status: TFLLineStatus.tflLineStatus(from: "Closed")),
    LineStatus(line: piccadillyLineDebug, status: TFLLineStatus.tflLineStatus(from: "Service Closed")),
    LineStatus(line: victoriaLineDebug, status: TFLLineStatus.tflLineStatus(from: "Information"))
  ]
)
