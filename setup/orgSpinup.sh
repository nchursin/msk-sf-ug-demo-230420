ALIAS=$1
DEFAULT=$2
DEVHUB=$3

DEFAULT_FLAG='-s'
DEVHUB_FLAG=''
ALIAS_FLAG=''

zero="0"

if [ "$DEFAULT" == "$zero" ]; then
    DEFAULT_FLAG=''
fi

if [ ! -z $DEVHUB ]; then
    DEVHUB_FLAG="-v $DEVHUB"
fi

if [ ! -z $ALIAS ]; then
    ALIAS_FLAG="-a $ALIAS"
fi

echo "Creating org..."
echo "sf force:org:create $DEFAULT_FLAG $DEVHUB_FLAG $ALIAS_FLAG -f config/project-scratch-def.json"
sfdx force:org:create $DEFAULT_FLAG $DEVHUB_FLAG $ALIAS_FLAG -f config/project-scratch-def.json