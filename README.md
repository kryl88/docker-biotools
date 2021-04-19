# docker-biotools

Docker-image contains following programmes:

1. <a href="http://www.htslib.org">Samtools-1.12</a>
2. <a href="https://gitlab.com/german.tischler/biobambam2">Biobambam2-2.0.182</a>

Commands for building docker-image and running it in the interactive mode:

    docker build -t $IMAGE_NAME $PATH
    docker container run -it $IMAGE_NAME
