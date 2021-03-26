FROM ubuntu:18.04

# --------------- Python --------------- #
RUN apt update && apt install python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python

# ------------- JupyterBook ------------- #
RUN python3 -m pip install jupyter-book
RUN apt install ruby-full build-essential zlib1g-dev -y
RUN gem install jekyll
RUN gem install bundler -v "1.17.2"

RUN git clone https://github.com/KeyvanNajarian/Fire_Sim_Website.git
WORKDIR "/Lecture_FireSim/Build"
RUN bundle update jekyll-scholar
RUN bundle update --bundler
RUN make clean
RUN make install
RUN make build

EXPOSE 4000

RUN echo "(cd /Lecture_FireSim/ && git checkout .)" >> /start.sh
RUN echo "(cd /Lecture_FireSim/ && git pull)" >> /start.sh
RUN echo "(cd /Lecture_FireSim/Build && make clean && make install && make build)" >> /start.sh
RUN echo "(cd /Lecture_FireSim/Build && bundle exec jekyll serve --host 0.0.0.0)" >> /start.sh

# --------------- Start --------------- #
RUN chmod 777 /start.sh
CMD /start.sh