IMAGE_REGISTRY=ghcr.io/linianhui
IMAGE_PATH_PREFIX=image
IMAGE_REPO_URL=https://github.com/linianhui/docker
IMAGE_REPO_SOURCE_URL_PREFIX=$IMAGE_REPO_URL/tree/main
IMAGE_COMMIT_URl_PREFIX=https://github.com/linianhui/docker/commit

IMAGE_PATH_FILE=image-path.txt
IMAGE_TAGS_FILE=image-tags.txt

GREEN='\033[0;32m'
END='\033[0m'

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL_URL=org.opencontainers.image.url
LABEL_SOURCE=org.opencontainers.image.source
LABEL_VERSION=org.opencontainers.image.version
LABEL_CREATED=org.opencontainers.image.created
LABEL_BASE_NAME=org.opencontainers.image.base.name
LABEL_BASE_DIGEST=org.opencontainers.image.base.digest

function init(){
    rm $IMAGE_PATH_FILE
    for dir in $@; do
        echo $dir >> $IMAGE_PATH_FILE
    done
}

function build(){
    COMMIT_SHA=$1
    rm $IMAGE_TAGS_FILE
    while read line
    do
        dir="$IMAGE_PATH_PREFIX/$line"
        if [ -d "$dir" ]; then
            tag="${line/\//:}"
            tagWithRegistry="$IMAGE_REGISTRY/$tag"

            baseImageName=$(__get_base_image_name $dir/Dockerfile)

            echo "docker pull $GREEN$baseImageName$END"
            docker pull $baseImageName

            baseImageDigest=$(__get_image_digest $baseImageName)

            lableBaseName="$LABEL_BASE_NAME=$baseImageName"
            lableBaseDigest="$LABEL_BASE_DIGEST=$baseImageDigest"
            labelUrl="$LABEL_URL=$IMAGE_REPO_URL"
            labelSource="$LABEL_SOURCE=$IMAGE_REPO_SOURCE_URL_PREFIX/$dir"
            labelVersion="$LABEL_VERSION=$IMAGE_COMMIT_URl_PREFIX/$COMMIT_SHA"
            lableCreated="$LABEL_CREATED=$(date --iso-8601=seconds --utc)"

            echo "\n"
            echo "docker build \\"
            echo "  --tag $GREEN$tagWithRegistry$END \\"
            echo "  --label $GREEN$lableBaseName$END \\"
            echo "  --label $GREEN$lableBaseDigest$END \\"
            echo "  --label $GREEN$labelUrl$END \\"
            echo "  --label $GREEN$labelSource$END \\"
            echo "  --label $GREEN$labelVersion$END \\"
            echo "  --label $GREEN$lableCreated$END \\"
            echo "  $GREEN$dir$END"
            echo "\n"

            docker build \
            --tag $tagWithRegistry \
            --label $lableBaseName \
            --label $lableBaseDigest \
            --label $labelUrl \
            --label $labelSource \
            --label $labelVersion \
            --label $lableCreated \
            $dir

            echo $tagWithRegistry >> $IMAGE_TAGS_FILE
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

function __get_base_image_name(){
    fromLine=$(grep ^FROM $1 | tail -1)
    echo ${fromLine:5}
}

function __get_image_digest(){
    docker inspect --format='{{.Id}}' $1
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

