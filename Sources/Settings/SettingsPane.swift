import AppKit

extension Settings {
	public struct PaneIdentifier: Hashable, RawRepresentable, Codable, Sendable {
		public let rawValue: String

		public init(rawValue: String) {
			self.rawValue = rawValue
		}
	}
}

/**
A protocol that view controllers must conform to in order to be used as a settings pane.

Implement this protocol on your `NSViewController` subclass to create a pane that can be displayed in the settings window.

```swift
final class GeneralSettingsViewController: NSViewController, SettingsPane {
    let paneIdentifier = Settings.PaneIdentifier("general")
    let paneTitle = "General"
    let toolbarItemIcon = NSImage(systemSymbolName: "gearshape", accessibilityDescription: "General settings")!
}
```
*/
public protocol SettingsPane: NSViewController {
	/**
	A unique identifier for this pane.

	Used for state restoration and programmatic pane switching.
	*/
	var paneIdentifier: Settings.PaneIdentifier { get }

	/**
	The title displayed in the toolbar and window title.
	*/
	var paneTitle: String { get }

	/**
	The icon displayed in the toolbar.

	Defaults to an empty image if not implemented.
	*/
	var toolbarItemIcon: NSImage { get }
}

extension SettingsPane {
	public var toolbarItemIdentifier: NSToolbarItem.Identifier {
		paneIdentifier.toolbarItemIdentifier
	}

	public var toolbarItemIcon: NSImage { .empty }
}

extension Settings.PaneIdentifier {
	public init(_ rawValue: String) {
		self.init(rawValue: rawValue)
	}

	public init(fromToolbarItemIdentifier itemIdentifier: NSToolbarItem.Identifier) {
		self.init(rawValue: itemIdentifier.rawValue)
	}

	public var toolbarItemIdentifier: NSToolbarItem.Identifier {
		NSToolbarItem.Identifier(rawValue)
	}
}
