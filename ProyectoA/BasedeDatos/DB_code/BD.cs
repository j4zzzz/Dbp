using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
using static System.Net.Mime.MediaTypeNames;
using System.Drawing;

namespace DB_code

{
    public class BD
    {
        private string connectionString;
        private SqlConnection con;
        public void InsertAlumno(string nom, string ape, string sex, string ema, string dir, int ciu, string req)
        {
            connectionString = "Data Source = (localdb)\\ProjectModels; Initial Catalog = master; Integrated Security = True";
            
            con = new SqlConnection(connectionString);
            con.Open();
            string query = "INSERT INTO DataAlumnos VALUES (@Nom,@Ape,@Sex,@Ema,@Dir,@Ciu,@Req)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@Nom", nom);
            command.Parameters.AddWithValue("@Ape", ape);
            command.Parameters.AddWithValue("@Sex", sex);
            command.Parameters.AddWithValue("@Ema", ema);
            command.Parameters.AddWithValue("@Dir", dir);
            command.Parameters.AddWithValue("@Ciu", ciu);
            command.Parameters.AddWithValue("@Req", req);
            command.ExecuteNonQuery();
            con.Close();
        }

        public List<string> SelectCiudad()
        {
            List<string> ciudades = new List<string>();
            connectionString = "Data Source = (localdb)\\ProjectModels; Initial Catalog = master; Integrated Security = True";
            con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT Ciudad FROM DataCiudad";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                string ciu = reader["Ciudad"].ToString();
                ciudades.Add(ciu);
            }
            con.Close();
            return ciudades;
        }
        public int SelectIdCiudad(string ciudad)
        {
            string id = "0";
            connectionString = "Data Source = (localdb)\\ProjectModels; Initial Catalog = master; Integrated Security = True";
            con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT Id FROM DataCiudad WHERE Ciudad=@Ciudad";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@Ciudad", ciudad);
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                id = reader["Id"].ToString();
            }
            con.Close();
            return int.Parse(id);
        }
    }
}