export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cpffmpeg/lib
sudo apt-get install -y --force-yes libhiredis-dev libgd-dev libjpeg-dev
~/.go/bin/nginx-build -d ../openresty -j 4 -m modules.conf --prefix=/usr/local/openresty -openresty -pcre -openssl \
--with-http_v2_module --with-pcre-jit --with-mail_ssl_module \
--with-http_flv_module --with-http_mp4_module --with-http_image_filter_module --with-http_gzip_static_module --with-http_geoip_module  \
--with-cc-opt="-O3" \
--with-http_ssl_module \
--with-file-aio \
--with-threads -j=4
