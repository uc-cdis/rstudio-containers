## Dockerfile for rocker/tidyverse with trial base-layer security improvements, based on Rstudio tidyverse image with additional upgrades ###
FROM quay.io/cdis/nginx:1.17.6-ctds-1.0.1

COPY nginx.conf /etc/nginx/nginx.conf.template
COPY dockerstart.sh /dockerstart.sh
RUN chmod -R a+rwx /var/run /etc/nginx /var/cache

USER nginx
CMD bash /dockerstart.sh
