ARG dockerfrom
FROM $dockerfrom

# pip packages
pip install torchsummary

# additional packages
RUN git clone https://github.com/pkgpl/TorchWI.git /work/TorchWI
RUN cd /work/TorchWI && python setup.py install

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
USER $USER
RUN mkdir $PROJECT_DIR

# link to the project directory in /work
RUN mkdir -p /work/$USER
RUN chown $USER:$groupname /work/$USER
RUN ln -s $PROJECT_DIR /work/$USER/$project_dir

WORKDIR $PROJECT_DIR

# environment variables
ENV PATH="${PATH}:$PROJECT_DIR/bin"
