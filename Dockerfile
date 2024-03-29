# installs Conda, Poetry & Cookiecutter 
FROM continuumio/miniconda3:latest

RUN apt update -y && \
  apt upgrade -y && \
  apt install -y --no-install-recommends \
  git \
  make \
  curl

RUN conda install -c conda-forge -y -q \
  cookiecutter=2.5.* \
  ipykernel=6.*

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="$HOME/root/.local/bin:${PATH}"
