# Prepare the variables
REPOSITORY="${1%.git/*}.git"
REPOSITORY_NAME=${REPOSITORY##*/}
REPOSITORY_NAME=${REPOSITORY_NAME%.git}
DPATH=${1#*.git/}

# Download the whole repository
git clone $REPOSITORY

# Move specific directory/file current directory
mv $REPOSITORY_NAME/$DPATH .

# Remove the repository
rm -rf $REPOSITORY_NAME
