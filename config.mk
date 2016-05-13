# DIRS
BUILD_DIR = $(PWD)/build
BIN_DIR = $(BUILD_DIR)/bin
LIB_DIR = $(BUILD_DIR)/lib
LIB_BUILD_DIR = $(BUILD_DIR)/navio2
EXAMPLES_BIN_DIR = $(BIN_DIR)/examples
EXAMPLES_BUILD_DIR = $(BUILD_DIR)/examples


# C COMPILER
CC = g++
FLAGS = -std=c++11 -Wall
INCLUDES = -I/usr/include -I/usr/local/include -I$(PWD)/include
LIBS = -L$(PWD)/build/lib -lnavio2
CFLAGS = $(FLAGS) $(INCLUDES)

# ARCHIVER
AR = ar
ARFLAGS = crs

# COMMANDS
MAKE_OBJ = \
	echo "CC [$<]"; \
	$(CC) $(CFLAGS) -c $< -o $@;

MAKE_EXAMPLE = \
	echo "EXAMPLE [$<]"; \
	$(CC) -c $< -o $(EXAMPLES_BUILD_DIR)/$@.o $(CFLAGS); \
	$(CC) $(CFLAGS) $(EXAMPLES_BUILD_DIR)/$@.o \
		-o $(EXAMPLES_BIN_DIR)/$@ $(LIBS);

MAKE_STATIC_LIB = \
	echo "AR [$@]"; \
	$(AR) $(ARFLAGS) $@ $(wildcard $(LIB_BUILD_DIR)/*.o);
