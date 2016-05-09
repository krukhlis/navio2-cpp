include $(PWD)/config.mk
FOLDER_NAME = examples/LED2

SRCS = $(wildcard *.cpp)
EXES = $(SRCS:.cpp=)

default: $(EXES)

%: %.cpp
		$(MAKE_EXAMPLE)
