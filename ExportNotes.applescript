-- ExportNotes.applescript
-- This script exports all notes from the macOS Notes app into individual text files.

-- Prompt the user to select a folder to save the exported notes
set exportFolder to choose folder with prompt "Select the folder where you want to save the exported notes"

-- Access the Notes application
tell application "Notes"
    -- Initialize a list to collect all notes
    set allNotes to {}
    
    -- Iterate through each account (e.g., iCloud, On My Mac)
    repeat with aAccount in accounts
        -- Iterate through each folder within the account
        repeat with aFolder in folders of aAccount
            -- Collect all notes from the folder
            set allNotes to allNotes & (notes of aFolder)
        end repeat
    end repeat

    -- Export each note as a text file
    repeat with aNote in allNotes
        -- Get the note's name and content
        set noteTitle to name of aNote
        set noteContent to body of aNote

        -- Clean the note's title to make it a valid filename
        set cleanTitle to my cleanFileName(noteTitle)

        -- Define the full file path for the exported note
        set filePath to (exportFolder as text) & cleanTitle & ".txt"

        -- Write the note's content to the file
        my writeToFile(noteContent, filePath)
    end repeat
end tell

-- Handler to clean the filename by removing illegal characters
on cleanFileName(fileName)
    set illegalCharacters to ":/\\?%*|\"<>"
    set cleanedName to ""
    repeat with i from 1 to length of fileName
        set currentChar to character i of fileName
        if illegalCharacters contains currentChar or currentChar is in {"\n", "\r"} then
            set cleanedName to cleanedName & "_"
        else
            set cleanedName to cleanedName & currentChar
        end if
    end repeat
    return cleanedName
end cleanFileName

-- Handler to write content to a file
on writeToFile(content, filePath)
    try
        -- Open the file for writing
        set fileRef to open for access file filePath with write permission
        -- Clear the file's existing content
        set eof of fileRef to 0
        -- Write the new content as UTF-8 text
        write content to fileRef as «class utf8»
        -- Close the file
        close access fileRef
    on error errMsg number errNum
        -- Display an error message if something goes wrong
        display dialog "Error: " & errMsg
    end try
end writeToFile
