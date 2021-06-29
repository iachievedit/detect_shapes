#!/usr/bin/env swift

import Foundation

// Creates a circle
func createCircle(labeled label:Int) -> Void {
	let task = Process()
	task.executableURL = URL(fileURLWithPath:"/opt/homebrew/bin/convert")

	let cx = Int.random(in: 4...12)

	task.arguments = [
	"-size", "16x16",
	"-depth", "8",
	"xc:white",
        "-fill",   "white",
	"-stroke", "black",
	"-draw",   "circle \(cx),8 10,8",
	"circle_\(label).png"
	]

	try! task.run()
}

for i in 0..<50000 {
	createCircle(labeled:i)
}

