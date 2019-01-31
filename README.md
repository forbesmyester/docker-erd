# Run [ERD](https://github.com/BurntSushi/erd) in a docker container

ERD does not run on Ubuntu 18.04 yet. This is a Dockerfile which builds you a running ERD upon Ubuntu 16.04 which you can then pipe into using the following

    docker build -t erd .
    curl 'https://raw.githubusercontent.com/BurntSushi/erd/master/examples/simple.er' > simple.er
    cat simple.er | docker run -i erd bash -c 'erd -f png' > simple.png
    xdg-open simple.png # or however you do this on your OS

During this process you have:

 * Installed Haskell and ERD within a docker container tagged with the name "erd".
 * downloaded the sample Entity Relationship Diagram from the ERD homepage.
 * Piped the Entity Relationship Diagram into the docker container tagged "erd" and used to to create a PNG.
 * Opened the PNG file generated

If you wish to use ERD naturally as a standard UNIX tool (though in a limited form you can do the following:

    echo -e '#!/bin/bash\nif (( $# != 1 )); then\necho "Must pass a format (png/pdf/etc)"\nexit 1\nfi\ndocker run -i erd bash -c "erd -f $1"' > ~/.local/bin/erd

Then you can use it simply like:

    cat simple.er  | erd png > s.png

If using Ubuntu 18.04 you can also do the following and get the full version (which seems to work)

    docker run -i erd bash -c 'cat /root/.cabal/bin/erd' > ~/.local/bin/erd
    chmod +x ~/.local/bin/erd
