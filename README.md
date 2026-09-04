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

| 包名 | 说明 | 版本 |
|------|------|------|
| webview-capi | C API for WebView2 (DLL + 头文件) | 1.0.0 |
| webview-mini | 最小 WebView2 封装 (单头文件) | 1.0.0 |

## 支持平台

- Windows (WebView2)
- Android (WebView)
- macOS (WKWebView)
- Linux (WebKitGTK)
- WASM (纯前端)

## 支持语言

C / Python / TypeScript / Rust / Go / Java / Zig / C# / 易语言
