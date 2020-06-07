FROM alpine/git:v2.24.3 as fetch
ARG nginx_version
ARG more_header_module_version
WORKDIR /src
RUN wget "https://nginx.org/download/nginx-${nginx_version}.tar.gz"
RUN tar -zxf nginx-${nginx_version}.tar.gz
RUN mv nginx-${nginx_version} nginx
RUN git clone --single-branch --branch "${more_header_module_version}" https://github.com/openresty/headers-more-nginx-module.git

FROM gcc:9.3 as build

WORKDIR /src
COPY --from=fetch /src .
RUN ls -l
WORKDIR /src/nginx
RUN ./configure --add-dynamic-module=../headers-more-nginx-module --with-compat
RUN make modules

FROM scratch
COPY --from=build /src/nginx/objs/ngx_http_headers_more_filter_module.so .
