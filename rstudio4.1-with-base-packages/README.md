# TL;DR

RStudio 4.1.0 base image with two more base packages (`Rmarkdown` and `tinytex`) and docker-compose suitable for deployment to Gen3 hatchery.

# Hatchery deployment

* Copy `rstudio4.1-with-base-packages.yml` to `your.commons/manifests/hatchery/`
* Add the following block to the `more_configs` block in `your.commons/manifests/hatchery/hatchery.json`

```
{
  "type": "dockstore-compose:1.0.0",
  "path": "/hatchery-more-configs/rstudio4.1-with-base-packages.yml",
  "name": "DockstoreDicom"
}
```