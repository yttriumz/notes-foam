# Flutter

- [Flutter](#flutter)
	- [Docs](#docs)
	- [Command line tool](#command-line-tool)
	- [Dart project files](#dart-project-files)
	- [Recommended Settings for VSCode](#recommended-settings-for-vscode)
	- [Naming conventions](#naming-conventions)
	- [Project structure](#project-structure)
	- [Flutter with Rust](#flutter-with-rust)
		- [flutter\_rust\_bridge](#flutter_rust_bridge)
			- [Dependencies](#dependencies)
				- [Flutter side](#flutter-side)
				- [Rust side](#rust-side)
			- [Build Rust code](#build-rust-code)
				- [Automate the build process](#automate-the-build-process)
			- [Template codes](#template-codes)

## Docs

- [Flutter documentation](https://docs.flutter.dev/)
- [Learn Flutter any way you want](https://flutter.dev/learn)
- [Flutter Samples](https://flutter.github.io/samples/#)

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

## Naming conventions

References:

- [Naming Convention in Dart Programming Language Flutter](https://medium.com/@farhanaslam910/naming-convention-in-dart-programming-language-flutter-95feda7a8f4b)

## Project structure

References:

- [Flutter – File Structure](https://www.geeksforgeeks.org/flutter-file-structure/)
- [Flutter Project Structure: Feature-first or Layer-first?](https://codewithandrea.com/articles/flutter-project-structure/)
- [Scalable Folder Structure for Flutter Applications](https://medium.com/flutter-community/scalable-folder-structure-for-flutter-applications-183746bdc320)

## Flutter with Rust

### flutter_rust_bridge

#### Dependencies

##### Flutter side

1. `flutter pub add --dev ffigen && flutter pub add ffi`.

References: See [[#Rust side]]'s references.

##### Rust side

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
- https://doc.rust-lang.org/nightly/rustc/platform-support/android.html

#### Build Rust code

You should use the following commands to build the Rust code (because the emulator is x86 instead of arm, although the Pixel phone is armv8):

```bash
cargo ndk -t x86 -o ../android/app/src/main/jniLibs build
```

References:

- https://cjycode.com/flutter_rust_bridge/tutorial/setup_android.html#cargo-ndk
- https://github.com/fzyzcjy/flutter_rust_bridge/issues/385#issuecomment-1061823207

##### Automate the build process

References:

- [ ] todo

- https://stackoverflow.com/questions/69515032/how-to-integrate-flutter-apps-build-process-with-rust-code-i-e-when-building

#### Template codes

Get the template here: https://github.com/Desdaemon/flutter_rust_bridge_template

[//begin]: # "Autogenerated link references for markdown compatibility"
[#Rust side]: Flutter.md "Flutter"
[//end]: # "Autogenerated link references"
