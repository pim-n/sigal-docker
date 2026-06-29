#!/bin/sh
set -e

TITLE=${TITLE:-Travel Photos}
THUMB_SIZE=${THUMB_SIZE:-300}
PORT=${PORT:-8080}

mkdir -p /output

cat >/app/sigal.conf.py <<EOF
source = "/gallery"
destination = "/output"

title = "${TITLE}"

theme = "colorbox"

thumb_size = (${THUMB_SIZE}, ${THUMB_SIZE})

keep_orig = False
autorotate_images = True
write_html = True
use_orig = False

links = ""
EOF

echo "Building gallery..."
sigal build -c /app/sigal.conf.py

echo "Serving on port ${PORT}"
cd /output
python3 -m http.server ${PORT}