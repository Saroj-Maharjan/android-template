
currentVersionCode=$(awk '/versionCode = / {print $3}' $GITHUB_WORKSPACE/app/app.gradle.kts | head -1 ) # Regex filter to grab 2 from "versionCode 2"

#Regex filter to grab 2.0 from "versionName '2.0'"
# versionNameSuffix can also match,therefore pulling only the first result
currentVersionName=$(awk '/versionName = / {print $3}' $GITHUB_WORKSPACE/app/app.gradle.kts | head -1 | sed 's/\"//g')

echo "$currentVersionName"
status=$?

if [ "$status" = 0 ]; then
  echo "Current Version Code : $currentVersionCode"
else
  echo "Failed to get the current version code. Exiting..."
  exit 1
fi



echo "New Version Code:$currentVersionCode"
echo "Version Name: $currentVersionName"
new_tag="v$currentVersionName($currentVersionCode)" # New tag becomes v1.0(3)
echo "New Tag: $new_tag"
echo "NEW_TAG=$new_tag" >> $GITHUB_ENV # Setting this for use later

echo "Updating CurrentVersionCode by 1 and changing file versionCode"

let "currentVersionCode=currentVersionCode+1" # Bumping versionCode By one
sed -i 's/versionCode [0-9A-Za-z]*/versionCode '$currentVersionCode'/' $GITHUB_WORKSPACE/app/app.gradle



