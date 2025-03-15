# COBOL ncurses Library

![COBOL](https://img.shields.io/badge/COBOL-Blue?style=for-the-badge&logo=cobol)

> **Disclaimer:** This repository is being migrated from an old Debian Linux Subversion repository. It is also being adapted to be compatible with **macOS, Linux, and Windows** for both **x86 and ARM** architectures. The project is currently **unstable**, so please be patient as the migration progresses.


This repository provides a **COBOL interface to the ncurses library**, allowing COBOL programs to create text-based user interfaces with advanced terminal handling capabilities.

## Features
- **COBOL bindings** for the `ncurses` library.
- **Terminal-based UI support** in COBOL.
- **Compatible with GNU COBOL**.

## Installation
Before using this library, ensure you have both **GNU COBOL** and **ncurses** installed.

- 📜 [Install GNU COBOL](./INSTALL-GNUCOBOL.md)
- 📜 [Install ncurses](./INSTALL-NCURSES.md)

### Clone the Repository
```bash
git clone https://github.com/luismr/cobol-ncurses-lib.git
cd cobol-ncurses-lib
```

## Directory Structure
```
📦 cobol-ncurses-lib
 ├── 📂 src          # COBOL source code for ncurses bindings
 ├── 📂 include      # Header files and COBOL copybooks
 ├── 📂 samples      # Sample COBOL programs using ncurses
 ├── 📂 docs         # Documentation files
 ├── 📜 INSTALL-GNUCOBOL.md  # GNU COBOL installation guide
 ├── 📜 INSTALL-NCURSES.md   # ncurses installation guide
 ├── 📜 LICENSE      # License file
 ├── 📜 README.md    # Project documentation
 ├── 📜 Makefile     # Makefile to build the project
```

## Build System (Make Targets)
The project uses `make` to build and manage the compiled output. Available targets:

### Build the Library
```bash
make build
```
This compiles the COBOL source files and links them with the `ncurses` library.

### Build All (Default Target)
```bash
make all
```
Compiles the library and all sample programs.

### Build and Run Samples
```bash
make samples
```
Compiles the sample programs in the `samples/` directory.

### Clean Build Files
```bash
make clean
```
Removes compiled binaries and object files.

## Usage
After installation, you can run the sample programs located in the `samples/` directory:

```bash
./samples/sample_program
```
Replace `sample_program` with the actual executable name.

## Documentation
For detailed setup and usage instructions, refer to:
- [`INSTALL-GNUCOBOL.md`](./INSTALL-GNUCOBOL.md)
- [`INSTALL-NCURSES.md`](./INSTALL-NCURSES.md)

## Contributing
Contributions are welcome! Feel free to submit issues or pull requests.

## License
This project is licensed under the **MIT License**. See the [`LICENSE`](./LICENSE.md) file for details.

