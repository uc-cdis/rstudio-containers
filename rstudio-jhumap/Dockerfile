FROM quay.io/cdis/rstudio3.6:master


# COPY premade notebook
RUN mkdir /home/rstudio/jhumap

ADD https://raw.githubusercontent.com/uc-cdis/covid19-tools/master/covid19-notebooks/jhu_map/jhu_map.Rmd /home/rstudio/jhumap

RUN chmod -R 777 /home/rstudio/jhumap

RUN touch /home/rstudio/jhumap/jhu_map.Rmd
