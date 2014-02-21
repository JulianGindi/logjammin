# LogJammin'
### A minimal command line todo list and note taking system
![logjammin](http://ecx.images-amazon.com/images/I/51L4PdH5xKL._SL500_AA280_.jpg)

## Functionality

### Todos
<img src="http://cl.ly/image/2a3J2N2M1u3A/todo.png", height="150", width="380">

`todo` - lists all todos (now and later)

`todo [now|later]` - lists todos for now OR later

`todo [now|later] <todo>` - adds new todo to either list

`todo done <text>` - removes todo with specified text

`todo [now|later] edit` - opens either list in vim

### Notes

`note` - lists all notes

`note <note_name>` - opens specified note in vim (with autocomplete, and "fuzzy" matching)

`note new <new_name>` - creates a new note and opens vim

`note peek <note_name>` - shows the first few lines of a given note

### Set-up

1. Source todo.sh in your .zshrc (or elsewhere) - `. ~/.todo/todo.sh`
2. Create a Notes and Todo directory (I put them in Dropbox)
3. Copy the provided "now.txt" and "later.txt" files into the Todo directory
4. Make sure the $NOTES and $TODO variables point to the correct locations (set in todo.sh)
