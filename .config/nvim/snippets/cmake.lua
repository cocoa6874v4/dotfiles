local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {

    s("cmake", {
        t({ "cmake_minimum_required(VERSION 3.20)", "project(" }),
        i(1, "main"),
        t({ " LANGUAGES CXX)", "set(CMAKE_CXX_STANDARD " }),
        i(2, "20"),
        t({ ")", "set(CMAKE_CXX_STANDARD_REQUIRED ON)", "set(CMAKE_CXX_EXTENSIONS OFF)", "", "add_executable(" }),
        rep(1),
        t({ "", "\t" }),
        i(3, "src/main.cpp"),
    }),

    -- target_include_directories
    s("tinclude", {
        t("target_include_directories("),
        i(1, "main"),
        t({ " PRIVATE", "\t" }),
        i(2, "include"),
        t({ "", ")" }),
    }),

    -- target_link_libraries
    s("tlink", {
        t("target_link_libraries("),
        i(1, "main"),
        t({ " PRIVATE", "\t" }),
        i(2, "lib"),
        t({ "", ")" }),
    }),

    -- find_package
    s("findpkg", {
        t("find_package("),
        i(1, "PackageName"),
        t(" "),
        i(2, ""),
        t("REQUIRED)"),
    }),

    -- add_library
    s("addlib", {
        t("add_library("),
        i(1, "name"),
        t(" "),
        i(2, "STATIC"),
        t({ "", "\t" }),
        i(3, "src/file.cpp"),
        t({ "", ")" }),
    }),

    -- add_subdirectory
    s("subdir", {
        t("add_subdirectory("),
        i(1, "dir"),
        t(")"),
    }),

    -- target_compile_options (clang + ninja 向け)
    s("tcompile", {
        t("target_compile_options("),
        i(1, "main"),
        t({ " PRIVATE", "\t-Wall -Wextra -Wpedantic -O2", ")" }),
    }),

}

