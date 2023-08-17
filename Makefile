# Makefile

# Compiler options
CC = g++
CFLAGS = -Wall -Wextra

# Directories
SRCDIR = .
BUILDDIR = build
INSTALLDIR = $(BUILDDIR)/usr/bin

# Files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp,$(BUILDDIR)/%.o,$(SOURCES))
EXECUTABLE = $(BUILDDIR)/app

# Targets
.PHONY: all clean install

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

clean:
	rm -rf $(BUILDDIR)

install: $(EXECUTABLE)
	mkdir -p $(INSTALLDIR)
	cp $< $(INSTALLDIR)

