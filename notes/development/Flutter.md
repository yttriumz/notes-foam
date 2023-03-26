# Flutter

- [Flutter](#flutter)
	- [Command line tool](#command-line-tool)
	- [Dart project files](#dart-project-files)
	- [Recommended Settings for VSCode](#recommended-settings-for-vscode)
	- [Flutter with Rust](#flutter-with-rust)
		- [flutter\_rust\_bridge](#flutter_rust_bridge)
			- [dependencies](#dependencies)
				- [Flutter](#flutter-1)
				- [Rust](#rust)

## Command line tool

References:

- [flutter: The Flutter command-line tool](https://docs.flutter.dev/reference/flutter-cli)

## Dart project files

References:

- [What not to commit](https://dart.dev/guides/libraries/private-files)

## Recommended Settings for VSCode

<details>
<summary>config</summary>

```json
{
	// Causes the debug view to automatically appear when a breakpoint is hit. This
	// setting is global and not configurable per-language.
	"debug.openDebug": "openOnDebugBreak",

	// By default, VS Code will only switch to the Debug Console when you start
	// debugging the first time in a session. This setting tells VS Code to always
	// switch to the Debug Console when starting a session, so you can see the
	// programs output.
	"debug.internalConsoleOptions": "openOnSessionStart",

	"[dart]": {
		// Automatically format code on save and during typing of certain characters
		// (like `;` and `}`).
		"editor.formatOnSave": true,
		"editor.formatOnType": true,

		// Draw a guide line at 80 characters, where Dart's formatting will wrap code.
		"editor.rulers": [80],

		// Disables built-in highlighting of words that match your selection. Without
		// this, all instances of the selected text will be highlighted, interfering
		// with Dart's ability to highlight only exact references to the selected variable.
		"editor.selectionHighlight": false,

		// By default, VS Code prevents code completion from popping open when in
		// "snippet mode" (editing placeholders in inserted code). Setting this option
		// to `false` stops that and allows completion to open as normal, as if you
		// weren't in a snippet placeholder.
		"editor.suggest.snippetsPreventQuickSuggestions": false,

		// By default, VS Code will pre-select the most recently used item from code
		// completion. This is usually not the most relevant item.
		//
		// "first" will always select top item
		// "recentlyUsedByPrefix" will filter the recently used items based on the
		//     text immediately preceding where completion was invoked.
		"editor.suggestSelection": "first",

		// Allows pressing <TAB> to complete snippets such as `for` even when the
		// completion list is not visible.
		"editor.tabCompletion": "onlySnippets",

		// By default, VS Code will populate code completion with words found in the
		// current file when a language service does not provide its own completions.
		// This results in code completion suggesting words when editing comments and
		// strings. This setting will prevent that.
		"editor.wordBasedSuggestions": false,
	}
}
```

</details>

References:

- https://dartcode.org/docs/recommended-settings/

## Flutter with Rust

### flutter_rust_bridge

#### dependencies

##### Flutter

1. `flutter pub add --dev ffigen && flutter pub add ffi`.

##### Rust

1. A working `llvm` for FFI.
   - On openSUSE I installed `clang-devel` package which satisfies it.
2. `cargo install flutter_rust_bridge_codegen`.
3. `cargo install cargo-ndk` (for Android)
4. Add cross compilation targets:

   ```bash
   rustup target add \
   # ARM64 Android
   aarch64-linux-android \
   # ARMv7a Android
   armv7-linux-androideabi \
   # 64-bit x86 Android
   x86_64-linux-android \
   # 32-bit x86 Android6
   i686-linux-android
   ```

References:

- https://cjycode.com/flutter_rust_bridge/integrate/deps.html
- https://cjycode.com/flutter_rust_bridge/tutorial/setup_android.html
- https://cjycode.com/flutter_rust_bridge/template/setup_android.html
- https://rust-lang.github.io/rustup/cross-compilation.html
