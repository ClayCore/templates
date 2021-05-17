set(
    WINDOWS_SEARCH_PATHS
    "E:/mingw/lib"
    "E:/mingw/mingw/lib"
    "$ENV{WINSDK_DIR}/Lib/x64"
    "$ENV{WINSDK_HOME}/Lib/x64"
    "$ENV{DXSDK_DIR}/Lib/x64"
    "Q:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/Lib"
    "Q:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/Lib/x64"
    "Q:/Program Files (x86)/Microsoft SDKs/Windows/v7.1/Lib"
    "Q:/Program Files (x86)/Microsoft SDKs/Windows/v7.1A/Lib"
    "Q:/Program Files (x86)/Microsoft SDKs/Windows/v7.1A/Lib/x64"
    "Q:/Program Files (x86)/Windows Kits/10/Lib/10.0.14393.0/um/x86"
    "Q:/Program Files (x86)/Windows Kits/10/Lib/10.0.15063.0/um/x86"
    "Q:/Program Files (x86)/Windows Kits/8.0/Lib/win8/um/x86"
    "Q:/Program Files (x86)/Windows Kits/8.1/Lib/winv6.3/um/x86"
    "Q:/Program Files/Microsoft SDKs/Windows/v6.0/Lib"
    "Q:/Program Files/Microsoft SDKs/Windows/v6.0/Lib/x64"
    "Q:/Program Files/Microsoft SDKs/Windows/v6.0a/Lib"
    "Q:/Program Files/Microsoft SDKs/Windows/v6.0a/Lib/x64"
    "Q:/Program Files/Microsoft SDKs/Windows/v6.1/Lib"
    "Q:/Program Files/Microsoft SDKs/Windows/v6.1/Lib/x64"
    "Q:/Program Files/Microsoft SDKs/Windows/v7.0A/Lib"
    "Q:/Program Files/Microsoft SDKs/Windows/v7.0A/Lib/x64"
    "Q:/Program Files/Microsoft SDKs/Windows/v7.1/Lib/x64"
    "Q:/Program Files/Microsoft SDKs/Windows/v7.1A/Lib/x64"
    "Q:/Program Files/Microsoft Visual Studio 9/VC/PlatformSDK/Lib/AMD64"
)

set(WIN32_SEARCH_PATHS ${DEPENDENCIES_PATH}/win32 ${WINDOWS_SEARCH_PATHS})

# TODO: Finish this