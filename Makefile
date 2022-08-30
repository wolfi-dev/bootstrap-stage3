ARCH := $(shell uname -m)
MELANGE_DIR ?= ../melange
MELANGE ?= ${MELANGE_DIR}/melange
KEY ?= local-melange.rsa
REPO ?= $(shell pwd)/packages

M4_VERSION ?= 1.4.19-r1
BISON_VERSION ?= 3.8.2-r1
FLEX_VERSION ?= 2.6.4-r0
ZLIB_VERSION ?= 1.2.12-r1
BZIP2_VERSION ?= 1.0.8-r0
PERL_VERSION ?= 5.36.0-r0
NCURSES_VERSION ?= 6.3-r1
TEXINFO_VERSION ?= 6.8-r0
GMP_VERSION ?= 6.2.1-r2
ISL_VERSION ?= 0.24-r1
BINUTILS_VERSION ?= 2.39-r1
GAWK_VERSION ?= 5.1.1-r1
MPFR_VERSION ?= 4.1.0-r2
MPC_VERSION ?= 1.2.1-r1
GCC_VERSION ?= 12.2.0-r2

MELANGE_OPTS ?= \
	--repository-append ${REPO} \
	--keyring-append ${KEY}.pub \
	--signing-key ${KEY} \
	--pipeline-dir ${MELANGE_DIR}/pipelines \
	--arch ${ARCH}

MELANGE_DEFOPTS ?= --empty-workspace

PACKAGES = \
	packages/${ARCH}/m4-${M4_VERSION}.apk \
	packages/${ARCH}/bison-${BISON_VERSION}.apk \
	packages/${ARCH}/flex-${FLEX_VERSION}.apk \
	packages/${ARCH}/zlib-${ZLIB_VERSION}.apk \
	packages/${ARCH}/bzip2-${BZIP2_VERSION}.apk \
	packages/${ARCH}/perl-${PERL_VERSION}.apk \
	packages/${ARCH}/ncurses-${NCURSES_VERSION}.apk \
	packages/${ARCH}/texinfo-${TEXINFO_VERSION}.apk \
	packages/${ARCH}/gmp-${GMP_VERSION}.apk \
	packages/${ARCH}/isl-${ISL_VERSION}.apk \
	packages/${ARCH}/binutils-${BINUTILS_VERSION}.apk \
	packages/${ARCH}/gawk-${GAWK_VERSION}.apk \
	packages/${ARCH}/mpfr-${MPFR_VERSION}.apk \
	packages/${ARCH}/mpc-${MPC_VERSION}.apk \
	packages/${ARCH}/gcc-${GCC_VERSION}.apk

all: ${KEY} ${PACKAGES}

packages/${ARCH}/m4-${M4_VERSION}.apk:
	${MELANGE} build m4.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/bison-${BISON_VERSION}.apk:
	${MELANGE} build bison.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/flex-${FLEX_VERSION}.apk:
	${MELANGE} build flex.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/zlib-${ZLIB_VERSION}.apk:
	${MELANGE} build zlib.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/bzip2-${BZIP2_VERSION}.apk:
	${MELANGE} build bzip2.yaml ${MELANGE_OPTS} --source-dir ./bzip2/
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/perl-${PERL_VERSION}.apk:
	${MELANGE} build perl.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/ncurses-${NCURSES_VERSION}.apk:
	${MELANGE} build ncurses.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/texinfo-${TEXINFO_VERSION}.apk:
	${MELANGE} build texinfo.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/gmp-${GMP_VERSION}.apk:
	${MELANGE} build gmp.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/isl-${ISL_VERSION}.apk:
	${MELANGE} build isl.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/binutils-${BINUTILS_VERSION}.apk:
	${MELANGE} build binutils.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/gawk-${GAWK_VERSION}.apk:
	${MELANGE} build gawk.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/mpfr-${MPFR_VERSION}.apk:
	${MELANGE} build mpfr.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/mpc-${MPC_VERSION}.apk:
	${MELANGE} build mpc.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

packages/${ARCH}/gcc-${GCC_VERSION}.apk:
	${MELANGE} build gcc.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}
	apk index -o packages/${ARCH}/APKINDEX.tar.gz packages/${ARCH}/*.apk --allow-untrusted
	melange sign-index --signing-key ${KEY} packages/${ARCH}/APKINDEX.tar.gz

${KEY}:
	${MELANGE} keygen ${KEY}

clean:
	rm -rf packages/${ARCH}
