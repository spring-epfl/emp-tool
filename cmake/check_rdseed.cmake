unset(RDSEED_COMPILE_RESULT CACHE)
unset(RDSEED_RUN_RESULT CACHE)
try_run(RDSEED_RUN_RESULT RDSEED_COMPILE_RESULT ${CMAKE_BINARY_DIR} ${CMAKE_SOURCE_DIR}/compiler_test/rdseed_instruction_test.c CMAKE_FLAGS ${CMAKE_C_FLAGS})
IF(NOT ${RDSEED_COMPILE_RESULT})
        set(USE_RANDOM_DEVICE ON)
ELSE(NOT ${RDSEED_COMPILE_RESULT})
	string(COMPARE EQUAL "${RDSEED_RUN_RESULT}" "0" RDSEED_RUN_SUCCESS)
        IF(NOT ${RDSEED_RUN_SUCCESS})
                set(USE_RANDOM_DEVICE ON)
        ENDIF(NOT ${RDSEED_RUN_SUCCESS})
ENDIF(NOT ${RDSEED_COMPILE_RESULT})
