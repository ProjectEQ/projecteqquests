#! /bin/bash
# This uses bashisms to do ProcessSubstitution so we can modify $error in
# the subshell (while loop)

error=0

echo "Checking Perl scripts..."
# perl sadly outputs "Syntax OK" on stderr, so gotta filter that out :/
# it's significantly faster to not save the output of the first perl -c call ... and just call it again
while read s
do
    if ! perl -c "$s" 2>/dev/null; then
        perl -c "$s"
        ((error=1))
    fi
done < <(find . -name "*.pl")

echo "Checking Lua scripts..."

# this has the issue of stopping once an error happens (won't find all bad files)
# it is a lot faster than looping like above though ...
if ! find . -name "*.lua" -exec luac -p '{}' + ; then
    error=1
fi

exit $error

