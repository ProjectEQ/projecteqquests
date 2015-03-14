#!/bin/sh
echo "Checking Perl scripts..."
find . -name "*.pl" \
| while read s
do
        if ! perl -c "$s" 2>/dev/null; then
                echo "$s is invalid."
        fi
done
echo "Checking Lua scripts..."
find . -name "*.lua" \
| while read s
do
        if ! luac -p "$s" 2>/dev/null; then
                echo "$s is invalid."
        fi
done
echo "Script check completed."