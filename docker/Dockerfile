FROM horovod/horovod:0.20.0-tf2.3.0-torch1.6.0-mxnet1.6.0.post0-py3.7-cuda10.1

#RUN pip install pycuda
RUN pip install matplotlib pandas jupyterlab scikit-learn bokeh mpi4py
RUN git clone https://github.com/pkgpl/TorchWI.git /tmp/TorchWI
RUN cd /tmp/TorchWI && python setup.py install

# Create a non-root user
ARG username=dockeruser
ARG uid=1005
ARG gid=1005
ARG project_dir=project

ENV USER $username
ENV UID $uid
ENV GID $gid
ENV HOME /home/$USER
ENV PROJECT_DIR $HOME/$project_dir

RUN groupadd -g $GID docker
RUN adduser --disabled-password \
    --gecos "Non-root user" \
    --uid $UID \
    --gid $GID \
    --home $HOME \
    $USER

# create a project directory inside user home
USER $USER
RUN mkdir $PROJECT_DIR
WORKDIR $PROJECT_DIR

