#pragma once

// disable deprecation warnings
#ifndef _CRT_SECURE_NO_WARNINGS
    #define _CRT_SECURE_NO_WARNINGS
#endif

// C includes
#include <cassert>
#include <cctype>
#include <cerrno>
#include <cinttypes>
#include <cstdarg>
#include <cstdbool>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

// CPP includes
#include <algorithm>
#include <array>
#include <chrono>
#include <filesystem>
#include <fstream>
#include <functional>
#include <iostream>
#include <iterator>
#include <limits>
#include <list>
#include <map>
#include <mutex>
#include <numeric>
#include <optional>
#include <ostream>
#include <random>
#include <sstream>
#include <stdexcept>
#include <string>
#include <string_view>
#include <thread>
#include <tuple>
#include <type_traits>
#include <unordered_map>
#include <utility>
#include <vector>

// Graphics
#include "SFML/Graphics.hpp"

// redefinition of the `static` keyword
// helps to differentiate between different `static` use cases
#define local_persist static
#define internal static
#define global static

// Type aliases
using u64   = uint64_t;
using u32   = uint32_t;
using u16   = uint16_t;
using u8    = uint8_t;
using usize = size_t;

using Byte  = u8;
using Word  = u16;
using Dword = u32;
using Qword = u64;

using i64 = int64_t;
using i32 = int32_t;
using i16 = int16_t;
using i8  = int8_t;

using SignedByte  = i8;
using SignedWord  = i16;
using SignedDword = i32;
using SignedQword = i64;

using f32 = float;
using f64 = double;

constexpr uint_fast32_t KB = 1024;
constexpr uint_fast32_t MB = KB * KB;
constexpr uint_fast32_t GB = KB * KB * KB;

// only add the window library when we actually need it
#if defined(__WIN32) || defined(_WIN32) || defined(__CYGWIN__) || defined(__MINGW32__)
    #define WIN32_BUILD
#endif

#ifdef WIN32_BUILD
    #include <windows.h>

using isize = int;

#else
    #include <sys/ioctl.h>
    #include <unistd.h>

using isize = ssize_t;

#endif
