﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Servicios
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        IList<String> cargarCiudades();
        [OperationContract]
        void ingresarTablaWeb(string nom, string ape, string sex, string ema, string dir, string ciu, string req);
        [OperationContract]
        bool consultarNombre(string nom, string ape);
    }

}
