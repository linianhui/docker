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
        dir="image/$line"
        if [ -d "$dir" ]; then
            tag="${line/\//:}"
            tag1="lnhcode/$tag"
            tag2="ghcr.io/linianhui/$tag"
            label1="org.opencontainers.image.url=https://github.com/linianhui/docker/tree/main/$dir"
            echo -e "\n\ndocker build --tag $GREEN$tag1$END --tag $GREEN$tag2$END --label $GREEN$label1$END $GREEN$dir$END \n"
            docker build --tag $tag1 --tag $tag2 --label $label1 $dir
            echo $tag1 >> $IMAGE_TAGS_FILE
            echo $tag2 >> $IMAGE_TAGS_FILE
        fi
    done < $IMAGE_PATH_FILE
}

function push(){
    cat $IMAGE_TAGS_FILE
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

