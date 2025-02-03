# Copy-and-Backup-Tools

The purpose of this small project was to take my academic work with Bash in a Linux enviroment, and turn it into something that can be used in the real world or a proffesional envrioment.

## Script 1: Concatenate Files and Make Copies
The purpose of this script is to concatenate multiple files into one and create copies of the file in a specified location. The user will pass the files to be concatenated, and if the environment variable responsible for specifying the destination file is set, this is where the concatenated contents will be stored. The script also makes three copies of the concatenated file to the specified destinations.

## Script 2: Backup Files to a Folder
The purpose of this script is to create backups of specified files by compressing them into an archive and saving them to a designated backup folder. The user will pass the files to be backed up, and the script will check that they exist before proceeding. It will then create an archive of the files and save it to the backup folder with a timestamped name. The script also logs the backup and removes old backups older than a specified number of days, ensuring the backup folder stays clean.

### Shoutout to @Bugx for the tutorial.
