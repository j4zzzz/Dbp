using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoA
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadSession();
            deleteSessions();
        }

        private void loadSession()
        {
            String nombre = (String)(Session["Nombre"]);
            String apellido = (String)(Session["Apellido"]);

            LabelUsuario.Text = "Enviado por Sesion: ";
            LabelNombre.Text = "Nombre: " + nombre;
            LabelApellido.Text = " Apellido: " + apellido;
        }
        private void deleteSessions()
        {
            Session.RemoveAll();
            Session.Abandon();
        }

        [WebMethod]
        public static String getInformacion(String valor)
        {
            return "Desde el servidor se recibio :" + valor;
        }
    }
}

