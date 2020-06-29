--Script to install iTunes 12.6.5.3 or iTunes 12.8.2 in macOS Catalina and Big Sur
--Download iTunes 12.6.5.3 dmg from https://support.apple.com/kb/HT208079
--Download iTunes 12.8.2 dmg from https://support.apple.com/kb/DL1977

set theDMG to choose file with prompt "Please select iTunes dmg file:" of type {"dmg"}
do shell script "hdiutil mount " & quoted form of POSIX path of theDMG
do shell script "pkgutil --expand /Volumes/iTunes/Install\\ iTunes.pkg ~/tmp"
do shell script "hdiutil unmount /Volumes/iTunes/"
do shell script "cd ~/tmp/iTunesX.pkg; cat Payload | gunzip -dc |cpio -i; ditto ~/tmp/iTunesX.pkg/Applications/iTunes.app ~/tmp/iTunes.app;"
do shell script "plutil -replace CFBundleGetInfoString -string 'iTunes 13.6.5.3' ~/tmp/iTunes.app/Contents/Info.plist"
do shell script "plutil -replace CFBundleShortVersionString -string 13.6.5 ~/tmp/iTunes.app/Contents/Info.plist"
do shell script "plutil -replace CFBundleVersion -string 13.6.5 ~/tmp/iTunes.app/Contents/Info.plist"
do shell script "touch ~/tmp/iTunes.app"
do shell script "ditto ~/tmp/iTunes.app /Applications/iTunes.app"
do shell script "rm -rf ~/tmp"
display dialog "iTunes.app was copied to /Applications" buttons {"Ok"}
