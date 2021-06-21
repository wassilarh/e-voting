<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/dzvote";
    String USER = "root";
    String pass = "mysql";
    Connection dbConn = null;
    Statement st = null;
    ResultSet rs = null;
    try
    {
        //Registro il driver del database
        Class.forName(JDBC_DRIVER);
        // Connessione al db tramite il driver
        dbConn = DriverManager.getConnection(DB_URL, USER, pass);
        if(!dbConn.isClosed())
        {
            out.println("Connexion au BD reussi. . .");
        }
        st = dbConn.createStatement();
        rs = st.executeQuery("SELECT list.Nb vote , partiepolitique.Nb siege , candidat.Nb voix FROM list,partiepolitique,candidat;");
   

        while(rs.next())
        {
            out.println("Nb vote");
            out.println("Nb siege");
            out.println("Nb voix");
           
        }
    }
    catch (SQLException e)
    {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
    finally
    {
        try
        {
            rs.close();
            st.close();
            dbConn.close();
        }
        catch(SQLException e)
        {
            out.println(e.getMessage());
        }
    }

%>
