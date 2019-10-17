# General make variables
OBJS = main.o
SOURCE = main.cpp
OUT = main.out
CC = g++

# SourcePro Flags
# This example relies on the Internationalization module of SourcePro.
# For more information, please visit the SourcePro build guide.
# https://docs.roguewave.com/en/sourcepro/current/HTML/index.html#page/Rogue%2520Wave%2520Component%2520Builder%2520(RCB)%2Frcbbd-i18n.16.1.html%23
ICU_HOME = ${SOURCEPRO}/3rdparty/icu-58.2/linux/em64t
SOURCEPRO_FLAGS = -I${SOURCEPRO} -I$(ICU_HOME)/include -D_RWCONFIG=15s
SOURCEPRO_LFLAGS = \
	-L${SOURCEPRO}/lib -L$(ICU_HOME)/lib \
	-li18n15s -licudata -licui18n -licuuc \
	-lthread15s -litc15s -lfunctor_list15s \
	-lfunctor15s -lpointer15s -lsync15s \
	-lthrexcept15s -ltrace15s -ltls15s -pthread

# Compose final flag variables
FLAGS = -g -c -Wall $(SOURCEPRO_FLAGS)
LFLAGS = $(SOURCEPRO_LFLAGS)

all: $(OBJS)
	$(CC) -g $(OBJS) -o $(OUT) $(LFLAGS)

main.o: main.cpp
	$(CC) $(FLAGS) main.cpp -std=c++11

clean:
	rm -f $(OBJS) $(OUT)
