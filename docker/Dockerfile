ARG dockerfrom
FROM $dockerfrom

# pip packages
RUN pip install matplotlib pandas jupyterlab scikit-learn bokeh mkl numba mpi4py

# environment variables
ENV CUDA_HOME /usr/local/cuda
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64:/usr/local/lib"

# additional packages
RUN git clone https://github.com/pkgpl/TorchWI.git /tmp/TorchWI
RUN cd /tmp/TorchWI && python setup.py install

# Create a non-root user
ARG username=dockeruser
ARG groupname=docker
ARG uid=1001
ARG gid=1001
ARG project_dir=my_project

ENV USER $username
ENV UID $uid
ENV GID $gid
ENV HOME /home/$USER
ENV PROJECT_DIR $HOME/$project_dir

RUN groupadd -f -g $GID $groupname
RUN adduser --disabled-password \
    --gecos "Non-root user" \
    --uid $UID \
    --gid $GID \
    --home $HOME \
    $USER

# create a project directory inside user home
RUN mkdir -p /work/$USER
RUN chown $USER:$groupname /work/$USER

USER $USER
RUN mkdir $PROJECT_DIR
RUN ln -s $PROJECT_DIR /work/$USER/$project_dir
WORKDIR $PROJECT_DIR

