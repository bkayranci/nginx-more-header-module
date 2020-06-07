FROM bkayranci/nginx-more-header-module:nginx-1.19.0_more-header-module-v0.33 AS module
FROM nginx:1.19.0-alpine
COPY --from=module /modules /etc/nginx/modules
COPY default.conf /etc/nginx/conf.d/default.conf
