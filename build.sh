#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cpffmpeg/lib
sudo apt-get install -y --force-yes libhiredis-dev libgd-dev libjpeg-dev libmagickwand-dev libgd-dev  libimlib2-dev libwebp-dev
#cd /home/baysao/Project/openresty/openresty/1.9.7.4/ngx_small_light;./setup
#~/.go/bin/nginx-build -d=../openresty -j=4 \
/home/baysao/.go/src/github.com/cubicdaiya/nginx-build/nginx-build -d=../openresty -j=4 \
-with-ld-opt='-lwebp' \
--resty-opt='--with-luajit' \
-m=modules.conf \
-openresty -pcre -openssl \
-with-pcre-jit=true \
-with-http_v2_module=true --with-pcre-jit --with-mail_ssl_module \
--with-http_image_filter_module --with-http_gzip_static_module --with-http_geoip_module  \
--with-http_ssl_module \
-with-file-aio=true \
-with-threads=true \
-verbose=true \
--add-module=nginx-upload-module1 
#--add-module=./ngx_pagespeed-1.9.32.10-beta \
#--with-http_stub_status_module \
#-add-module=./ngx_pagespeed-1.8.31.4-beta \
#--with-cc-opt=\'-D_GLIBCXX_USE_CXX11_ABI=0\' \
#--with-cc-opt=\'-march=i686\' \
#--add-module=./openresty/1.9.7.4/ngx_pagespeed \
#--with-http_flv_module --with-http_mp4_module \
