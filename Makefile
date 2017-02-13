ifeq ($(shell uname),Darwin)
    LDFLAGS := -Wl,-dead_strip -L./target/debug -L.
else
    LDFLAGS := -Wl,--gc-sections -lpthread -L./target/debug -L.
endif

all: target/summation
	target/summation

target:
	mkdir -p $@

#example dynamic linking
target/summation: target/main.o target/debug/librust_sum.so
	$(CC) -o $@ $< $(LDFLAGS) -lrust_sum

#example static linking
#target/summation: target/main.o target/debug/librust_sum.so
#	$(CC) -o $@ $^ $(LDFLAGS)

target/debug/librust_sum.so: src/lib.rs Cargo.toml
	cargo build

target/main.o: src/main.c | target
	$(CC) -o $@ -c $<

clean:
	rm -rf target
