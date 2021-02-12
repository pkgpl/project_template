# Project template

## Requirements
- [docker](https://docs.docker.com/engine/install/) for cpu.
- [nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) for gpu.

## Docker Setting

`cd docker`

Edit `Env.sh`.

```
sh docker_build_gpu.sh
sh docker_run_gpu.sh
```

## Directories

Directory structure from [Good enough practices in scientific computing](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510).

- bin: put external scripts or compiled programs
- data: put raw data and metadata
- doc: put text documents associated with the project
- results: put files generated during cleanup and analysis
- src: put project source code

