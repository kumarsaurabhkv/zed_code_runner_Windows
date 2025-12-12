# ![Zed Logo](https://camo.githubusercontent.com/90b9de11129b288948cc68b5037640d13a723d27a525238d9ea24a96a5d48493/68747470733a2f2f696d672e736869656c64732e696f2f656e64706f696e743f75726c3d68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a65642d696e64757374726965732f7a65642f6d61696e2f6173736574732f62616467652f76302e6a736f6e) Zed IDE – Run Current File Setup



A **ready-to-use setup for Zed IDE** that lets you run the currently open file with a single keypress (F5). Supports multiple programming languages and automatically shows output in the Zed terminal panel.

---

## 🌟 Features

- Press **F5** to run any code file instantly  
- Supports multiple languages:
  - C, C++  
  - Python  
  - Java  
  - JavaScript (Node.js)  
  - TypeScript (Deno)  
  - Go  
  - Rust   
  - PHP  
- Prevents overlapping runs of the same task  
- Compiled binaries go to `build_out  
- Terminal panel opens automatically  

---


## 📦 Installation

1. **Clone this repository**

```bash
https://github.com/kumarsaurabhkv/zed_code_runner_Windows.git

```
2. **Copy files to Zed config directory**

```bash
mkdir "%APPDATA%\Zed"
copy keymap.jsonc tasks.json custom_runfile.bat "%APPDATA%\Zed\"
```

## 🚀 Usage

Open a file in Zed IDE

Press F5

The terminal panel will display the output

Compiled binaries (if any) are stored in the build_out folder as the source.

⚠️ Pressing F5 while the task is already running will not start a new instance (prevents conflicts).
