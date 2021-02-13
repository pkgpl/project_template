ARG dockerfrom
FROM $dockerfrom

RUN pip install matplotlib pandas jupyterlab scikit-learn bokeh mkl numba mpi4py pycuda
RUN git clone https://github.com/pkgpl/TorchWI.git /tmp/TorchWI
RUN cd /tmp/TorchWI && python setup.py install

ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/cuda/lib64:/usr/local/lib"

# Create a non-root user
ARG username=dockeruser
ARG uid=1001
ARG gid=1001
ARG project_dir=my_project

ENV USER $username
ENV UID $uid
ENV GID $gid
ENV HOME /home/$USER
ENV PROJECT_DIR $HOME/$project_dir

RUN groupadd -f -g $GID docker
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

