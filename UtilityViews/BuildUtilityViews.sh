xcodebuild clean -scheme UtilityViews -quiet

echo '*** Delete the iphone archive and rebuild'
rm -r './build/UtilityViews.framework-iphoneos.xcarchive'

echo 'Build the documentation'
xcodebuild docbuild \
-scheme UtilityViews \
-destination 'generic/platform=iOS' \
-quiet

echo 'Build the framework'
xcodebuild archive \
-scheme UtilityViews \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/UtilityViews.framework-iphoneos.xcarchive' \
-quiet \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES 

echo '*** Delete iphone simulator archive and rebuild'
rm -r './build/UtilityViews.framework-iphonesimulator.xcarchive'

echo 'Build the documentation'
xcodebuild docbuild \
-scheme UtilityViews \
-destination 'generic/platform=iOS Simulator' \
-quiet

echo 'Build the framework'
xcodebuild archive \
-scheme UtilityViews \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/UtilityViews.framework-iphonesimulator.xcarchive' \
-quiet \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo '*** Delete xcframework and rebuild'
rm -r './build/UtilityViews.xcframework'

xcodebuild -create-xcframework \
-framework './build/UtilityViews.framework-iphoneos.xcarchive/Products/Library/Frameworks/UtilityViews.framework' \
-framework './build/UtilityViews.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/UtilityViews.framework' \
-output './build/UtilityViews.xcframework'
