# (ubuntu-based) mkdocs-material with jupyter base image
This repo builds a ubuntu-based mkdocs-material with jupyter included. The originsl repo [squidfunk/mkdocs-material](https://github.com/squidfunk/mkdocs-material) is alpine based which conflict with alot of (interactive) visualisation plugins like [PyVista](https://docs.pyvista.org/) in jupyter notebook. 

This repo builds the following docker base image containers:
 * marcelmaatkamp/mkdocs-material-jupyter/general
 * ghcr.io/marcelmaatkamp/mkdocs-material-jupyter

Repos extending this base image are:
 * [marcelmaatkamp/mkdocs-material-jupyter-pyvista](https://github.com/marcelmaatkamp/mkdocs-material-jupyter-pyvista)

# usage

## docker-compose 

### jupyter
```bash
$ docker-compose up jupyter
```
http://127.0.0.1:8888
![jupyter](images/jupyter.png)

### mkdocs 
```bash
$ docker-compose up mkdocs
```
http://127.0.0.1:8000/mkdocs-material/reference/
![mkdocs](images/mkdocs.png)