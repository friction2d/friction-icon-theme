#!/bin/sh
set -e -x

if [ -d "build" ]; then
    rm -rf build
fi
mkdir build

actool friction.icon \
    --compile build \
    --app-icon friction \
    --platform macosx \
    --target-device mac \
    --minimum-deployment-target 11.0 \
    --output-partial-info-plist build/PartialInfo.plist

if [ ! -d "Resources" ]; then
    mkdir Resources
fi

cp -f build/Assets.car Resources/
cp -f build/friction.icns Resources/
