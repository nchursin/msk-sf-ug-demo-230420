ALIAS=$1

if [ -z $ALIAS ]; then
    echo "Looking for default scratch org..."
    DEFAULT_ORG_INFO=$(sfdx force:org:list | grep "(U)")
    ALIAS=$(echo $DEFAULT_ORG_INFO | awk '{print $2}')
fi

echo "Configuring $ALIAS..."

echo 'Building Angular app...'
sfdx ngx:build

echo 'Pushing sources...'
sfdx force:source:push -u $ALIAS