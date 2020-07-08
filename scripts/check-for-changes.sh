git fetch > /dev/null 2>&1
#CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
# For now, just assume we are on master branch
HEAD_HASH=$(git rev-parse HEAD)
UPSTREAM_HASH=$(git rev-parse master@{upstream})

if [ "$HEAD_HASH" != "$UPSTREAM_HASH" ] 
then
	git merge --ff-only @{u} > /dev/null 2>&1
	cd ../
	git config user.email "change@checker.com"
	git config user.name "Change Checker"
	git add .
	git commit -m "CHANGE CHECKER: updated to latest JUCE"
	git push
	echo true
else
	echo false
fi


