### 🛠 **How to Install ncurses on macOS, Linux (Debian-based), and Windows 11**

---

## **🖥 macOS (Homebrew)**
On macOS, install `ncurses` using **Homebrew**:

```sh
brew install ncurses
```

After installation, you may need to tell the compiler where to find `ncurses`:
```sh
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"
```

To verify the installation:
```sh
brew list ncurses
```

---

## **🐧 Linux (Debian-based, e.g., Ubuntu)**
On **Debian-based** systems like Ubuntu, Linux Mint, or Debian itself, use **APT**:

```sh
sudo apt update
sudo apt install libncurses5-dev libncursesw5-dev
```

To verify the installation:
```sh
dpkg -l | grep ncurses
```

---

## **🖥 Windows 11 (Using WSL or Cygwin/MSYS2)**
Since Windows **does not natively support ncurses**, you have **three options**:

### **1️⃣ Windows Subsystem for Linux (WSL)**
The easiest way is to use **WSL** (Windows Subsystem for Linux) with Ubuntu or Debian.

1. Install **WSL**:
   ```sh
   wsl --install
   ```

2. Open WSL (Ubuntu or Debian) and install `ncurses`:
   ```sh
   sudo apt update
   sudo apt install libncurses5-dev libncursesw5-dev
   ```

3. Compile and run your COBOL program inside WSL.

---

### **2️⃣ MSYS2 (Recommended for Native Windows)**
If you want to compile directly on Windows without WSL, use **MSYS2**:

1. **Download MSYS2** from [msys2.org](https://www.msys2.org/)
2. Open the **MSYS2 terminal** and run:
   ```sh
   pacman -S mingw-w64-x86_64-ncurses
   ```
3. Set environment variables:
   ```sh
   export PATH=/mingw64/bin:$PATH
   ```

4. Verify with:
   ```sh
   pacman -Q | grep ncurses
   ```

---

### **3️⃣ Cygwin (Alternative)**
If you're using **Cygwin**, install `ncurses` using the Cygwin setup tool:

1. Download **Cygwin** from [cygwin.com](https://www.cygwin.com/)
2. Run the **Cygwin installer** and select:
   ```
   ncurses-devel
   ```
3. Verify with:
   ```sh
   cygcheck -c | grep ncurses
   ```

---

### **🚀 Summary Table**
| **OS**          | **Install Command** |
|----------------|---------------------|
| **macOS** (Homebrew) | `brew install ncurses` |
| **Ubuntu/Debian** | `sudo apt install libncurses5-dev libncursesw5-dev` |
| **Windows 11 (WSL)** | `wsl --install` + `sudo apt install ncurses` |
| **Windows 11 (MSYS2)** | `pacman -S mingw-w64-x86_64-ncurses` |
| **Windows 11 (Cygwin)** | Install `ncurses-devel` via Cygwin setup |

---

### **🔥 Final Check**
After installation, check if `ncurses` is properly installed:
```sh
ldconfig -p | grep ncurses  # Linux/macOS
```
or on Windows MSYS2:
```sh
pacman -Q | grep ncurses
```

Now you’re ready to compile and run your **ncurses-based COBOL application**! 🚀 Let me know if you need further assistance! 😊