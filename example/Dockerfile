FROM bkayranci/nginx-more-header-module:nginx-1.19.0_more-header-module-v0.33 AS module
FROM nginx:1.19.0-alpine
COPY --from=module /modules /etc/nginx/modules
COPY default.conf /etc/nginx/conf.d/default.conf
RUN echo 'load_module "/etc/nginx/modules/ngx_http_headers_more_filter_module.so";' > /etc/nginx/nginx.conf.temp
RUN cat /etc/nginx/nginx.conf >> /etc/nginx/nginx.conf.temp
RUN mv /etc/nginx/nginx.conf.temp /etc/nginx/nginx.conf