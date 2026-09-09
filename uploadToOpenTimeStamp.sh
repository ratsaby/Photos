#!/bin/zsh

JAVA="/Applications/Apache NetBeans.app/Contents/Home/bin/java"
JAR="/Users/ratsaby/Documents/MyStuff/My OpenTimeStamps/java-opentimestamps/target/OtsCli.jar"

for f in *.jpg; do
    echo "Timestamping: $f"
    "$JAVA" -jar "$JAR" stamp "$f"
done
