#!/bin/zsh

IMAGE_PATH_FILE=image.path.txt
IMAGE_TAGS_FILE=image.tags.txt

function init(){
    rm $IMAGE_PATH_FILE
    for tag in $@; do
        echo $line
        echo "${PWD}/image/${tag}" >> $IMAGE_PATH_FILE
    done
}

function build(){
    cat $IMAGE_PATH_FILE
    rm $IMAGE_TAGS_FILE
    while read line
    do
        if [ -d "$line" ]; then
            echo $line
            version="$line:t"
            dir=$(dirname "$line")
            name="$dir:t"
            tag="lnhcode/${name}:${version}"
            ghcrTag="ghcr.io/linianhui/${name}:${version}"
            url="org.opencontainers.image.url=https://github.com/linianhui/docker/tree/main/image/${name}/${version}"
            docker build --tag $tag --tag $ghcrTag --label $url $line
            echo $tag >> $IMAGE_TAGS_FILE
            echo $ghcrTag >> $IMAGE_TAGS_FILE
        fi
    done < $IMAGE_PATH_FILE
}

function push(){
    cat $IMAGE_TAGS_FILE
    while read line
    do
        echo $line
        docker push $line
    done < $IMAGE_TAGS_FILE
}

case $1 in
    (init)
    shift
    init $*
;;
(build)
shift
build $*
;;
(push)
shift
push $*
;;
esac

