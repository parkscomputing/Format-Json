# Format-Json
A simple PowerShell cmdlet for formatting JSON

The cmdlet takes a JSON string or file path as input and formats it with pretty-printing. 
If the input is a file path, the file content is read and treated as a JSON string. 
The formatted JSON is then written to the pipeline.

## Syntax
```
Format-Json [[-InputObject] <String>] [<CommonParameters>]
```

## Examples
```powershell
Format-Json '{"name": "John", "age": 30}'
```
Output:
```
{
    "name": "John",
    "age": 30
}
```

```powershell
Format-Json -InputObject 'C:\path\to\file.json'
```

Output:
```
{
    "name": "John",
    "age": 30
}
```
{
    "name": "John",
    "age": 30
}

```powershell
echo '{"name": "John", "age": 30}' | Format-Json
```

Output:
```
{
    "name": "John",
    "age": 30
}
```

