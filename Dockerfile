FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y git

# --------------- Python --------------- #
RUN apt update && apt install python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python

# ------------- JupyterBook ------------- #
RUN python3 -m pip install jupyter-book
RUN apt install ruby-full build-essential zlib1g-dev -y
RUN gem install jekyll
RUN gem install bundler -v "1.17.2"

RUN git clone https://github.com/KeyvanNajarian/Fire_Sim_Website.git

EXPOSE 4000

# --------------- Start --------------- #
RUN 
