#main
while getopts "a:A:" OPTION
do
    case $OPTION in
    a|A) app=$OPTARG
        ;;
		        exit 0
        ;;
    esac
done
cf app $app >> cfappdetails.yml
cat cfappdetails.yml
HOST="$(awk '{if (NR==7) print$2}' cfappdetails.yml)"
echo "$HOST"
sed -i "2 s/url/${HOST}/g" $app-test\src\main\resources\application.yml


#sed -i "2s/$HOST/" org-management-test\src\main\resources\application.yml
