CREATE TABLE Entidad_reguladora
(
  CodEntidad NUMERIC NOT NULL,
  PRIMARY KEY (CodEntidad)
);

CREATE TABLE Gestor_responsable
(
  NIF VARCHAR(9) NOT NULL,
  Nombre VARCHAR(250) NOT NULL,
  Apellido VARCHAR(250) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  Titulación VARCHAR(250) NOT NULL,
  Correo_electronico VARCHAR(250) NOT NULL,
  Telefono_urgencia NUMERIC(9) NOT NULL,
  PRIMARY KEY (NIF)
);

CREATE TABLE Granja
(
  GPS VARCHAR(250) NOT NULL,
  Número NUMERIC(2) NOT NULL,
  Calle VARCHAR(10) NOT NULL,
  NIF_titular VARCHAR(9) NOT NULL,
  PRIMARY KEY (NIF_titular)
);

CREATE TABLE Fabrica
(
  GPS VARCHAR(250) NOT NULL,
  Calle VARCHAR(10) NOT NULL,
  Número NUMERIC(2) NOT NULL,
  NIF_empresa VARCHAR(9) NOT NULL,
  Telefono_urgencias NUMERIC(9) NOT NULL,
  Mail VARCHAR(250) NOT NULL,
  CodRegistroSanitario VARCHAR(250) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  Cantidad_proc_dia NUMERIC(250) NOT NULL,
  Cant_proc_mes NUMERIC(250) NOT NULL,
  Cant_proc_año NUMERIC(250) NOT NULL,
  PRIMARY KEY (NIF_empresa)
);

CREATE TABLE Químicos
(
  Cod_quimico VARCHAR(250) NOT NULL,
  Cant NUMERIC(250) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  PRIMARY KEY (Cod_quimico)
);

CREATE TABLE Destinatario
(
  NIF VARCHAR(9) NOT NULL,
  Calle VARCHAR(10) NOT NULL,
  Número NUMERIC(2) NOT NULL,
  Web VARCHAR(250) NOT NULL,
  Correo_electrónico VARCHAR(250) NOT NULL,
  Telefono_ NUMERIC(9) NOT NULL,
  Telefono_urgencia NUMERIC(9) NOT NULL,
  PRIMARY KEY (NIF)
);

CREATE TABLE Empresa_logistica
(
  NIF VARCHAR(250) NOT NULL,
  Denominación VARCHAR(250) NOT NULL,
  Calle VARCHAR(250) NOT NULL,
  Número NUMERIC(10) NOT NULL,
  CodAutorizacionMercan VARCHAR(250) NOT NULL,
  CodAutorizacionAlim VARCHAR(250) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  NIF_responsable VARCHAR(250) NOT NULL,
  PRIMARY KEY (NIF)
);

CREATE TABLE Envases
(
  NIF_fabricante VARCHAR(250) NOT NULL,
  CodEnvase VARCHAR(250) NOT NULL,
  Factor_resistencia_acidos VARCHAR(250) NOT NULL,
  Opacidad VARCHAR(250) NOT NULL,
  Tipo_reciclaje VARCHAR(250) NOT NULL,
  PRIMARY KEY (CodEnvase)
);

CREATE TABLE Alerta
(
  CodAlerta VARCHAR(250) NOT NULL,
  Tipo VARCHAR(1) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  CodProducto VARCHAR(250 ) NOT NULL,
  CodProductor VARCHAR(250) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  Intervención VARCHAR(250) NOT NULL,
  PRIMARY KEY (CodAlerta)
);

CREATE TABLE _Incorporar
(
  NIF_empresa VARCHAR(9) NOT NULL,
  Cod_quimico VARCHAR(250) NOT NULL,
  PRIMARY KEY (NIF_empresa, Cod_quimico),
  FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa),
  FOREIGN KEY (Cod_quimico) REFERENCES Químicos(Cod_quimico)
);

CREATE TABLE Ir
(
  Cod_quimico VARCHAR(250) NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (Cod_quimico, NIF),
  FOREIGN KEY (Cod_quimico) REFERENCES Químicos(Cod_quimico),
  FOREIGN KEY (NIF) REFERENCES Destinatario(NIF)
);

CREATE TABLE Realizar
(
  Cod_quimico VARCHAR(250) NOT NULL,
  NIF VARCHAR(250) NOT NULL,
  PRIMARY KEY (Cod_quimico, NIF),
  FOREIGN KEY (Cod_quimico) REFERENCES Químicos(Cod_quimico),
  FOREIGN KEY (NIF) REFERENCES Empresa_logistica(NIF)
);

