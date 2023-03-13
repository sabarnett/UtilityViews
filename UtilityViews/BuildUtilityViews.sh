echo 'Build the iphone archive'
rm -r './build/UtilityViews.framework-iphoneos.xcarchive'

xcodebuild docbuild \
-scheme UtilityViews \
-destination 'generic/platform=iOS' \
-quiet

xcodebuild archive \
-scheme UtilityViews \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/UtilityViews.framework-iphoneos.xcarchive' \
-quiet \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES 

echo 'Delete iphone simulator archive and rebuild'
rm -r './build/UtilityViews.framework-iphonesimulator.xcarchive'

xcodebuild docbuild \
-scheme UtilityViews \
-destination 'generic/platform=iOS Simulator' \
-quiet

xcodebuild archive \
-scheme UtilityViews \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/UtilityViews.framework-iphonesimulator.xcarchive' \
-quiet \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

echo 'Delete xcframework and rebuild'
rm -r './build/UtilityViews.xcframework'
xcodebuild -create-xcframework \
-framework './build/UtilityViews.framework-iphoneos.xcarchive/Products/Library/Frameworks/UtilityViews.framework' \
-framework './build/UtilityViews.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/UtilityViews.framework' \
-output './build/UtilityViews.xcframework'
