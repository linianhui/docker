IMAGE_REGISTRY=ghcr.io/linianhui
IMAGE_PATH_PREFIX=image
IMAGE_AUTHER=lnhdyx@outlook.com
IMAGE_REPO_URL_PREFIX=https://github.com/linianhui/docker/tree/main
IMAGE_COMMIT_URl_PREFIX=https://github.com/linianhui/docker/commit

IMAGE_PATH_FILE=image-path.txt
IMAGE_TAGS_FILE=image-tags.txt

GREEN='\033[0;32m'
END='\033[0m'

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL_AUTHERS=org.opencontainers.image.authors
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
            tagWithRegistry="$REGISTRY/$tag"
            labelAuthers="$LABEL_AUTHERS=$IMAGE_AUTHER"
            labelUrl="$LABEL_URL=$IMAGE_REPO_URL_PREFIX$dir"
            labelSource="$LABEL_SOURCE=$IMAGE_REPO_URL_PREFIX$dir"
            labelVersion="$LABEL_VERSION=$IMAGE_COMMIT_URl_PREFIX/$COMMIT_SHA"
            lableCreated="$LABEL_CREATED=$(date --iso-8601=seconds --utc)"

            echo -e '\n'
            echo -e "\cdocker build \\"
            echo -e "\c  --tag $GREEN$tagWithRegistry$END \\"
            echo -e "\c  --label $GREEN$labelAuthers$END \\"
            echo -e "\c  --label $GREEN$labelUrl$END \\"
            echo -e "\c  --label $GREEN$labelSource$END \\"
            echo -e "\c  --label $GREEN$labelVersion$END \\"
            echo -e "\c  --label $GREEN$lableCreated$END \\"
            echo -e "\c  $dir"
            echo -e '\n'

            docker build \
            --tag $tagWithRegistry \
            --label $labelAuthers \
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

