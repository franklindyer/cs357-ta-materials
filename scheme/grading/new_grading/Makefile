# ###############################################
# Change
# ###############################################
HW_NAME=hw1
HW_TEST_CASES=hw1-testcases.rkt

SUBMISSION_SEC_1_ZIP=${HW_NAME}/submissions1.zip
SUBMISSION_SEC_2_ZIP=${HW_NAME}/submissions2.zip
# ###############################################

# ####################################################################
# Do not change
# ####################################################################
SANDBOX_SCHEME=scripts/scheme_grader/sandbox-grader.rkt

HW_TEST_CASES_PREFIX=test-cases
SECTION_1_DIR_SUFFIX=submissions-section1
SECTION_2_DIR_SUFFIX=submissions-section2
SECTION_1_FEEDBACK_DIR_SUFFIX=feedback-section1
SECTION_2_FEEDBACK_DIR_SUFFIX=feedback-section2
SECTION_1_WITH_ERRORS_DIR_SUFFIX=syntax-errors-section1
SECTION_2_WITH_ERRORS_DIR_SUFFIX=syntax-errors-section2

SUBMISSION_SEC_1_FILES=${HW_NAME}/${SECTION_1_DIR_SUFFIX}
SUBMISSION_SEC_2_FILES=${HW_NAME}/${SECTION_2_DIR_SUFFIX}
FEEDBACK_SEC_1_FILES=${HW_NAME}/${SECTION_1_FEEDBACK_DIR_SUFFIX}
FEEDBACK_SEC_2_FILES=${HW_NAME}/${SECTION_2_FEEDBACK_DIR_SUFFIX}
WITH_ERRORS_SEC_1_FILES=${HW_NAME}/${SECTION_1_WITH_ERRORS_DIR_SUFFIX}
WITH_ERRORS_SEC_2_FILES=${HW_NAME}/${SECTION_2_WITH_ERRORS_DIR_SUFFIX}
# ####################################################################

.PHONY: unpack_hw run_grader all clean

all: unpack_hw run_grader

unpack_hw:
	bash ./scripts/unpack_submission/unpack.sh \
		${HW_NAME} \
		${SUBMISSION_SEC_1_ZIP} \
		${SUBMISSION_SEC_2_ZIP}

run_grader:
	./scripts/scheme_grader/grader \
		${SANDBOX_SCHEME} \
		${HW_TEST_CASES_PREFIX}/${HW_TEST_CASES} \
		${SUBMISSION_SEC_1_FILES} \
		${FEEDBACK_SEC_1_FILES} \
		${WITH_ERRORS_SEC_1_FILES}
	./scripts/scheme_grader/grader \
		${SANDBOX_SCHEME} \
		${HW_TEST_CASES_PREFIX}/${HW_TEST_CASES} \
		${SUBMISSION_SEC_2_FILES} \
		${FEEDBACK_SEC_2_FILES} \
		${WITH_ERRORS_SEC_2_FILES}

clean:
	rm -rf ${SUBMISSION_SEC_1_FILES}
	rm -rf ${SUBMISSION_SEC_2_FILES}
	rm -rf ${FEEDBACK_SEC_1_FILES}
	rm -rf ${FEEDBACK_SEC_2_FILES}
	rm -rf ${WITH_ERRORS_SEC_1_FILES}
	rm -rf ${WITH_ERRORS_SEC_2_FILES}
