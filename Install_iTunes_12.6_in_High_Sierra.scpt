--Script to install iTunes 12.6.5.3 in macOS High Sierra, along iTunes 12.8.2 
--Download iTunes 12.6.5.3 dmg from https://support.apple.com/kb/HT208079
set theDMG to choose file with prompt "Please select iTunes dmg file:" of type {"dmg"}
do shell script "hdiutil mount " & quoted form of POSIX path of theDMG
do shell script "pkgutil --expand /Volumes/iTunes/Install\\ iTunes.pkg ~/tmp"
do shell script "hdiutil unmount /Volumes/iTunes/"
do shell script "cd ~/tmp/iTunesX.pkg; cat Payload | gunzip -dc |cpio -i; ditto ~/tmp/iTunesX.pkg/Applications/iTunes.app /Applications/iTunes12.6.app;"
do shell script "rm -rf ~/tmp"
display dialog "iTunes12.6.app was copied to /Applications" buttons {"Ok"}
