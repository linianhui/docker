IMAGE_PATH=image
REGISTRY=ghcr.io/linianhui
LABEL_URL_PREFIX=org.opencontainers.image.url=https://github.com/linianhui/docker/tree/main
LABEL_VERSION_PREFIX=org.opencontainers.image.version=https://github.com/linianhui/docker/commit
LABEL_CREATED_NAME=org.opencontainers.image.created

IMAGE_PATH_FILE=image.path.txt
IMAGE_TAGS_FILE=image.tags.txt

GREEN='\033[0;32m'
END='\033[0m'

function init(){
    rm $IMAGE_PATH_FILE
    for dir in $@; do
        echo $dir >> $IMAGE_PATH_FILE
    done
}

function build(){
    rm $IMAGE_TAGS_FILE
    while read line
    do
        dir="$IMAGE_PATH/$line"
        if [ -d "$dir" ]; then
            tag="${line/\//:}"
            tag1="$REGISTRY/$tag"
            labelUrl="$LABEL_URL_PREFIX/$dir"
            labelVersion="$LABEL_VERSION_PREFIX/$GIT_COMMIT_SHA"
            lableCreated="$LABEL_CREATED_NAME=$(date --iso-8601=seconds --utc)"
            echo -e "\n\ndocker build --tag $GREEN$tag1$END --label $GREEN$labelUrl$END --label $GREEN$labelVersion$END --label $GREEN$lableCreated$END $GREEN$dir$END \n"
            docker build --tag $tag1 --label $labelUrl --label $labelVersion --label $lableCreated $dir
            echo $tag1 >> $IMAGE_TAGS_FILE
        fi
    done < $IMAGE_PATH_FILE
}

function push(){
    cat $IMAGE_TAGS_FILE
    docker images
    while read line
    do
        echo -e "\n\ndocker push $GREEN$line$END\n"
        docker push $line
    done < $IMAGE_TAGS_FILE
}

case $1 in
    init)
        shift
        init $*
    ;;
    build)
        shift
        build $*
    ;;
    push)
        shift
        push $*
    ;;
esac

