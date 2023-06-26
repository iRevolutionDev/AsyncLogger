workspace "AsyncLogger"
    configurations { "Debug", "Release" }
    platforms { "x64", "x86" }

project "AsyncLogger"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    targetdir "bin/%{cfg.buildcfg}"
    objdir "bin-int/%{cfg.buildcfg}"
    version "0.0.1"
    description "A lightweight C++20 asyncronous logger."
    includedirs { "include", "src" }
    files { "src/**.cpp", "src/**.hpp", "include/**.hpp" }
    precompiledheader "src/common.hpp"
    flags { "MultiProcessorCompile" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

    filter "system:linux"
        links { "pthread" }

    filter "system:windows"
        defines { "_CRT_SECURE_NO_WARNINGS" }
