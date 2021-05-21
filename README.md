# Project template

Projects using [pkgpl_base](https://github.com/pkgpl/pkgpl_base) docker images.

## Requirements
- [docker](https://docs.docker.com/engine/install/) for cpu.
- [nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) for gpu.

## Docker Setting

In `docker` directory, add additional packages you need to `Dockerfile`.
Set `PROJECT_NAME` and `DEVICE` in `Env.sh` and run following commands.

```
./build.sh    # docker build
./run.sh      # docker run
./exec.sh -h  # docker exec
./helper.sh   # docker images, ps, stop, rmi
```

## Directories

Directory structure from [Good enough practices in scientific computing](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510).

- `bin`: put external scripts or compiled programs
- `data`: put raw data and metadata
- `doc`: put text documents associated with the project
- `results`: put files generated during cleanup and analysis
- `src`: put project source code

Directories above will be mounted in the docker container.
- path:/home/$USER/$RPOJECT_DIR/
- link:/work/$USER/$PROJECT_DIR/

## Example projects

- [Youtube](https://youtu.be/qpf4fycdklo)
    - [Facies classification using Machine Learning](https://github.com/pkgpl/facies_classification.git)
    - [Wind Data Analysis](https://github.com/pkgpl/wind_distribution.git)
    - [Full Waveform Inversion](https://github.com/pkgpl/fwi_project_example.git)
- [Seismic Data Analysis](https://github.com/pkgpl/seismic.git) [[Youtube](https://youtu.be/d_zhD2A3Ues)]
