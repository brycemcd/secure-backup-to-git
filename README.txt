This is a basic backup utility that allows sys admins and other Linux type people to backup files to their github repo. The catch, of course, is that the backups are securely encrypted and stored incrementally.

All one needs to do to restore a backup using this script would be to git pull origin "tagname". This could also be useful to deploying source to clustered servers.

I've been blogging about this script, the philosophy behind its architecture and each step of the process at http://blog.brycemcdonnell.com/howto-securely-backup-your-data-offsite-using-git-openssl-and-basic-linux-commands/

PLEASE fork this repo and submit patches. I'd really like to make this great with your help.

More info or questions can be sent to bryce [at] bridgetownint dot com or call 503.914.0202