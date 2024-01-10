# TL;DR

[RStudio 4.2.1 base image](https://hub.docker.com/layers/rocker/rstudio/4.2.1/images/sha256-cf9e9144cc86c89f1277bb8d20f82ae751f3976c50cd8f437b187c5310601cc6?context=explore) and docker-compose suitable for deployment to Gen3 hatchery.

# Hatchery deployment

* Copy `rstudio4.2.yml` to `your.commons/manifests/hatchery/`
* Add the following block to the `more_configs` block in `your.commons/manifests/hatchery/hatchery.json`

```
{
  "type": "dockstore-compose:1.0.0",
  "path": "/hatchery-more-configs/rstudio4.2.yml",
  "name": "DockstoreDicom"
}
```