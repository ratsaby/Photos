#!/bin/zsh

JAVA="/Applications/Apache NetBeans.app/Contents/Home/bin/java"
JAR="/Users/ratsaby/Documents/MyStuff/My OpenTimeStamps/java-opentimestamps/target/OtsCli.jar"

SCRIPT_DIR="${0:A:h}"
PHOTO_DIR="$SCRIPT_DIR/Norway"
OUTPUT="$PHOTO_DIR/verification_results.txt"

: > "$OUTPUT"

for f in "$PHOTO_DIR"/*.ots(N); do
    echo "========================================" | tee -a "$OUTPUT"
    echo "Upgrading: $f" | tee -a "$OUTPUT"
    "$JAVA" -jar "$JAR" upgrade "$f" 2>&1 | tee -a "$OUTPUT"

    echo "Verifying: $f" | tee -a "$OUTPUT"
    "$JAVA" -jar "$JAR" verify "$f" 2>&1 | tee -a "$OUTPUT"

    echo "Waiting 5 seconds..." | tee -a "$OUTPUT"
    sleep 5
done

echo "Results saved to: $OUTPUT"