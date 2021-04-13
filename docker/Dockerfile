ARG dockerfrom
FROM $dockerfrom

# pip packages
#RUN pip install 

# install additional packages
#RUN git clone 

# docker shell prompt for root
RUN echo 'export PS1="\e[0;31m(docker) \e[m[\u@\h \w]# "' >> /root/.profile

# Create a non-root user
ARG username=dockeruser
ARG groupname=docker
ARG uid=1001
ARG gid=1001
ARG project_dir=my_project

ENV USER $username
ENV UID $uid
ENV GID $gid
ENV USERHOME /home/$USER
ENV PROJECT_DIR $USERHOME/$project_dir

RUN groupadd -f -g $GID $groupname
RUN adduser --disabled-password \
    --gecos "Non-root user" \
    --uid $UID \
    --gid $GID \
    --home $USERHOME \
    $USER

# prepare link
RUN mkdir /work/$USER
RUN chown $USER:$groupname /work/$USER

# create a project directory inside user home
USER $USER
RUN mkdir $PROJECT_DIR

# link to the project directory in /work
RUN ln -s $PROJECT_DIR /work/$USER/$project_dir

WORKDIR $PROJECT_DIR

# user environment variables
ENV PATH="${PATH}:$PROJECT_DIR/bin"

# docker shell prompt for user
RUN echo 'export PS1="\e[0;36m(docker) \e[m[\u@\h \w]\$ "' >> $USERHOME/.profile

