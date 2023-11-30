CC = g++
CFLAGS = -Wall -march=native
LDFLAGS =

TARGET = quicksort
SOURCE = quicksort.cpp
PAPITO = papito.cpp



all: $(TARGET)

$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) $(SOURCE) $(PAPITO) -I papi/install/include -L ../papi/install/lib ../papi/install/lib/libpapi.a -o $(TARGET) -lpapi $(LDFLAGS)

clean:
	rm -f $(TARGET)
