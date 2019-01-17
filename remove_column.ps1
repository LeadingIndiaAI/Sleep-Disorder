$folderPath = 'C:\Users\Beautisaurus\Desktop\gwf\'

# Destination folder for the new files. Be sure to include a backslash after the folder.
$folderPathDest = 'C:\Users\Beautisaurus\Desktop\fgg\'

# Desired columns - enclose in single quotes.
$desiredColumns = "'EEG Fpz-Cz'"

# Generate a list of all files in the folder and pipe it to ForEach-Object
Get-ChildItem $folderPath -Name |

# Loop through each file
ForEach-Object { 

    # Combines source folder path and file name
    $filePath = $folderPath + $_

    # Combines destination folder and file name
    $filePathdest = $folderPathDest + $_

    # Imports CSV file, selects desired columns, and then exports as CSV to the desired destination
    Import-Csv $filePath | Select -Skip 1 |
    Export-Csv -Path $filePathDest –NoTypeInformation
    }