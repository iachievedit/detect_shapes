#!/usr/bin/env swift

/*
 * Copyright 2021 iAchieved.it LLC
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above 
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES 
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF 
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY 
 * SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION 
 * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

import Foundation

let mx = 16
let my = 16

let os = ProcessInfo.processInfo.operatingSystemVersionString

var convertPath = "/opt/homebrew/bin/convert"

if os.hasPrefix("Ubuntu") {
  convertPath = "/usr/bin/convert"
}

// Create a square
func createSquare(labeled label:Int) -> Void {
	let task = Process()
	task.executableURL = URL(fileURLWithPath:convertPath)

	let x1 = Int.random(in: 2...7)
	let x2 = Int.random(in: 9...13)

	let l = abs(x2-x1)
	let y1 = Int.random(in: 2...4)
	let y2 = y1+l

	task.arguments = [
	"-size", "16x16",
	"-depth", "8",
	"xc:white",
  "-fill",   "white",
	"-stroke", "black",
	"-draw",   "line \(x1),\(y1) \(x1),\(y2) line \(x1),\(y2) \(x2),\(y2) line \(x2),\(y2) \(x2),\(y1) line \(x2),\(y1) \(x1),\(y1)",
	"square\(label).png"
	]

	try! task.run()
}

// Create a rectangle
func createRectangle(labeled label:Int) -> Void {

	let task = Process()
	task.executableURL = URL(fileURLWithPath:convertPath)

	let x1 = Int.random(in: 2...13)
	let x2 = Int.random(in: 2...13)
	let y1 = Int.random(in: 2...13)
	let y2 = Int.random(in: 2...13)

	task.arguments = [
	"-size", "16x16",
	"-depth", "8",
	"xc:white",
  "-fill",   "white",
	"-stroke", "black",
	"-draw",   "line \(x1),\(y1) \(x1),\(y2) line \(x1),\(y2) \(x2),\(y2) line \(x2),\(y2) \(x2),\(y1) line \(x2),\(y1) \(x1),\(y1)",
	"rectangle\(label).png"
	]

	try! task.run()
}

// Creates a triangle
func createTriangle(labeled label:Int) -> Void {
	let task = Process()
	task.executableURL = URL(fileURLWithPath:convertPath)

	let x1 = Int.random(in: 1...7)
  let y1 = Int.random(in: 1...7)

	let x2 = Int.random(in: 1...7)
	let y2 = Int.random(in: 9...15)

	let x3 = Int.random(in: 9...15)
	let y3 = Int.random(in: 1...15)

	task.arguments = [
	"-size", "16x16",
	"-depth", "8",
	"xc:white",
  "-fill",   "white",
	"-stroke", "black",
	"-draw",   "line \(x1),\(y1) \(x2),\(y2) line \(x2),\(y2) \(x3),\(y3) line \(x3),\(y3) \(x1),\(y1)",
	"triangle\(label).png"
	]

	try! task.run()
}


// Creates a circle
func createCircle(labeled label:Int) -> Void {
	let task = Process()
	task.executableURL = URL(fileURLWithPath:convertPath)

	let x = Int.random(in: 4...12)
	let y = Int.random(in: 4...12)

	let points:Array = [y, mx-x, my-y, x]
	let r            = points.min()! - 2

	task.arguments = [
	"-size", "16x16",
	"-depth", "8",
	"xc:white",
  "-fill",   "white",
	"-stroke", "black",
	"-draw",   "circle \(x),\(y) \(x+r),\(y)",
	"circle\(label).png"
	]

	try! task.run()
}

// Create ten thousand of each shape
print("Reticulating splines...")
for i in 0..<10000 {
	createCircle(labeled:i)
	createRectangle(labeled:i)
	createTriangle(labeled:i)
	createSquare(labeled:i)
}

