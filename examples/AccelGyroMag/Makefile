include $(PWD)/config.mk
FOLDER_NAME = examples/AccelGyroMag

SRCS = $(wildcard *.cpp)
EXES = $(SRCS:.cpp=)

default: $(EXES)

%: %.cpp
		$(MAKE_EXAMPLE)
