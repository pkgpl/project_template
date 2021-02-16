# Project template

Projects using [pkgpl_base](https://github.com/pkgpl/pkgpl_base) docker images.

## Requirements
- [docker](https://docs.docker.com/engine/install/) for cpu.
- [nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) for gpu.

## Docker Setting

In `docker` directory, edit `Env.sh` and run following commands.

```
./build.sh    # docker build
./run.sh      # docker run
./exec.sh -h  # docker exec
```

## Directories

Directory structure from [Good enough practices in scientific computing](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510).

- `bin`: put external scripts or compiled programs
- `data`: put raw data and metadata
- `doc`: put text documents associated with the project
- `results`: put files generated during cleanup and analysis
- `src`: put project source code

Directories above are mounted in the docker container.
