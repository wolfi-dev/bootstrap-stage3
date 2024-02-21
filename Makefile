ARCH ?= $(shell uname -m)
MELANGE_DIR ?= ../melange
MELANGE ?= ${MELANGE_DIR}/melange
KEY ?= local-melange.rsa
REPO ?= $(shell pwd)/packages
CACHE_DIR ?= gs://wolfi-sources/

M4_VERSION ?= 1.4.19-r1
BISON_VERSION ?= 3.8.2-r1
FLEX_VERSION ?= 2.6.4-r0
ZLIB_VERSION ?= 1.2.13-r0
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
GCC_VERSION ?= 12.2.0-r5
GMAKE_VERSION ?= 4.3-r1
PKGCONF_VERSION ?= 1.9.3-r1
WOLFI_BASELAYOUT_VERSION ?= 1-r2
XZ_VERSION ?= 5.2.6-r1
PAX_UTILS_VERSION ?= 1.3.4-r1
PATCH_VERSION ?= 2.7.6-r1
LINUX_HEADERS_VERSION ?= 5.16.9-r1
EXPAT_VERSION ?= 2.5.0-r0
GDBM_VERSION ?= 1.23-r0
LIBFFI_VERSION ?= 3.4.2-r0
MPDECIMAL_VERSION ?= 2.5.1-r0
OPENSSL_VERSION ?= 3.0.7-r0
READLINE_VERSION ?= 8.1.2-r0
SQLITE_VERSION ?= 3.39.2-r0
PYTHON3_VERSION ?= 3.10.6-r0
LIBXCRYPT_VERSION ?= 4.4.36-r0
GLIBC_VERSION ?= 2.36-r0
BUSYBOX_VERSION ?= 1.35.0-r2
CA_CERTIFICATES_VERSION ?= 20220614-r1
GZIP_VERSION ?= 1.12-r1
GREP_VERSION ?= 3.7-r1
FILE_VERSION ?= 5.43-r0
SED_VERSION ?= 4.8-r1
WGET_VERSION ?= 1.21.3-r1
BUILD_BASE_VERSION ?= 1-r2
SCDOC_VERSION ?= 1.11.2-r0
APK_TOOLS_VERSION ?= 2.12.9-r1
WOLFI_KEYS_VERSION ?= 1-r0
WOLFI_BASE_VERSION ?= 1-r0

MELANGE_OPTS ?= \
	--repository-append ${REPO} \
	--keyring-append ${KEY}.pub \
	--signing-key ${KEY} \
	--pipeline-dir ${MELANGE_DIR}/pipelines \
	--arch ${ARCH} \
	--cache-dir ${CACHE_DIR}

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
	packages/${ARCH}/gcc-${GCC_VERSION}.apk \
	packages/${ARCH}/make-${GMAKE_VERSION}.apk \
	packages/${ARCH}/pkgconf-${PKGCONF_VERSION}.apk \
	packages/${ARCH}/wolfi-baselayout-${WOLFI_BASELAYOUT_VERSION}.apk \
	packages/${ARCH}/xz-${XZ_VERSION}.apk \
	packages/${ARCH}/pax-utils-${PAX_UTILS_VERSION}.apk \
	packages/${ARCH}/patch-${PATCH_VERSION}.apk \
	packages/${ARCH}/linux-headers-${LINUX_HEADERS_VERSION}.apk \
	packages/${ARCH}/expat-${EXPAT_VERSION}.apk \
	packages/${ARCH}/gdbm-${GDBM_VERSION}.apk \
	packages/${ARCH}/libffi-${LIBFFI_VERSION}.apk \
	packages/${ARCH}/mpdecimal-${MPDECIMAL_VERSION}.apk \
	packages/${ARCH}/openssl-${OPENSSL_VERSION}.apk \
	packages/${ARCH}/readline-${READLINE_VERSION}.apk \
	packages/${ARCH}/sqlite-${SQLITE_VERSION}.apk \
	packages/${ARCH}/python3-${PYTHON3_VERSION}.apk \
	packages/${ARCH}/libxcrypt-${LIBXCRYPT_VERSION}.apk \
	packages/${ARCH}/glibc-${GLIBC_VERSION}.apk \
	packages/${ARCH}/busybox-${BUSYBOX_VERSION}.apk \
	packages/${ARCH}/ca-certificates-${CA_CERTIFICATES_VERSION}.apk \
	packages/${ARCH}/gzip-${GZIP_VERSION}.apk \
	packages/${ARCH}/grep-${GREP_VERSION}.apk \
	packages/${ARCH}/file-${FILE_VERSION}.apk \
	packages/${ARCH}/sed-${SED_VERSION}.apk \
	packages/${ARCH}/wget-${WGET_VERSION}.apk \
	packages/${ARCH}/build-base-${BUILD_BASE_VERSION}.apk \
	packages/${ARCH}/scdoc-${SCDOC_VERSION}.apk \
	packages/${ARCH}/apk-tools-${APK_TOOLS_VERSION}.apk \
	packages/${ARCH}/wolfi-keys-${WOLFI_KEYS_VERSION}.apk \
	packages/${ARCH}/wolfi-base-${WOLFI_BASE_VERSION}.apk

