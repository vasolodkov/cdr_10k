#!/bin/bash
P=/var/www/html/reportcdr_sf/protected/config
FILE-main.php

check ()
{
grep "[^//] 'cdrPagesize'=>$1," "$FILE" &>/dev/null
}

cd $P || ( echo "Wrong path" && exit )
case "$1" in
    10000)
        # set 10k records
        {
        check "$@" && echo "\"$1\" are already set"
        } || {
        sed -i s/"'cdrPageSize'=>500,"/"\/\/'cdrPageSize'=500,"/g "$FILE"
        sed -i s/"\/\/'cdrPageSize'=>10000,"/"'cdrPageSize'=10000,"/g "$FILE"
        check "$@" && echo "Done. It's OK."
        }
        ;;
    500)
        # set 500 records
        {
        check "$@" && echo "\"$1\" are already set"
        } || {
        sed -i s/"'cdrPageSize'=>10000,"/"\/\/'cdrPageSize'=10000,"/g "$FILE"
        sed -i s/"\/\/'cdrPageSize'=>500,"/"'cdrPageSize'=500,"/g "$FILE"
        check "$@" && echo "Done. It's OK."
        }
        ;;
    *)
        echo "Wrong parameter. Use 500 or 10000"
        ;;
esac
