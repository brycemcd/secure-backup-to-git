#!/usr/bin/sh

#backupdb
echo "======================================"
echo "backing up database"
mysqldump -u backup --all-databases > /var/www/html/alldatabases.sql

#tar and compress the directories really hacky and should either make a file for exclusions or just get rid of the crap
tar -czvvf /var/www/bkp/websqlbkp.tar.gz /var/www/html/alldatabases.sql /var/www/html/*

#encrypt that mug and then remove the decrypted file
echo "encrypting backup"
openssl des3 -salt -k supersecret \
        -in /var/www/bkp/websqlbkp.tar.gz \
        -out /var/www/bkp/websqlbkpencrypted.tar.gz

#cleanup files I don't want people to see
echo "cleaning up files"
rm -rf /var/www/bkp/websqlbkp.tar.gz
rm -rf /var/www/html/alldatabasesl.sql

#update the git repo
echo "committing to git `date` "
cd /var/www/bkp/

echo "adding to git"
/usr/local/bin/git add .

echo "commiting git"
/usr/local/bin/git commit -a -m "commiting backup on `date`"

echo "pushing to github"
/usr/local/bin/git push origin production