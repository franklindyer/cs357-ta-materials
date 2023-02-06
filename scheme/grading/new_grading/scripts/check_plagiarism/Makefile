MOSS=./scripts/moss
DOWNLOAD_DIR=~/Downloads
SUBMISSIONS_DIR=./submissions
MOSS_REPORT=moss_request_report.txt

REQUEST_TITLE="CS 357: Homework 1 Sections 1 & 2"
OUT_DIR=hw1

.PHONY: get_files submissions_dir \
	request clone_website process_statistics\
	check check2 \
	clean

get_files:
	cp ${DOWNLOAD_DIR}/"$(zipfile)" ${SUBMISSIONS_DIR}
	unzip ${SUBMISSIONS_DIR}/"$(zipfile)" -d ${SUBMISSIONS_DIR}

submissions_dir:
	@if [ ! -d ${SUBMISSIONS_DIR} ]; then\
		mkdir ${SUBMISSIONS_DIR};\
	fi
	make get_files zipfile=submissions.zip
	make get_files zipfile=submissions\(1\).zip

request: ${MOSS}
	#${MOSS} -l scheme -c ${REQUEST_TITLE} ${SUBMISSIONS_DIR}/*.rkt
	${MOSS} -c ${REQUEST_TITLE} ${SUBMISSIONS_DIR}/*.rkt > ${MOSS_REPORT}

clone_website: ${MOSS_REPORT}
	$(shell wget -mkEpnp -e robots=off \
		$(shell tail -n 1 ${MOSS_REPORT}))
	@if [ ! -d ./out/${OUT_DIR} ]; then\
		mkdir ./out/${OUT_DIR};\
	fi
	mv ${MOSS_REPORT} ./out/${OUT_DIR}
	mv moss.stanford.edu ./out/${OUT_DIR}

check: ${MOSS}
	make submissions_dir
	make check2

check2: ${MOSS}
	make request
	make clone_website

${MOSS}:
	gpg -d moss.gpg > $@
	chmod ug+x $@

clean:
	rm -rf ${SUBMISSIONS_DIR}
