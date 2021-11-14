FROM jupyter/tensorflow-notebook

# Windows Render related
USER root
RUN apt-get update -y && \ 
    apt-get install -y xvfb && \
    apt-get install -y python-opengl && \
	apt-get install -y swig build-essential python-dev python3-dev
	

# Optional, needed for some environments
RUN apt-get install -y cmake && apt-get install -y zlib1g zlib1g-dev 

USER ${NB_USER}

RUN pip install \
        gym \
        pyvirtualdisplay 

# Needed for some environments
#RUN conda install swig
RUN pip install pyglet box2d-py atari_py pystan ipywidgets==7.6.5 jupyter_contrib_nbextensions

##EXPOSE 8888
