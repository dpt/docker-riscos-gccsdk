# riscos-gccsdk 

GCC for RISC OS cross compiler

## Container Layout

 * `/home/riscos/cross/bin` contains the compiler binaries.
 * `/home/riscos/env` contains the GCCSDK porting tools.

## Building the Container

Run `make build`.

The build should utilise all the cores in your machine. 

If everything is OK, the container name should be printed at the end.

If you want to upload a variant of the image, change or override 
`CONTAINER_NAME` to reference your desired registry/repository.

## Running the Container

Run
```
docker run -it -v $(pwd):/work riscosdotinfo/riscos-gccsdk-4.7:latest
```

which will put you in a bash shell inside the container with your current
directory mounted at /work.

Note that Docker doesn't persist state between runs, so any changes you make
outside /work, packages you install etc won't be preserved.  If you want
them to persist, read about 'docker commit'.
