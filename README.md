# Dockerized TexLive

This repo provides the source code for the referring docker hub repos.

## Tags

We provide multiple Options to choose from for the best experience and connivence. The following tags are supported and contain the stated features

### `:latest` `:basic`

This installation of TexLive features only the basic  packages. It's lightweight but maybe you will be missing some special packeges.

### `:full`

This features the full extend of TexLive with all it's packages pre installed. As you can imagine this is the biggest image and takes the longest to pull. Use it only if necessery.

### `:pre-install`

Use this only if you know what you're doing. This image containes only the installation file without featuring a installation. You can use this image to build your own configuration from it. It's also used in all other images in this repo