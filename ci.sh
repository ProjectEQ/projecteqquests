#! /bin/bash
# This uses bashisms to do ProcessSubstitution so we can modify $error in
# the subshell (while loop)

error=0

echo "Checking Perl scripts..."
# perl sadly outputs "Syntax OK" on stderr, so gotta filter that out :/
while read s
do
    if ! errormsg=$(perl -c "$s" 2>&1); then
        echo "$errormsg"
        ((error=1))
    fi
done < <(find . -name "*.pl")

echo "Checking Lua scripts..."

if ! find . -name "*.lua" -exec luac -p '{}' + ; then
    error=1
fi

exit $error

