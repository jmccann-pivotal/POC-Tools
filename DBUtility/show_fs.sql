select  g.hostname,
        fe.fselocation as directory
    from pg_filespace as f,
         pg_filespace_entry as fe,
         gp_segment_configuration as g
    where f.oid = fe.fsefsoid
        and g.dbid = fe.fsedbid
        and f.fsname = 'pg_system';

