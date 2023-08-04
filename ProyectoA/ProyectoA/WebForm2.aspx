<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ProyectoA.WebForm2" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Cookie</title>
<script type="text/javascript">

    function cookies() {
        var cookie = document.cookie;
        document.getElementById("TextCookie").value = "Enviado por sesión:";
        document.getElementById("TextCookie").value = cookie;

        return false;
    }
    function callAjax() {
        let send = $('#TextCookie').val();
        $.ajax({
            url: 'WebForm2.aspx/getInformacion',
            type: 'POST',
            async: true,
            data: '{ valor: "' + send + '"}',
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: exito
    });
        return false;
    }
        function exito(data) {
            var returnS = data.d;
            $('#TextBoxAjax').val(data.d);
            $('#TextBoxAjax').css("visibility", "visible");
            return false;
        }
</script>
</head>
<body>
    <div class="container">
    <form id="form1" runat="server">
        <div class="mb-3 row">
            <div class="cols-sm-2">
                <asp:Label ID="LabelUsuario" class="col-sm-1 col-form-label" runat="server"  Text="Label"></asp:Label>
            </div>
        </div>
        <div class="mb-3 row">
            <div class="cols-sm-2">
                <asp:Label ID="LabelNombre" class="col-sm-1 col-form-label" runat="server"  Text="Label"></asp:Label>
            </div>
        </div>
        <div class="mb-3 row">
            <div class="cols-sm-2">
                <asp:Label ID="LabelApellido" class="col-sm-1 col-form-label" runat="server"  Text="Label"></asp:Label>
            </div>
        </div>
        <div class="mb-3 row">
            <div class="cols-sm-2">
                <asp:Button ID="BtnMostrar" runat="server" class="btn btn-success btn-lg" OnClientClick="return cookies()" Text="Mostrar cookie" />
            </div>
        </div>
        <div class="mb-3 row">
            <div class="cols-sm-2">
                <asp:TextBox ID="TextCookie" Visible="true" class="form-control" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row mt-3">
            <div class="cols-sm-2">
                <asp:Button ID="ButtonAjax" runat="server" Text="Ajax"
                OnClientClick="return callAjax();" class="btn btn-success btn-lg" />
            </div>
        </div>
        <div class="row">
            <div class="form-group row mt-3">
                <div class="col-sm-9">
                    <div class="form-floating row mt-3">
                        <asp:TextBox ID="TextBoxAjax" runat="server" class="form-control"
                        Style="visibility: hidden"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
      
    </form>
    </div>

</body>
</html>