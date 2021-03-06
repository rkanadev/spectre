#!/bin/bash
# ===========================================================================
#
# Created: 2019-01-22 HLXEasy
#
# Helper script to create checksums for given file (1st parameter)
# and write them into given another file (2nd parameter)
#
# ===========================================================================

givenFileWithPath=$1
checksumfile=/tmp/checksumfile
if [[ -z "${givenFileWithPath}" ]] ; then
    echo "No filename given, for which checksums should be created!"
    exit 1
fi
if [[ -n "${2}" ]] ; then
    checksumfile=$2
fi
filename=${givenFileWithPath##*/}
echo "${filename} $(sha256sum "${givenFileWithPath}" | awk '{ print $1 }')" > ${checksumfile}
