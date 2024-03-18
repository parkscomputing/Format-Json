<#
.SYNOPSIS
    Formats a JSON string or file with pretty-printing.

.DESCRIPTION
    This function takes a JSON string or file path as input and formats it with pretty-printing. If the input is a file path, the file content is read and treated as a JSON string. The formatted JSON is then written to the pipeline.

.PARAMETER InputObject
    The JSON string or file path to format.

.EXAMPLE
    Format-Json '{"name": "John", "age": 30}'
    # Output:
    # {
    #     "name": "John",
    #     "age": 30
    # }

    Format-Json -InputObject 'C:\path\to\file.json'
    # Output:
    # {
    #     "name": "John",
    #     "age": 30
    # }

    echo '{"name": "John", "age": 30}' | Format-Json
    # Output:
    # {
    #     "name": "John",
    #     "age": 30
    # }

#>
function Format-Json {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, Position=0, ValueFromPipeline=$true)]
        [string]$InputObject
    )

    process {
        if ($InputObject -and (Test-Path $InputObject)) {
            # If the input is a file path and the file exists, read the file content
            $jsonString = Get-Content -Path $InputObject -Raw
        } else {
            # Otherwise, treat the input as a JSON string
            $jsonString = $InputObject
        }

        if (-not $jsonString) {
            Write-Error "No input provided or file does not exist."
            return
        }

        try {
            # Convert the JSON string to a PowerShell object and then back to a JSON string with pretty-printing
            $jsonObject = $jsonString | ConvertFrom-Json
            $prettyJson = $jsonObject | ConvertTo-Json -Depth 10
            Write-Output $prettyJson
        } catch {
            Write-Error "Failed to format JSON. Please ensure the input is valid JSON."
        }
    }
}