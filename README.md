# rover-containers
This package contains everything needed to built, edit and run all the containers used for the cengaver rover.

## Building Containers
* The `buildall` script is used to <span style="color:MediumSeaGreen">refresh all git repositories used in all containers</span>, and then using them to build docker images. 
```bash
./build/buildall.sh
#Best to do if you just cloned the repo.
```

* The `Build.sh` script uses the already cached repositories to build docker images. 
<span style="color:orange"> This means the repositories (or the container itself) can be configured and rebuilt without updating the repo from github.</span> 

```bash
./build/Build.sh <docker-image-name>
#Run without <docker-image-name> to see options
```

(Note that for `Buildspecific` to work, you need to have ran `buildall` at least once.)

## Running Containers
The main method for starting all containers is `startall`:

```bash
./run/runall.sh
```

Alternatively, for running a single container:

```bash
./run/Run.sh <docker-image-name>
#Run without <docker-image-name> to see options
```
## Editing containers
### P.S You most likely won't need to know this last part, this is for advanced setups.

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
