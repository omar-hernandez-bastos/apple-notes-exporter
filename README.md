# ExportNotes

A simple AppleScript to export all your notes from the macOS **Notes** app into individual text files. This can be useful for backup purposes or to migrate your notes to other applications like Obsidian.

## Features

- Exports all notes from all accounts and folders in the Notes app.
- Saves each note as a separate `.txt` file.
- Cleans note titles to create valid filenames.
- Handles special characters and encodings.

## Requirements

- macOS with the **Notes** app installed.
- **Script Editor** application (built-in on macOS).

## Installation

1. **Download the Script**: Save the `ExportNotes.applescript` file to your computer.

2. **Open the Script**:
   - Navigate to where you saved the script.
   - Double-click the `ExportNotes.applescript` file to open it in **Script Editor**.

## Usage

1. **Run the Script**:
   - In **Script Editor**, click the `Run` button (looks like a "Play" icon).

2. **Grant Permissions**:
   - The first time you run the script, you may be prompted to grant permissions.
   - Go to **System Preferences** > **Security & Privacy** > **Privacy** > **Automation**.
   - Ensure that **Script Editor** (or the app you're using) is allowed to control **Notes**.

3. **Select Export Folder**:
   - A dialog will appear asking you to select the folder where you want the notes to be saved.
   - Choose or create a folder and click **Choose**.

4. **Wait for Completion**:
   - The script will process all your notes and save them as `.txt` files in the selected folder.
   - A dialog will appear if there are any errors.

## Troubleshooting

- **Permissions Error**:
  - If you encounter a permissions error, ensure that **Script Editor** is allowed to access **Notes** and the selected folder.
  - You might need to add **Script Editor** under **Full Disk Access** in **System Preferences** > **Security & Privacy** > **Privacy**.

- **Special Characters in Titles**:
  - The script cleans note titles to remove characters that are illegal in filenames.
  - Illegal characters are replaced with an underscore (`_`).

- **Duplicate Note Titles**:
  - If you have multiple notes with the same title, later notes may overwrite earlier ones.
  - Consider modifying the script to append a unique identifier (like a timestamp) to filenames.

## Customization

- **Change File Format**:
  - To save notes as Markdown (`.md`) files, change the file extension in the script:
    ```applescript
    set filePath to (exportFolder as text) & cleanTitle & ".md"
    ```

- **Adjust Encoding**:
  - The script writes files using UTF-8 encoding to support special characters.

## Contributing

Feel free to submit issues or pull requests if you have suggestions or improvements.

## License

This project is licensed under the MIT License.

## Disclaimer

This script is provided as-is without any warranty. Use it at your own risk. Always ensure you have backups of your notes before running scripts that modify or export data.