CREATE TABLE Utilizar
(
  NIF_empresa VARCHAR(9) NOT NULL,
  CodEnvase VARCHAR(250) NOT NULL,
  PRIMARY KEY (NIF_empresa, CodEnvase),
  FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa),
  FOREIGN KEY (CodEnvase) REFERENCES Envases(CodEnvase)
);

CREATE TABLE Productor
(
  NIF VARCHAR(250) NOT NULL,
  Denominación VARCHAR(250) NOT NULL,
  Número NUMERIC(10) NOT NULL,
  Calle VARCHAR(2550) NOT NULL,
  Web VARCHAR(250) NOT NULL,
  Correo_electrónico VARCHAR(250) NOT NULL,
  Tipo_Sociedad VARCHAR(250) NOT NULL,
  Telefono_normal NUMERIC(9) NOT NULL,
  Telefono_urgencias NUMERIC(9) NOT NULL,
  Cantidad_media_fact_mens VARCHAR(250) NOT NULL,
  Cantidad_media_fact_sem VARCHAR(250) NOT NULL,
  Cantidad_media_fact_anu VARCHAR(250) NOT NULL,
  Codigo_de_registro VARCHAR(250) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Gestor_responsable(NIF)
);

CREATE TABLE Empresa
(
  NIF VARCHAR(250) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Autónomo
(
  NIF VARCHAR(250) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Ser_miembro
(
  Documento VARCHAR(250) NOT NULL,
  Dia NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  CodEntidad NUMERIC NOT NULL,
  NIF VARCHAR(250) NOT NULL,
  PRIMARY KEY (CodEntidad, NIF),
  FOREIGN KEY (CodEntidad) REFERENCES Entidad_reguladora(CodEntidad),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Producto
(
  CodProducto VARCHAR(250) NOT NULL,
  CodRegistroSanitario VARCHAR(250) NOT NULL,
  Día NUMERIC(2) NOT NULL,
  Mes NUMERIC(2) NOT NULL,
  Año NUMERIC(4) NOT NULL,
  NomComercial VARCHAR(250) NOT NULL,
  Descripción VARCHAR(250) NOT NULL,
  Etiqueta VARCHAR(250) NOT NULL,
  CodAlerta VARCHAR(250) NOT NULL,
  NIF VARCHAR(250) NOT NULL,
  PRIMARY KEY (CodProducto),
  FOREIGN KEY (CodAlerta) REFERENCES Alerta(CodAlerta),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Aceite_de_oliva
(
  Acidez VARCHAR(250) NOT NULL,
  GPS VARCHAR(250) NOT NULL,
  Riego_diario VARCHAR(250) NOT NULL,
  Riego_semanal VARCHAR(250) NOT NULL,
  Riego_mensual VARCHAR(250) NOT NULL,
  Composición_química_suelo VARCHAR(250) NOT NULL,
  CodProducto VARCHAR(250) NOT NULL,
  PRIMARY KEY (CodProducto),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE Vino
(
  Graduación NUMERIC(2) NOT NULL,
  Tipo VARCHAR(250) NOT NULL,
  GPS VARCHAR(250) NOT NULL,
  Riego_diario VARCHAR(250) NOT NULL,
  Riego_semanal VARCHAR(250) NOT NULL,
  Riego_mensual VARCHAR(250) NOT NULL,
  Composición_química_suelo VARCHAR(250) NOT NULL,
  CodProducto VARCHAR(250) NOT NULL,
  PRIMARY KEY (CodProducto),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE Lácteos
(
  Temperatura_min NUMERIC(4) NOT NULL,
  Tipo VARCHAR(250) NOT NULL,
  CodTrazabilidad VARCHAR(250) NOT NULL,
  Fecha_Caducidad_dia NUMERIC(2) NOT NULL,
  Fecha_Caducidad_mes NUMERIC(2) NOT NULL,
  Fecha_Caducidad_año NUMERIC(4) NOT NULL,
  CodProducto VARCHAR(250) NOT NULL,
  PRIMARY KEY (CodProducto),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE Elaborar
(
  CodProducto VARCHAR(250) NOT NULL,
  NIF_empresa VARCHAR(9) NOT NULL,
  PRIMARY KEY (CodProducto, NIF_empresa),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
  FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa)
);

CREATE TABLE Provenir
(
  CodProducto VARCHAR(250) NOT NULL,
  NIF_titular VARCHAR(9) NOT NULL,
  PRIMARY KEY (CodProducto, NIF_titular),
  FOREIGN KEY (CodProducto) REFERENCES Lácteos(CodProducto),
  FOREIGN KEY (NIF_titular) REFERENCES Granja(NIF_titular)
);