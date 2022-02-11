CPP = g++
CXXFLAGS = -Wall -O2
OBJS = foo.o bar.o main.o

TARGET = foobar

all: foobar

foo.o: foo.h foo.cpp
	$(CPP) $(CXXFLAGS) -c foo.cpp

bar.o: bar.h bar.cpp
	$(CPP) $(CxxFLAGS) -c bar.cpp

main.o: main.cpp foo.h bar.h
	$(CPP) $(CXXFLAGS) -c main.cpp

$(TARGET) : $(OBJS)
	$(CPP) $(CXXFLAGS) $(OBJS) -o $(TARGET)

.PHONY: clean all
clean:
	rm -fv $(OBJS) $(TARGET)
