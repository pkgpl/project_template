Admin: make nvidia default runtime.

Add `"default-runtime": "nvidia",` to `/etc/docker/daemon.json` and run `# service docker restart` before build to make cuda available during `docker build`.

