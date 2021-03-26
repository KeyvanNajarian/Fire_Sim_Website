FROM ubuntu:18.04

# --------------- Python --------------- #
RUN apt update && apt install python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python

# ------------- JupyterBook ------------- #
RUN python3 -m pip install jupyter-book
RUN apt install ruby-full build-essential zlib1g-dev -y
RUN gem install jekyll
RUN gem install bundler -v "1.17.2"

RUN git clone https://github.com/lu-kas/Vorlesung_Ingenieurinformatik.git
WORKDIR "/Vorlesung_Ingenieurinformatik/Build"
RUN bundle update jekyll-scholar
RUN bundle update --bundler
RUN make clean
RUN make install
RUN make build

EXPOSE 4000