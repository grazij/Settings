import SwiftUI

extension NSImage {
	static var empty: NSImage { NSImage(size: .zero) }
}

extension NSView {
	@discardableResult
	func constrainToSuperviewBounds() -> [NSLayoutConstraint] {
		guard let superview else {
			preconditionFailure("superview has to be set first")
		}

		translatesAutoresizingMaskIntoConstraints = false

		let constraints = [
			leadingAnchor.constraint(equalTo: superview.leadingAnchor),
			trailingAnchor.constraint(equalTo: superview.trailingAnchor),
			topAnchor.constraint(equalTo: superview.topAnchor),
			bottomAnchor.constraint(equalTo: superview.bottomAnchor)
		]

		NSLayoutConstraint.activate(constraints)

		return constraints
	}
}

extension Bundle {
	var appName: String {
		string(forInfoDictionaryKey: "CFBundleDisplayName")
			?? string(forInfoDictionaryKey: "CFBundleName")
			?? string(forInfoDictionaryKey: "CFBundleExecutable")
			?? "<Unknown App Name>"
	}

	private func string(forInfoDictionaryKey key: String) -> String? {
		// `object(forInfoDictionaryKey:)` prefers localized info dictionary over the regular one automatically
		object(forInfoDictionaryKey: key) as? String
	}
}

@available(macOS 10.15, *)
extension View {
	/**
	Equivalent to `.eraseToAnyPublisher()` from the Combine framework.
	*/
	func eraseToAnyView() -> AnyView {
		AnyView(self)
	}
}
