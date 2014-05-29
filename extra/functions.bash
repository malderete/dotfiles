# ---------------
# Functions
# ---------------

add_auth_key () {
    host=$1
    if  [ -z $host ] ; then
        echo "You must provide a host as the first (and only) argument"
        return
    fi
    if [ ! -f ~/.ssh/id_rsa.pub ] ; then
        command ssh-keygen -t rsa
    fi
    command scp ~/.ssh/id_rsa.pub $host:/tmp/tmp_rsa
    command ssh $host -t "if [ ! -d ~/.ssh ]; then mkdir ~/.ssh/;fi && cat /tmp/tmp_rsa >> ~/.ssh/authorized_keys && rm /tmp/tmp_rsa && chmod -R 700 ~/.ssh"
}


svim () {
    # Run vim as super user
    command sudo vim $@
}

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

dls () {
 # directory LS
 echo `ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"`
}

dgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    grep -iR "$@" * | grep -v "Binary"
}

dfgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    # and returns only unique filenames
    grep -iR "$@" * | grep -v "Binary" | sed 's/:/ /g' | awk '{ print $1 }' | sort | uniq
}

psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

killit() {
    # Kills any process that matches a regexp passed to it
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

mcd () {
    mkdir "$@" && cd "$@"
}

getip () {
    curl -s -m 2 http://ifconfig.me
}

getiplocal () {
    # determine local IP address
    sudo ifconfig | grep "inet " | awk '{ print $2 }'
}

shell () {
  ps | grep `echo $$` | awk '{ print $4 }'
}

unpatch () {
  find . -name "*.orig" -o -name "*.rej"  -type f -exec rm {} \;
  find . -name "b" -type d -exec rm -rf {} \;
}

download_web () {
    URL=$1
    if [ -z $URL ]; then
        echo "You must provide an URL to download ;)";
	return
    fi
    wget --random-wait -r -p -e robots=off -U mozilla $URL
}

download_pdfs_from_web () {
    URL=$1
    if [ -z $URL ]; then
        echo "You must provide an URL to download the PDF's";
	return
    fi
    wget -A.pdf --random-wait -r -p -e robots=off -U mozilla $URL
}

download_ft_from_web () {
	URL=$1
	FT=$2
    if [ -z $URL ]; then
        echo "You must provide an URL to download the files";
        return
    fi
    wget -A$FT --random-wait -r -p -e robots=off -U mozilla $URL

}

clean_pyc () {
    find . -iname '*.pyc' -delete
}

server () {
	sudo ifconfig | grep -B1 "inet addr" | awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' | awk -F: '{ print $1 ": " $3 }';
	python -m SimpleHTTPServer
}

