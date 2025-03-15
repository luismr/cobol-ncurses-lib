# Installing GNU COBOL

GNU COBOL is a free, open-source COBOL compiler that translates COBOL code into C and compiles it using the native C compiler of your system. This guide will walk you through installing GNU COBOL on **Debian-based Linux**, **macOS**, and **Windows**.

---

## Debian-Based Linux (Ubuntu, Debian, etc.)

### 1. Install GNU COBOL from APT (Recommended)
```bash
sudo apt update
sudo apt install gnucobol
```

### 2. Verify Installation
```bash
cobc -V
```
You should see output indicating the installed version of GNU COBOL.

### 3. Compile and Run a COBOL Program
To test your installation, create a simple COBOL program:
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HelloWorld.
       PROCEDURE DIVISION.
           DISPLAY "Hello, COBOL!".
           STOP RUN.
```
Save it as `hello.cbl`, then compile and run:
```bash
cobc -x hello.cbl
./hello
```

---

## macOS (via Homebrew)

### 1. Install Homebrew (if not installed)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install GNU COBOL
```bash
brew install gnu-cobol
```

### 3. Verify Installation
```bash
cobc -V
```

### 4. Compile and Run a COBOL Program
Use the same steps as in the Linux section to test your installation.

---

## Windows (Using MSYS2 or Cygwin)

### Option 1: Install via MSYS2 (Recommended)
1. Download and install [MSYS2](https://www.msys2.org/).
2. Open the **MSYS2 MinGW64 terminal** and update packages:
   ```bash
   pacman -Syu
   pacman -S mingw-w64-x86_64-gnucobol
   ```
3. Verify installation:
   ```bash
   cobc -V
   ```

### Option 2: Install via Cygwin
1. Download and install [Cygwin](https://www.cygwin.com/).
2. Open Cygwin setup, search for `gnucobol`, and install it.
3. Verify installation using `cobc -V`.

### Option 3: Windows Subsystem for Linux (WSL)
1. Enable **WSL** and install a Linux distribution (Ubuntu recommended).
2. Follow the **Debian-based Linux** instructions above.

---

## Troubleshooting

### Missing ncurses?
If you get an error related to **ncurses**, ensure you have installed it. See `INSTALL-NCURSES.md` for instructions.

### Compiler errors?
Ensure you have a working **C compiler** installed (e.g., `gcc` on Linux/macOS or `mingw-w64` on Windows).

---

## More Information
For detailed documentation, visit the [GNU COBOL official page](https://savannah.gnu.org/projects/gnucobol/).

