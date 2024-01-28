ARG JUPYTER_VERSION
FROM quay.io/jupyter/datascience-notebook:${JUPYTER_VERSION} as base

ARG MKDOCS_MATERIAL_VERSION
RUN \
   git clone --single-branch https://github.com/squidfunk/mkdocs-material  \
    -b ${MKDOCS_MATERIAL_VERSION}

FROM quay.io/jupyter/datascience-notebook:${JUPYTER_VERSION}
COPY --from=base /home/jovyan/mkdocs-material/docs /home/jovyan/docs
COPY --from=base /home/jovyan/mkdocs-material/material /home/jovyan/material
COPY --from=base /home/jovyan/mkdocs-material/src /home/jovyan/src
COPY --from=base /home/jovyan/mkdocs-material/mkdocs.yml /home/jovyan/mkdocs.yml

COPY requirements.in requirements.in
RUN \
  pip install --upgrade --no-cache \
    pip \
    pip-tools &&\
  pip-compile requirements.in \
    --resolver=backtracking \
    --max-rounds 20  \
    --verbose &&\
  pip install -r requirements.txt

RUN \
  git config --global --add safe.directory /docs &&\
  git config --global --add safe.directory /site

EXPOSE 8000
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
