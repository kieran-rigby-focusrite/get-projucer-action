git fetch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
HEAD_HASH=$(git rev-parse HEAD)
UPSTREAM_HASH=$(git rev-parse $CURRENT_BRANCH@{upstream})

echo $CURRENT_BRANCH
echo $HEAD_HASH
echo $UPSTREAM_HASH

if [ "$HEAD_HASH" != "$UPSTREAM_HASH" ] 
then
	git merge --ff-only @{u} > /dev/null 2>&1
	echo true
else
	echo false
fi


