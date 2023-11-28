CC = g++
CFLAGS = -Wall -O2
LDFLAGS =

TARGET = quicksort
SOURCE = quicksort.cpp

all: $(TARGET)

$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE) $(LDFLAGS)

clean:
	rm -f $(TARGET)
