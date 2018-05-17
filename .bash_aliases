alias dk='docker'
alias dkps='docker ps'
alias dkpa='docker ps -a'
alias dkr='docker run'
alias dkR='docker run --rm -ti'

alias dkcR='docker-compose up -d'
alias dkcx='docker-compose down'

function docker-volume-backup() {
    CONTAINER_NAME=$(docker inspect $1 --format='{{.Name}}')
    CONTAINER_NAME=${CONTAINER_NAME:1} #Remove away initial /
    docker run --rm -v ${2}:/backup --volumes-from $1 alpine tar czvf /backup/${CONTAINER_NAME}_volumes_backup.tar.gz "${@:3}"
}

function docker-volume-restore() {
    DIR=$(dirname $2)
    FILE=$(basename $2)
    docker run --rm -v $DIR:/backup --volumes-from "$1" alpine tar -xzvf /backup/$FILE "${@:3}"
}
