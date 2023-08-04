<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ProyectoA.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!--JQuery-->
    <script type="text/javascript" src="/Scripts/jquery-3.4.1.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/modernizr-2.8.3.js"></script>

    <title>Registro Alumno</title>
   <style>
        body {
        background-color: #efeefa;
        font-family: verdana;
        font-size: 12px;
        color: #ae7ad4;
    }
   
    p {
        font-family: verdana;
        font-size: 12px;
        color: purple;
    }
   
    label {
        font-family: verdana;
        font-size: 12px;
        color: purple;
        text-align: center;
    }
   
   
    button[type="reset"] {
        background-color: #ff0000;
        color: #fff;
        font-weight: bold;
        border: black;
        padding: 5px 10px;
        cursor: pointer;
        text-align: center;
    }
   
    button[type="alert"] {
        background-color: #00b35a;
        color: #fff;
        font-weight: bold;
        border: black;
        padding: 5px 10px;
        cursor: pointer;
        text-align: center;
    }
       
    .boton-limpiar {
        background-color: #ff0000;
        color: #fff;
        font-weight: bold;
        border: black;
        padding: 5px 10px;
        cursor: pointer;
        text-align: center;
    }
 
    .boton-enviar {
        background-color: #00b35a;
        color: #fff;
        font-weight: bold;
        border: black;
        padding: 5px 10px;
        cursor: pointer;
        text-align: center;
    }
   


    </style>
    <script type="text/javascript">
        function limpiar_contenido() {
            var vacio = "";
            document.getElementById("nombre").value = vacio;
            document.getElementById("apellido").value = vacio;
            document.getElementById("sexo_masculino").checked = false;
            document.getElementById("sexo_femenino").checked = false;
            document.getElementById("email").value = vacio;
            document.getElementById("direccion").value = vacio;
            document.getElementById("city").value = 0;
            document.getElementById("requerimentos").value = vacio;
            return false;
        }
    </script>
    <script type="text/javascript">
        function verificar_contenido() {
            var vacio = "";

            var regex1 = /^[a-zA-ZñÑ\s]+$/;
            if (document.getElementById("nombre").value == vacio) {
                alert("Necesita colocar un Nombre");
                return false;
            }
            if (!regex1.test(document.getElementById("nombre").value)) {
                alert("En el campo de Nombre no pueden ir números o caracteres especiales");
                return false;
            }
            if (document.getElementById("apellido").value == vacio) {
                alert("Necesita colocar un Apellido");
                return false;
            }
            if (!regex1.test(document.getElementById("apellido").value)) {
                alert("En el campo de Apellido no pueden ir números o caracteres especiales");
                return false;
            }
            if (document.getElementById("sexo_masculino").checked == false && document.getElementById("sexo_femenino").checked == false) {
                alert("Necesita marcar un Sexo");
                return false;
            }
            if (document.getElementById("sexo_masculino").checked == true && document.getElementById("sexo_femenino").checked == true) {
                alert("Necesita marcar un Sexo");
                document.getElementById("sexo_masculino").checked = false;
                document.getElementById("sexo_femenino").checked = false;
                return false;
            }
            var Email = document.getElementById("email").value;
            if (Email.endsWith("@unsa.edu.pe")) {
                var antes = Email.indexOf("@");
                if (antes == -1 || antes != Email.indexOf("@unsa.edu.pe")) {
                    alert("Tiene que ingresar un Email con el dominio @unsa.edu.pe");
                    return false;
                }
            }
            else {
                alert("Tiene que ingresar un Email con el dominio @unsa.edu.pe");
                return false;
            }
            if (document.getElementById("city").value == "Eliga una opcion...") {
                alert("Seleccione una Ciudad");
                return false;
            }
            var fecha = new Date();
            alert("Registro del Alumno correcto, " + fecha);
        }
    </script>
</head>
<body>
    
    <form id="form1" runat="server" style="text-align: center;">
    <h2>Registro de Alumnos</h2>
            <label for="nombre"> Nombres:</label>
            
                <asp:TextBox ID="nombre" runat="server" ></asp:TextBox>
            <br />
        

            <label for="apellido"> Apellidos:</label>
            
                <asp:TextBox ID="apellido" runat="server" ></asp:TextBox>
            <br />
        

            <label> Sexo:</label>
            
                <div>
                    <asp:RadioButton ID="sexo_masculino" runat="server" value="masculino"/>
                    <label>Masculino</label>
                    
                </div>
                <div>
                    <asp:RadioButton ID="sexo_femenino" runat="server" value="femenino"/>
                    <label>Femenino</label>
                    
                </div>
            
            <br />

            <label for="email"> Email:</label>   
                    <asp:TextBox ID="email" runat="server" ></asp:TextBox>
                
            
            <br />

            <label for="direccion"> Dirección:</label>
            
                <asp:TextBox ID="direccion" runat="server" ></asp:TextBox>
            
            <br />
 
            <label for="city"> Ciudad:</label>
                
                <asp:DropDownList  ID="city" runat="server"> 
                </asp:DropDownList>
            
            <br />


            <label for="requerimentos"> Requerimentos:</label>
            
                <asp:TextBox ID="requerimentos" runat="server"></asp:TextBox>
            
            <br />
            
                <asp:Button ID="Button1" runat="server" Text="Limpiar" OnClientClick="return limpiar_contenido();" />
                <asp:Button ID="Button2" runat="server" Text="Enviar" OnClientClick="return verificar_contenido();"  OnClick="ButtonEnviar_Click"/>

            <br />
                
                <asp:TextBox ID="informacion" runat="server" class="form-control" cols="20" rows="4" TextMode="MultiLine" Visible="false"></asp:TextBox>
                
                   
        
    </form>
   
</body>
</html>