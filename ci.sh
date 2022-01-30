IMAGE_REGISTRY=ghcr.io/linianhui
IMAGE_PATH_PREFIX=image
IMAGE_REPO_URL=https://github.com/linianhui/docker
IMAGE_REPO_VERSION_URL_PREFIX=$IMAGE_REPO_URL/tree

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
    echo -e "rm $GREEN$IMAGE_PATH_FILE$END"
    for dir in $@; do
        echo $dir >> $IMAGE_PATH_FILE
    done
    __cat_green $IMAGE_PATH_FILE
}

function build(){
    COMMIT_SHA=$1
    echo -e "rm $GREEN$IMAGE_TAGS_FILE$END"
    rm $IMAGE_TAGS_FILE
    __cat_green $IMAGE_PATH_FILE
    while read line
    do
        dir="$IMAGE_PATH_PREFIX/$line"
        if [ -d "$dir" ]; then
            tag="${line/\//:}"
            tagWithRegistry="$IMAGE_REGISTRY/$tag"
            version=${dir##*/}

            baseImageName=$(__get_base_image_name $dir/Dockerfile)

            echo -e "docker pull $GREEN$baseImageName$END"
            docker pull $baseImageName
            docker inspect $baseImageName

            baseImageDigest=$(__get_image_digest $baseImageName)

            labelBaseName="$LABEL_BASE_NAME=$baseImageName"
            labelBaseDigest="$LABEL_BASE_DIGEST=$baseImageDigest"
            labelUrl="$LABEL_URL=$IMAGE_REPO_URL"
            labelSource="$LABEL_SOURCE=$IMAGE_REPO_VERSION_URL_PREFIX/$COMMIT_SHA/$dir"
            labelVersion="$LABEL_VERSION=$version"
            labelCreated="$LABEL_CREATED=$(date --iso-8601=seconds --utc)"

            echo -e "\n"
            echo -e "docker build \\"
            echo -e "  --tag $GREEN$tagWithRegistry$END \\"
            echo -e "  --label $GREEN$labelBaseName$END \\"
            echo -e "  --label $GREEN$labelBaseDigest$END \\"
            echo -e "  --label $GREEN$labelUrl$END \\"
            echo -e "  --label $GREEN$labelSource$END \\"
            echo -e "  --label $GREEN$labelVersion$END \\"
            echo -e "  --label $GREEN$labelCreated$END \\"
            echo -e "  $GREEN$dir$END"
            echo -e "\n"

            docker build \
            --tag $tagWithRegistry \
            --label $labelBaseName \
            --label $labelBaseDigest \
            --label $labelUrl \
            --label $labelSource \
            --label $labelVersion \
            --label $labelCreated \
            $dir

            echo $tagWithRegistry >> $IMAGE_TAGS_FILE
        fi
    done < $IMAGE_PATH_FILE
}

function push(){
    __cat_green $IMAGE_TAGS_FILE
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
    digest=$(docker inspect --format='{{index .RepoDigests 0}}' $1)
    echo ${digest##*@}
}

function __cat_green(){
    echo -e "\ncat $GREEN$1$END"
    while read line
    do
        echo -e "$GREEN$line$END"
    done < $1
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

