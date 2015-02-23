import java.sql.*;


public class TestConnect
{
public static void main(String args[])
{
	Connection db = null;
	Statement st = null;

	try {
//	Class.forName("com.pivotal.jdbc.GreenplumDriver");
	Class.forName("com.pivotal.jdbc.GreenplumDriver");
	}
	catch (Exception e ) {
		System.err.println (e.getClass().getName()+": "+e.getMessage() );
		System.exit(0);
	}

	try {
	db = DriverManager.getConnection("jdbc:pivotal:greenplum://localhost:5432;DatabaseName=tpch;User=gpadmin;Password=ximr0fni");

	st = db.createStatement();
	ResultSet rs = st.executeQuery("select c_name from customer limit 10");
	while (rs.next())
	{
		System.out.println(rs.getString(1));
	}
	rs.close();
	st.close();
	}
	catch (Exception e ) {
		System.err.println (e.getClass().getName()+": "+e.getMessage() );
	}
	System.exit(0);
}
}


