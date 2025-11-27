# EmuScript: Centralized Emulator Saves Symlinker for Linux

EmuScript is a Linux shell script to **symlink emulator save folders** from a centralized directory to their original locations, keeping emulators fully functional. You manually organize your save folders in a central location, and EmuScript creates symlinks at the correct target locations.

---

## Supported Emulators

- **Cemu** (Wii U)
- **Azahar** (Nintendo 3DS)
- **Eden** (Nintendo Switch)

> You can easily add new emulators or additional save folders by editing the arrays in the script.

---

## Features

- Creates **symlinks** from the original locations to the centralized folder so emulators continue to work.
- Preserves internal directory structures.
- **Warns and exits** if a real file/folder exists at the target location.
- **Handles broken symlinks** by replacing them.
- **User-agnostic** using `$HOME`.
- **Easy configuration**: just edit the arrays in the script.

---

## Usage

1. Manually organize your emulator save folders in a central directory (default: `~/Games/Emulation/saves`), preserving their internal structure.
2. Edit the script to specify which folders to link for each emulator.
3. Run the script:

```bash
curl -fsSL https://raw.githubusercontent.com/thepaulmcbride/emuscript/main/emuscript.sh | bash
```
