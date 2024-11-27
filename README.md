# rover-containers
This package contains everything needed to built, edit and run all the containers used for the cengaver rover.

## Building Containers
There are two main ways to build containers. 
* The `buildall` script is used to <span style="color:MediumSeaGreen">refresh all git repositories used in all containers</span>, and then using them to build docker images.
```bash
cd build/
./buildall
```

* The `Buildspecific` script uses the already cached repositories to build docker images. 
<span style="color:orange"> This means the repositories (or the container itself) can be configured and rebuilt without updating the repo from github.</span> 
```bash
cd build/
./Buildspecific <folder-name>
```

(Note that for `Buildspecific` to work, you need to have ran `buildall` at least once.)

## Running Containers
The main method for starting all containers is `startall`:

```bash
... /run/startall
```

Alternatively, for running a single container:

```bash
... run/Startspecific <docker-image-name>
```
## Editing containers
If you needed to change anything about the containers (changing repositories manually, adding a line to the autostart script, etc.) 
You can check each container by its name in the `build/` directory.
### How build folders work
Each folder is required to have a `Dockerfile`, and an `init`.
`init` is a bash script used to refresh any repositories that are being used, while `Dockerfile` uses those repositories to build the final image.

You can find your cloned repo inside its containers' folder. 

It is best practice to keep your repository clones inside `init`, so in case things needed to be modified offline, they can!

## License
Apache-2.0 License\
Original author: DenavDot
