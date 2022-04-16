#${ARCH}  is either x86_64 or arm64 to build universal binary from Makefile

all:
	 make -f Makefile-stepwise ARCH=arm64
	 rm *.o
	 make -f Makefile-stepwise ARCH=x86_64
	 rm *.o
	 lipo -create -output stepwise.bin stepwise_x86_64.bin stepwise_arm64.bin
	 cp stepwise.bin ../SAM/Sandia/osx

clean:
	$(RM) *.o *.bin *.mod

