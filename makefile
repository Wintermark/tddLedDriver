# ==========================================
#   Unity Project - A Test Framework for C
#   Copyright (c) 2007 Mike Karlesky, Mark VanderVoord, Greg Williams
#   [Released under MIT License. Please refer to license.txt for details]
# ========================================== 

C_COMPILER=gcc
TARGET_BASE1=test1
TARGET_EXTENSION=.out

TARGET1 = $(TARGET_BASE1)$(TARGET_EXTENSION)
SRC_FILES1=../src/unity.c src/ProductionCode.c  test/TestProductionCode.c  test/no_ruby/TestProductionCode_Runner.c

INC_DIRS=-Isrc -I../src
SYMBOLS=-DTEST

ifeq ($(OSTYPE),cygwin)
        CLEANUP = rm -f build/*.o ; rm -f $(TARGET) ; mkdir -p build
else ifeq ($(OS),Windows_NT)
	CLEANUP = del /F /Q build\* && del /F /Q $(TARGET1) && del /F /Q $(TARGET2)
else
	CLEANUP = rm -f build/*.o ; rm -f $(TARGET1) ; rm -f $(TARGET2)
endif

all: clean default

default:
#	ruby auto/generate_test_runner.rb test/TestProductionCode.c  test/no_ruby/TestProductionCode_Runner.c
#	ruby auto/generate_test_runner.rb test/TestProductionCode2.c test/no_ruby/TestProductionCode2_Runner.c
	$(C_COMPILER) $(INC_DIRS) $(SYMBOLS) $(SRC_FILES1) -o $(TARGET1)
	$(C_COMPILER) $(INC_DIRS) $(SYMBOLS) $(SRC_FILES2) -o $(TARGET2)
	./$(TARGET1)
	./$(TARGET2)

clean:
	$(CLEANUP)
	