all: ${KEY} ${PACKAGES}

packages/${ARCH}/m4-${M4_VERSION}.apk:
	${MELANGE} build m4.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/bison-${BISON_VERSION}.apk:
	${MELANGE} build bison.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/flex-${FLEX_VERSION}.apk:
	${MELANGE} build flex.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/zlib-${ZLIB_VERSION}.apk:
	${MELANGE} build zlib.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/bzip2-${BZIP2_VERSION}.apk:
	${MELANGE} build bzip2.yaml ${MELANGE_OPTS} --source-dir ./bzip2/

packages/${ARCH}/perl-${PERL_VERSION}.apk:
	${MELANGE} build perl.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/ncurses-${NCURSES_VERSION}.apk:
	${MELANGE} build ncurses.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/texinfo-${TEXINFO_VERSION}.apk:
	${MELANGE} build texinfo.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/gmp-${GMP_VERSION}.apk:
	${MELANGE} build gmp.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/isl-${ISL_VERSION}.apk:
	${MELANGE} build isl.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/binutils-${BINUTILS_VERSION}.apk:
	${MELANGE} build binutils.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/gawk-${GAWK_VERSION}.apk:
	${MELANGE} build gawk.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/mpfr-${MPFR_VERSION}.apk:
	${MELANGE} build mpfr.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/mpc-${MPC_VERSION}.apk:
	${MELANGE} build mpc.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/gcc-${GCC_VERSION}.apk:
	${MELANGE} build gcc.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/make-${GMAKE_VERSION}.apk:
	${MELANGE} build make.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/pkgconf-${PKGCONF_VERSION}.apk:
	${MELANGE} build pkgconf.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/wolfi-baselayout-${WOLFI_BASELAYOUT_VERSION}.apk:
	${MELANGE} build wolfi-baselayout.yaml ${MELANGE_OPTS} --source-dir ./wolfi-baselayout/

packages/${ARCH}/xz-${XZ_VERSION}.apk:
	${MELANGE} build xz.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/pax-utils-${PAX_UTILS_VERSION}.apk:
	${MELANGE} build pax-utils.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/patch-${PATCH_VERSION}.apk:
	${MELANGE} build patch.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/linux-headers-${LINUX_HEADERS_VERSION}.apk:
	${MELANGE} build linux-headers.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/expat-${EXPAT_VERSION}.apk:
	${MELANGE} build expat.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/gdbm-${GDBM_VERSION}.apk:
	${MELANGE} build gdbm.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/libffi-${LIBFFI_VERSION}.apk:
	${MELANGE} build libffi.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/mpdecimal-${MPDECIMAL_VERSION}.apk:
	${MELANGE} build mpdecimal.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/openssl-${OPENSSL_VERSION}.apk:
	${MELANGE} build openssl.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/readline-${READLINE_VERSION}.apk:
	${MELANGE} build readline.yaml ${MELANGE_OPTS} --source-dir ./readline/

packages/${ARCH}/sqlite-${SQLITE_VERSION}.apk:
	${MELANGE} build sqlite.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/python3-${PYTHON3_VERSION}.apk:
	${MELANGE} build python3.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/libxcrypt-${LIBXCRYPT_VERSION}.apk:
    ${MELANGE} build libxcrypt.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/glibc-${GLIBC_VERSION}.apk:
	${MELANGE} build glibc.yaml ${MELANGE_OPTS} --source-dir ./glibc/

packages/${ARCH}/busybox-${BUSYBOX_VERSION}.apk:
	${MELANGE} build busybox.yaml ${MELANGE_OPTS} --source-dir ./busybox/

packages/${ARCH}/ca-certificates-${CA_CERTIFICATES_VERSION}.apk:
	${MELANGE} build ca-certificates.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/gzip-${GZIP_VERSION}.apk:
	${MELANGE} build gzip.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/grep-${GREP_VERSION}.apk:
	${MELANGE} build grep.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/file-${FILE_VERSION}.apk:
	${MELANGE} build file.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/sed-${SED_VERSION}.apk:
	${MELANGE} build sed.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/wget-${WGET_VERSION}.apk:
	${MELANGE} build wget.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/build-base-${BUILD_BASE_VERSION}.apk:
	${MELANGE} build build-base.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/scdoc-${SCDOC_VERSION}.apk:
	${MELANGE} build scdoc.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/apk-tools-${APK_TOOLS_VERSION}.apk:
	${MELANGE} build apk-tools.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/wolfi-keys-${WOLFI_KEYS_VERSION}.apk:
	${MELANGE} build wolfi-keys.yaml ${MELANGE_OPTS} --source-dir ./wolfi-keys/

packages/${ARCH}/wolfi-base-${WOLFI_BASE_VERSION}.apk:
	${MELANGE} build wolfi-base.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

${KEY}:
	${MELANGE} keygen ${KEY}

clean:
	rm -rf packages/${ARCH}
