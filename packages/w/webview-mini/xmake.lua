package("webview-mini")
    set_homepage("https://github.com/lilyco-42/webview-mini")
    set_description("Minimal WebView2 wrapper - vendored webview/webview, prebuilt MinGW static lib")
    set_license("MIT")

    set_urls("https://github.com/lilyco-42/webview-mini/archive/refs/tags/v$(version).tar.gz",
             "https://github.com/lilyco-42/webview-mini.git")

    add_versions("1.1.0", "e54dc5d394a2dde64b401dd60cc3c9a3faca6c7f8a69847ac351e065360dd8a1")

    add_syslinks("user32", "shell32", "ole32", "oleaut32", "shlwapi", "version", "uuid", "dwmapi")

    on_load(function (package)
        -- C 消费者链 C++ 静态库需要 C++ 运行时 (mingw)
        if package:is_plat("mingw") then
            package:add("links", "webview", "stdc++")
        end
    end)

    -- 仓库目前仅提供 MinGW 预编译静态库; MSVC 用户请用 webview-capi 包
    on_install("mingw", function (package)
        os.cp("webview.h", package:installdir("include"))
        os.cp("lib/libwebview.a", package:installdir("lib"))
    end)

    on_test(function (package)
        assert(package:has_cfuncs("webview_create", {includes = "webview.h"}))
    end)
package_end()
