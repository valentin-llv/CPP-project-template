CC = g++

CFLAGS  = -std=gnu11 -Wall -Wextra -pedantic

SOURCES := $(shell find . -name "*.cpp")
OBJS = ${SOURCES:.cpp=.o}

OUTPUT = program
OUTPUT_DIR = dist

all: build run

build: ${OBJS}
	@${CC} $(CFLAGS) -o ./${OUTPUT_DIR}/${OUTPUT} ${OBJS}

%.o: %.cpp
	@${CC} -c $< -o $@

run: ${OUTPUT_DIR}/${OUTPUT}
	@./${OUTPUT_DIR}/${OUTPUT}

clean:
	@find . -type f -name '*.o' -exec rm {} +
	@rm -f ./${OUTPUT_DIR}/${OUTPUT}