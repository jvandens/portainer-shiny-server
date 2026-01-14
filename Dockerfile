FROM rocker/shiny:latest

# Optional system deps
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
 && rm -rf /var/lib/apt/lists/*

# Optional R packages used by many apps
# this is done in system library file by bind mount to /srv04a/docker/shiny_R_libs
# RUN R -e "install.packages(c('shiny', 'tidyverse','sf','data.table'), repos='https://cloud.r-project.org')"

COPY shiny-server.conf /etc/shiny-server/shiny-server.conf

EXPOSE 3838