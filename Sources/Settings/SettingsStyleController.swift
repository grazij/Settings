import AppKit

/**
Protocol for implementing different tab selection styles in the settings window.

Conforming types handle the visual representation of tab switching, such as toolbar items
or segmented controls. The protocol provides methods for creating toolbar items and
managing tab selection state.

- SeeAlso: ``ToolbarItemStyleViewController``
- SeeAlso: ``SegmentedControlStyleViewController``
*/
protocol SettingsStyleController: AnyObject {
	/// The delegate that receives tab activation events.
	var delegate: SettingsStyleControllerDelegate? { get set }

	/// Whether the window should remain horizontally centered when resizing during tab switches.
	var isKeepingWindowCentered: Bool { get }

	/// Returns the toolbar item identifiers for the settings window toolbar.
	func toolbarItemIdentifiers() -> [NSToolbarItem.Identifier]

	/// Creates a toolbar item for the given pane identifier.
	/// - Parameter paneIdentifier: The identifier of the pane to create a toolbar item for.
	/// - Returns: A configured toolbar item, or `nil` if the identifier is not recognized.
	func toolbarItem(paneIdentifier: Settings.PaneIdentifier) -> NSToolbarItem?

	/// Updates the visual selection state to reflect the given tab index.
	/// - Parameter index: The index of the tab to select.
	func selectTab(index: Int)
}

/**
Delegate protocol for receiving tab activation events from a style controller.

The tab view controller conforms to this protocol to handle tab switches initiated
by user interaction with toolbar items or segmented controls.
*/
protocol SettingsStyleControllerDelegate: AnyObject {
	/// Activates the tab with the given pane identifier.
	/// - Parameters:
	///   - paneIdentifier: The identifier of the pane to activate.
	///   - animated: Whether to animate the transition.
	func activateTab(paneIdentifier: Settings.PaneIdentifier, animated: Bool)

	/// Activates the tab at the given index.
	/// - Parameters:
	///   - index: The index of the tab to activate.
	///   - animated: Whether to animate the transition.
	func activateTab(index: Int, animated: Bool)
}
