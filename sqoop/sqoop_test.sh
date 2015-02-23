sqoop import --driver com.pivotal.jdbc.GreenplumDriver --connect "jdbc:pivotal:greenplum://localhost:5432;database=bds"  --table retail_demo.categories_dim_hawq --username gpadmin --password password -m 1

# this throws an error.  Apparently it is looking for a primary key to read
