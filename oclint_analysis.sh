if which oclint 2>/dev/null; then
	echo 'oclint exist'
else
	brew tap oclint/formulae
	brew install oclint
fi
if which xcpretty 2>/dev/null; then
	echo 'xcpretty exist'
else
	gem install xcpretty
fi

xcodebuild -project TestOClint.xcodeproj \
-scheme TestOClint  \
-configuration Debug \
clean

xcodebuild -project TestOClint.xcodeproj  -sdk iphoneos -configuration Debug COMPILER_INDEX_STORE_ENABLE=NO -scheme TestOClint | tee xcodebuild.log | xcpretty -r json-compilation-database -o compile_commands.json
# cp build/reports/compilation_db.json compile_commands.json
oclint-json-compilation-database -e Pods -- \
--verbose \
-report-type html \
-rc=LONG_VARIABLE_NAME=20 \
-rc=ShortVariableName=4 \
-rc=LONG_CLASS=700 \
-rc=LONG_METHOD=80 \
-rc=LONG_LINE=200 \
-rc=NCSS_METHOD=120 \
-rc=NESTED_BLOCK_DEPTH=5 \
-rc=TOO_MANY_FIELDS=20 \
-rc=TOO_MANY_METHODS=30 \
-rc=TOO_MANY_PARAMETERS=6 \
-max-priority-1=100000 \
-max-priority-2=100000 \
-max-priority-3=100000 \
-o=report.html
open ./report.html
# python oclint.py compile_commands.json
