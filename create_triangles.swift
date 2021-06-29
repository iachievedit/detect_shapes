#!/usr/bin/env swift

import Foundation

// Creates a triangle
func createTriangle(labeled label:Int) -> Void {
	let task = Process()
	task.executableURL = URL(fileURLWithPath:"/opt/homebrew/bin/convert")

	let p1x = Int.random(in: 1...7)
        let p1y = Int.random(in: 1...7)

	let p2x = Int.random(in: 1...7)
        let p2y = Int.random(in: 9...15)

	let p3x = Int.random(in: 9...15)
        let p3y = Int.random(in: 1...15)

	task.arguments = [
	"-size", "16x16",
	"-depth", "8",
	"xc:white",
        "-fill",   "white",
	"-stroke", "black",
	"-draw",   "line \(p1x),\(p1y) \(p2x),\(p2y) line \(p2x),\(p2y) \(p3x),\(p3y) line \(p3x),\(p3y) \(p1x),\(p1y)",
	"triangle\(label).png"
	]

	try! task.run()
}

for i in 0..<50000 {
	createTriangle(labeled:i)
}

