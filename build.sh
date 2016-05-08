export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo apt-get install -y --force-yes build-essential zlib1g-dev libpcre3-dev libhiredis-dev libgd-dev libjpeg-dev libmagickwand-dev libgd-dev  libimlib2-dev libwebp-dev libgraphicsmagick1-dev libyajl-dev
mkdir -p ../build

git clone https://github.com/vkholodkov/nginx-upload-module
cd nginx-upload-module
git checkout 2.2
cd ..

$HOME/.go/bin/nginx-build -d=../build -j=4 \
--resty-opt='--with-luajit --with-pcre-jit --with-http_image_filter_module --with-http_gzip_static_module --with-http_geoip_module  --with-http_ssl_module --with-ipv6  --with-sha1=/usr/include/openssl --with-md5=/usr/include/openssl' \
--with-cc-opt='-g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2' \
--with-ld-opt='-Wl,-z,relro -Wl,--as-needed -L/usr/local/cpffmpeg/lib -lwebp' \
-m=modules.conf \
-openresty -pcre -openssl \
-with-http_v2_module=true \
-with-file-aio=true \
-with-threads=true \
--add-module=nginx-upload-module  \
-verbose=true 
#find openresty -type f -iname ngx_http_image_filter_module.c | while read f;do cp ngx_http_image_filter_module.c $f;done
