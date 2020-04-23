ALIAS=$1

if [ -z $ALIAS ]; then
    echo "Looking for default scratch org..."
    DEFAULT_ORG_INFO=$(sfdx force:org:list | grep "(U)")
    ALIAS=$(echo $DEFAULT_ORG_INFO | awk '{print $2}')
fi

echo "Testing $ALIAS..."

echo 'Running apex tests...'
sfdx force:apex:test:run -w 10 -c -r human

echo 'Running NG tests...'
cd ng-app && ng test --watch=false && cd ..