:
#
#	Script to generate a basic YAML file for gpload
#

clear

echo "
Enter Database Name: "
read DB

echo "
Enter Host Name for gpload to execute on: " 
read GPHOST

echo "
Enter host containing data files: "
read LOADHOST

echo "
Enter directory and file names for data location."
read DATALOCATION

echo "
Enter single-quoted Delimiter to use: "
read DELIMITER

echo "
Enter file format - text or csv: "
read FILE_FORMAT

echo "
Enter GPLOAD Port Number to use: "
read GPPORT

echo "
Enter schema.tablename for table to be loaded: "
read TABLE

echo "
Generating YAML file to $TABLE.yaml"

cat /dev/null > $TABLE.yaml

echo "---

" >> $TABLE.yaml
echo "VERSION:  1.0.0.1
" >> $TABLE.yaml
echo "DATABASE:  $DB" >> $TABLE.yaml
echo "USER:  gpadmin" >> $TABLE.yaml
echo "HOST:  $GPHOST" >> $TABLE.yaml
echo "PORT:  5432" >> $TABLE.yaml
echo "GPLOAD:" >> $TABLE.yaml
echo "   INPUT:" >> $TABLE.yaml
echo "   - SOURCE:" >> $TABLE.yaml
echo "       LOCAL_HOSTNAME:" >> $TABLE.yaml
echo "        - $LOADHOST" >> $TABLE.yaml
echo "       PORT: $GPPORT" >> $TABLE.yaml
echo "       FILE:" >> $TABLE.yaml
echo "         - $DATALOCATION" >> $TABLE.yaml
echo "   - FORMAT: $FILE_FORMAT" >> $TABLE.yaml
echo "   - DELIMITER:  $DELIMITER" >> $TABLE.yaml
echo "   - ERROR_LIMIT: 100" >> $TABLE.yaml
echo "   - ERROR_TABLE: ${TABLE}_err" >> $TABLE.yaml
echo "   OUTPUT:" >> $TABLE.yaml
echo "   - TABLE: $TABLE" >> $TABLE.yaml 
echo "   - MODE:  INSERT" >> $TABLE.yaml
echo "   PRELOAD:" >> $TABLE.yaml
echo "   - TRUNCATE:  true" >> $TABLE.yaml
echo "" >> $TABLE.yaml

exit 0

