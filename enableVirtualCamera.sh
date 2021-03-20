#!/bin/bash

backup_and_unsign () {
app_path=$1
rm -R "$app_path.bak"
cp -Rf "$app_path" "$app_path.bak"
sudo codesign --remove-signature "$app_path"
for helperAppFile in "$app_path"/Contents/Frameworks/*.app
do
  sudo codesign --remove-signature "$helperAppFile"
done
}

# Microsoft Teams
# from https://answers.microsoft.com/en-us/msteams/forum/all/mac-obs-virtual-camera-not-appearing-in-teams/8b266745-be5b-4684-8764-9a52ae4d6f1c
backup_and_unsign "/Applications/Microsoft Teams.app"


# Zoom
# from https://nerdschalk.com/how-to-fix-virtual-camera-not-working-problem-on-zoom/
# note: may not be needed with latest Zoom. Removing to test.
# app_path="/Applications/zoom.us.app"

# Slack
backup_and_unsign "/Applications/Slack.app"