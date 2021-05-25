//
//  ContentView.swift
//  GradientButton
//
//  Created by Akylbek Utekeshev on 5/17/21.
//

import SwiftUI

struct ContentView: View {
	
	@State var angle = 0.0
	
	var colors: [Color] = [.red, .blue, .green, .purple]

	var body: some View {

		Button(action: {
			print("Button pressed")
		}, label: {
			GeometryReader(content: { geometry in
				ZStack {
					AngularGradient(gradient: Gradient(colors: colors),
									center: .center,
									angle: .degrees(angle))
						.blendMode(.overlay)
						.blur(radius: 6)
						.mask(
							RoundedRectangle(cornerRadius: 16)
								.frame(maxWidth: geometry.size.width - 32)
								.frame(height: 48, alignment: .center)
								.blur(radius: 6)
						)
						.onAppear() {
							withAnimation(Animation.linear(duration: 7)
											.repeatForever(autoreverses: false)) {
								angle += 360
							}
						}

					Text("Gradient Button")
						.font(.title2)
						.bold()
						.foregroundColor(Color.black)
						.frame(height: 48)
						.frame(maxWidth: geometry.size.width - 32)
						.background(Color.white)
						.overlay(
							RoundedRectangle(cornerRadius: 16)
								.stroke(Color.white, lineWidth: 1)
								.opacity(0.9)
						)
						.cornerRadius(16)
				}
			})
			.frame(height: 50)
		})
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewLayout(.sizeThatFits)
	}
}
