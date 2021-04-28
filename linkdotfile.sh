function linkdotfile() {
    if [ -z ${1+x} ]; then
        echo
        echo "linkdotfile() must be called with at least one argument"
        echo
    else
        echo
        local TARGET=${1}
        if [ -z ${2+x} ]; then
            LINK=${TARGET}
        else
            local LINK=${2}
        fi
        if [[ -f ~/.${LINK} && ! -L ~/.${LINK} ]]; then
            echo "Backing up original file ${LINK}"
            mv ~/.${LINK} ~/.${LINK}-bck
        fi
        if [[ ! -L ~/.${LINK} ]]; then
            echo "Running: ln -s ~/homestash/dotfiles/${TARGET} ~/.${LINK}"
            ln -s ~/homestash/dotfiles/${TARGET} ~/.${LINK}
        else
            echo "Skipping ${LINK}, link already exists"
        fi
    fi
}
