# Project template

Projects using [horovod](https://github.com/horovod/horovod), [PyTorch](https://pytorch.org) and/or [TensorFlow](https://www.tensorflow.org).

## Requirements
- [docker](https://docs.docker.com/engine/install/) for cpu.
- [nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) for gpu.

## Docker Setting

`cd docker`

Edit `Env.sh`.

```
sh build.sh
sh run.sh
```

## Directories

Directory structure from [Good enough practices in scientific computing](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510).

- `bin`: put external scripts or compiled programs
- `data`: put raw data and metadata
- `doc`: put text documents associated with the project
- `results`: put files generated during cleanup and analysis
- `src`: put project source code

Directories above are mounted in the docker container.
