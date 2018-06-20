#/bin/sh

BASE=`basename $1 .csv`

cat EB-build-goods.sql | awk '{print $5}' | awk -F "\"*,\"*" '{print $2,$3}' | sed -e "s/\'//g" | (echo "Transaction Number" && cat) | awk 'BEGIN { ORS = "," } { print $1 " " $2 }' | sed 's/,$//' > header.csv
cat header.csv $1 > $BASE-binary.csv
cat $BASE-binary.csv  | sed -e "s/,0/,/g" > $BASE-final.csv
