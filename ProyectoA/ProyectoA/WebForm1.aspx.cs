using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoA.ServiceReference1;
using System.IO;
using System.Runtime.InteropServices;
using System.Data;

namespace ProyectoA


{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected String[] serviceCall()
        {
            Service1Client client = new Service1Client();
            string[] ciudades = client.cargarCiudades();
            return ciudades;
        }
        protected void CrearDropDowlist()
        {
            string[] ciudades = serviceCall();
            foreach (string cities in ciudades)
            {
                ListItem item = new ListItem(cities, cities);
                city.Items.Add(item);
            }
            //try
            //{
            //    String line;
            //    List<string> items = new List<string>();
            //    StreamReader sr = new StreamReader("D:\\repos\\ciudades.txt");

            //    line = sr.ReadLine();
            //    items.Add(line);
            //    while (line != null)
            //    {
            //        line = sr.ReadLine();
            //        if (line != null)
            //        {
            //            items.Add(line);
            //        }
            //    }
            //    sr.Close();
            //    items.Sort();
            //    items.Insert(0, "Eliga una opcion...");
            //    city.DataSource = items;
            //    city.DataBind();
            //}
            //catch (Exception ex)
            //{
            //    Console.WriteLine("Error al leer el archivo: " + ex.Message);
            //}

        }
        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            string nom = nombre.Text;
            string apell = apellido.Text;
            string ciudad = city.SelectedValue;
            string correo = email.Text;
            bool sexf = sexo_femenino.Checked;
            bool sexm = sexo_masculino.Checked;
            string sex = " ";
            if (sexf)
            {

                sex = "F";

            }
            else
            {
                sex = "M";

            }
            string direc = direccion.Text;
            string reque = requerimentos.Text;
            informacion.Text = "Nombre: " + nom + "\nApellido: " + apell + "\nGenero: " + sex + "\nEmail: " + correo + "\nDireccion: " + direc + "\nCiudad: " + ciudad + "\nRequerimentos: " + reque;
            informacion.Visible = true;
            createSesion(nom, apell);
            createCookie(sex, ciudad);
            Service1Client client = new Service1Client();
            client.ingresarTablaWeb(nom,apell,sex,correo,direc,ciudad,reque);
            Response.Redirect("WebForm2.aspx");
            Clean();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            CrearDropDowlist();
        }
        protected void Clean()
        {
            nombre.Text = "";
            apellido.Text = "";
            city.SelectedIndex = 0;
            email.Text = "";
            sexo_femenino.Checked = false;
            sexo_masculino.Checked = false;
            direccion.Text = "";
            requerimentos.Text = "";
        }
        private void createSesion(String Nombre, String Apellido)
        {
            Session["Nombre"] = Nombre;
            Session["Apellido"] = Apellido;
        }

        private void createCookie(String Sexo, String Ciudad)
        {
            HttpCookie cookie1 = new HttpCookie("sexo", Sexo);
            HttpCookie cookie2 = new HttpCookie("ciudad", Ciudad);
            Response.Cookies.Add(cookie1);
            Response.Cookies.Add(cookie2);

        }


    }
}