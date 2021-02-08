Adds a comment to every quest comma delimiting the item ids found in the file.

Comment is simply:
`items: 1234, 1235, 1236`

If you manually add any items, put a ! before
`!items: 1234, 1235, 1236, 1237`

The ! prefix makes the parser not replace the old line.


from root of projecteqquests dir: `go run utility/itemcomment/itemcomment.go` to regenerate