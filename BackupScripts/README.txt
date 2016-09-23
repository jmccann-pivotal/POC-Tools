
This directory contains files as starting points for simple backups and restores with 
gpcrondump/gpdbrestore.   Generally the only thing you need to do in these files is change
the location of the directory wihere backups are done to and restores are done from.

backup_db.sh   - backup an entire database
backup_db_schema.sh -  backup a single schema within a database (recommended approach)
restore_db.sh  - restore an entire database
restore_db_schdma.sh - restore a single schema to a database

The two "load_seg" files are used for doing a manual restore.  This is a scripted form of the steps
listed in the Greenplum Administrator's Guide in the section "Restoring To A Different Configuration".

These are basically doing COPY operations through the master, so it can be very slow.   The advantage
is that if your backups were made with gpcrondump from a system that has, say, 4 primary segments per
host; and you are going to be restoring to a system that has 8 primaries per host, these scripts will
allow you to leverage old backup files for that operation.

load_seg_dd.sh  - run the restore from UNCOMPRESSED files.  If the files reside on Data Domain, they can
                  be accessed through an NFS mount on the master server.  Generally, uncompressed files
                  are stored on Data Domain (recommended by Data Domain).

load_seg_nfs.sh - run the restore from COMPRESSED files.  The default for gpcrondump is the compress
                  the dump files.   This is normally done to an NFS mount on each segment.

Jim McCann
09/23/2016 

