# Lyco WebView xmake Mirror

xmake 包镜像,支持 `add_requires("webview-capi")` 一键引入。

## 使用方法

### 1. 添加镜像源

```lua
-- xmake.lua
add_repositories("lyco-mirror https://github.com/lilyco-42/xmake-mirror.git")
```

### 2. 引入包

```lua
add_requires("webview-capi")

target("my-app")
    set_kind("binary")
    add_files("src/main.c")
    add_packages("webview-capi")
    add_syslinks("user32", "shell32", "ole32", "oleaut32", "shlwapi", "version")
target_end()
```

### 3. 构建

```bash
xmake
xmake run
```

## 可用包

| 包名 | 说明 | 版本 | 安装平台 |
|------|------|------|---------|
| webview-capi | C API for WebView2（DLL + 导入库 + 头文件） | 1.1.0 | windows / mingw |
| webview-mini | 最小 WebView2 封装（单头文件 + 预编译静态库） | 1.1.0 | mingw |

本仓这两个包目前**只覆盖 Windows**。`webview-mini` 只带了 MinGW 预编译静态库，
MSVC 请用 `webview-capi`（它提供 DLL + 导入库）。

## 配方来源

`packages/w/webview-mini/xmake.lua` 在
[webview-mini 仓库](https://github.com/lilyco-42/webview-mini) 里也有一份
（`packages/webview-mini/xmake.lua`）。用户通过 `add_repositories` 拿到的是**本仓**这份，
所以改配方时请以本仓为准，并同步回仓库内那份。

## 支持平台

- Windows (WebView2)
- Android (WebView)
- macOS (WKWebView)
- Linux (WebKitGTK)
- WASM (纯前端)

> 上面是底层 WebView 封装本身覆盖的平台；本镜像的包只提供 Windows 的预编译产物。

## 支持语言

C / Python / TypeScript / Rust / Go / Java / Zig / C# / 易语言
