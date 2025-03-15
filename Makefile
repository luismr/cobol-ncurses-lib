# Compiler
COBC = cobc
CC = cc  # C compiler (for linking)

DIR := $(shell mkdir -p bin)
DIR := $(shell mkdir -p lib)

# Directories
SRC_DIR = ./src
BIN_DIR = ./bin
LIB_DIR := $(shell pwd)/lib
SAMPLES_DIR = ./samples
BIN_SAMPLES_DIR = ./samples-bin

# Output shared library
TARGET_LIB = $(LIB_DIR)/ncurses-lib.so

# Find all COBOL source files
SRC = $(wildcard $(SRC_DIR)/*.cbl)
OBJ = $(patsubst $(SRC_DIR)/%.cbl, $(BIN_DIR)/%.o, $(SRC))

# Find all COBOL sample files
SAMPLES = $(wildcard $(SAMPLES_DIR)/*.cbl)
SAMPLES_BIN = $(patsubst $(SAMPLES_DIR)/%.cbl, $(BIN_SAMPLES_DIR)/%, $(SAMPLES))

# Detect Mac Architecture (x86_64 vs arm64)
ARCH := $(shell uname -m)
ifeq ($(ARCH), arm64)
    LDFLAGS ?= -arch arm64 -L/opt/homebrew/opt/ncurses/lib -lcob
    CPPFLAGS ?= -arch arm64 -I/opt/homebrew/opt/ncurses/include
else
    LDFLAGS ?= -arch x86_64 -L/usr/local/opt/ncurses/lib -lcob
    CPPFLAGS ?= -arch x86_64 -I/usr/local/opt/ncurses/include
endif

# Debug flag (default is false)
DEBUG ?= 0

# If DEBUG is enabled, make compilation verbose
ifeq ($(DEBUG), 1)
    VERBOSE = @echo "Compiling and linking: src/*.cbl -> $(TARGET_LIB)";
else
    VERBOSE =
endif

# Default target: Ensure ncurses is installed, then compile everything
all: check-ncurses $(LIB_DIR) $(BIN_DIR) $(TARGET_LIB) samples

# Build only ncurses-lib.so (ignores samples)
build: check-ncurses $(BIN_DIR) $(LIB_DIR) $(OBJ)
	@echo "Linking into shared library: $(TARGET_LIB)..."
	$(CC) -shared -o "$(LIB_DIR)/ncurses-lib.so" $(OBJ) $(LDFLAGS) -lncurses -lcob

# Ensure required directories exist
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(LIB_DIR):
	mkdir -p $(LIB_DIR)

# Compile each COBOL source file to an object file 
$(BIN_DIR)/%.o: $(SRC_DIR)/%.cbl | $(BIN_DIR)
	@echo "Compiling: $< -> $@"
	$(COBC) -c -o $@ $(CPPFLAGS) $<

# Ensure samples-bin directory exists
$(BIN_SAMPLES_DIR):
	mkdir -p $(BIN_SAMPLES_DIR)

# Compile all sample programs and place binaries in samples-bin/
.PHONY: samples
samples: check-ncurses $(BIN_SAMPLES_DIR) $(SAMPLES_BIN)

$(BIN_SAMPLES_DIR)/%: $(SAMPLES_DIR)/%.cbl | $(BIN_SAMPLES_DIR)
	@echo "Compiling sample: $< -> $@"
	LD_LIBRARY_PATH="$(LIB_DIR)":$$LD_LIBRARY_PATH $(COBC) -v -x -o $@ $< -L"$(LIB_DIR)" -lncurses
	# LD_LIBRARY_PATH="$(LIB_DIR)":$$LD_LIBRARY_PATH $(COBC) -v -x -o $@ $< -L"$(LIB_DIR)" -lncurses-lib -lncurses

# Run sample program to verify it works
.PHONY: test-samples
test-samples: samples
	@echo "Running sample program..."
	LD_LIBRARY_PATH="$(LIB_DIR)":$$LD_LIBRARY_PATH ./samples-bin/sample-ncurses-window || (echo "Error: Sample failed to run!" && exit 1)
	@echo "✅ Sample ran successfully!"

# Cross-platform ncurses check
.PHONY: check-ncurses
check-ncurses:
	@echo "Checking for ncurses installation..."
	@unameOut=$$(uname); \
	if [ "$$unameOut" = "Darwin" ]; then \
	    if ! brew --prefix ncurses >/dev/null 2>&1; then \
	        echo "Error: ncurses is not installed on macOS! Install it with:"; \
	        echo "  brew install ncurses"; \
	        exit 1; \
	    fi; \
	elif [ "$$unameOut" = "Linux" ]; then \
	    if command -v dpkg >/dev/null; then \
	        if ! dpkg -l | grep -q libncurses; then \
	            echo "Error: ncurses is not installed! Install it with:"; \
	            echo "  sudo apt install libncurses5-dev libncursesw5-dev"; \
	            exit 1; \
	        fi; \
	    elif command -v ldconfig >/dev/null; then \
	        if ! ldconfig -p | grep -q libncurses; then \
	            echo "Error: ncurses library not found! Install it with:"; \
	            echo "  sudo apt install libncurses5-dev libncursesw5-dev"; \
	            exit 1; \
	        fi; \
	    else \
	        echo "Warning: Unable to check ncurses installation! Proceed with caution."; \
	    fi; \
	elif echo "$$unameOut" | grep -q "MINGW\|MSYS"; then \
	    if ! pacman -Q mingw-w64-x86_64-ncurses >/dev/null 2>&1; then \
	        echo "Error: ncurses is not installed in MSYS2! Install it with:"; \
	        echo "  pacman -S mingw-w64-x86_64-ncurses"; \
	        exit 1; \
	    fi; \
	else \
	    echo "Error: Unsupported OS detected! Please install ncurses manually."; \
	    exit 1; \
	fi
	@echo "ncurses is correctly installed!"

	@echo "Checking LDFLAGS and CPPFLAGS for ncurses..."
	@if ! env | grep -q "LDFLAGS=.*ncurses"; then \
	    echo "Error: LDFLAGS does not contain ncurses. Using fallback: $(LDFLAGS)"; \
	    export LDFLAGS="$(LDFLAGS)"; \
	fi

	@if ! env | grep -q "CPPFLAGS=.*ncurses"; then \
	    echo "Error: CPPFLAGS does not contain ncurses. Using fallback: $(CPPFLAGS)"; \
	    export CPPFLAGS="$(CPPFLAGS)"; \
	fi

	@echo "Environment variables are correctly set!"

# Clean up compiled files
clean:
	rm -rf "$(BIN_DIR)" "$(BIN_SAMPLES_DIR)" "$(LIB_DIR)"
