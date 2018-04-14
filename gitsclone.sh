# process arguments
DIRECTORY=0
while getopts "r" opt; do
    case $opt in
        r) DIRECTORY=1 ;;
    esac
done

# Prepare the variables
REPOSITORY="${1%.git/*}.git"
REPOSITORY_NAME=${REPOSITORY##*/}
REPOSITORY_NAME=${REPOSITORY_NAME%.git}
DPATH=${1#*.git/}

# Download the whole repository
git clone $REPOSITORY

# Move specific directory/file current directory
if test $DIRECTORY -eq 1 ; then
    mv -r $REPOSITORY_NAME/$DPATH .
else
    mv $REPOSITORY_NAME/$DPATH .
fi

# Remove the repository
rm -rf $REPOSITORY_NAME
