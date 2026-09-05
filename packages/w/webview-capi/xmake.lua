package("webview-capi")
    set_homepage("https://github.com/lilyco-42/webview-capi")
    set_description("C API for WebView2 - callable from any language (Python/Go/Rust/Node.js)")
    set_license("MIT")

    set_urls("https://github.com/lilyco-42/webview-capi/archive/refs/tags/v$(version).tar.gz",
             "https://github.com/lilyco-42/webview-capi.git")

    add_versions("1.1.0", "11420ea13763ebc82cbc21866e2107884d097fbd4d188c5dca3be506797645d1")

    add_syslinks("user32", "shell32", "ole32", "oleaut32", "shlwapi", "version")

    on_install(function (package)
        -- lib/ 下: webview.h (单头文件) + webview.dll/.lib (预编译)
        os.cp("lib/webview.h", package:installdir("include"))
        if package:is_plat("windows") then
            os.cp("lib/webview.dll", package:installdir("bin"))
            os.cp("lib/webview.lib", package:installdir("lib"))
        end
    end)

    on_test(function (package)
        assert(package:has_cfuncs("webview_create", {includes = "webview.h"}))
    end)
package_end()
