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
		
		//Récuperer les infos saisies dans le formulaire
        String Num List= req.getParameter("NumList");
        String CodeWilaya = req.getParameter("CodeWilaya");
		String codepartie = req.getParameter("codepartie");
		String Nb vote = req.getParameter("Nbvote");	
			
        st = dbConn.createStatement();
        rs = st.executeQuery("INSERT INTO list (Num List,CodeWilaya,codepartie,Nb vote) VALUES ('Num List','CodeWilaya','codepartie','Nb vote');");
        


        while(rs.next())
        {
            out.println("La liste a bien été ajouté");
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

</body>
</html>