#!/bin/sh

if test -n "x"; then  # Corrected the test condition
    LD_LIBRARY_PATH="/opt/apache/lib:$LD_LIBRARY_PATH"
else
    LD_LIBRARY_PATH="/opt/apache/lib"
fi
LD_LIBRARY_PATH="/opt/openssl-1.0.2/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH

exec /opt/apache/bin/apachectl -D FOREGROUND