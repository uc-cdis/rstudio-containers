# TL;DR

Container for the [wetty]() web tty project.

## Use

See this ([wetty.yml](./wetty.yml)) docker-compose file - which 
should work either locally or deployed to hatchery.

## Hatchery deployment

* Copy `wetty.yml` to `your.commons/manifests/hatchery/`
* Add the following block to the `more_configs` block in `your.commons/manifests/hatchery/hatchery.json`

```
{
  "type": "dockstore-compose:1.0.0",
  "path": "/hatchery-more-configs/wetty.yml",
  "name": "DockstoreDicom"
}
```
