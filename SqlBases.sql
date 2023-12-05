CREATE TABLE Entidad_reguladora
(
  CodEntidad NUMBER(9),
  CONSTRAINT PK_Entidad_reguladora PRIMARY KEY (CodEntidad)
);

CREATE TABLE Gestor_responsable
(
  NIF VARCHAR2(9),
  Nombre VARCHAR2(50) NOT NULL,
  Apellido VARCHAR2(50) NOT NULL,
  DiaNacimiento NUMBER(2) NOT NULL,
  MesNacimiento NUMBER(2) NOT NULL,
  AnoNacimiento NUMBER(4) NOT NULL,
  Titulacion VARCHAR2(100) NOT NULL,
  Correo_electronico VARCHAR2(100) NOT NULL UNIQUE,
  Telefono_urgencia VARCHAR2(15) NOT NULL UNIQUE,
  CONSTRAINT PK_Gestor_responsable PRIMARY KEY (NIF),
  CONSTRAINT CHK_DiaNacimiento CHECK(DiaNacimiento < SYSDATE),
  CONSTRAINT CHK_MesNacimiento CHECK(MesNacimiento < SYSDATE),
  CONSTRAINT CHK_AnoNacimiento CHECK(AnoNacimiento < SYSDATE)
);

CREATE TABLE Granja
(
  NIF_titular VARCHAR2(9),
  GPS VARCHAR2(50) NOT NULL UNIQUE,
  Numero NUMBER(10) NOT NULL UNIQUE,
  Calle VARCHAR2(100) NOT NULL,
  CONSTRAINT PK_Granja PRIMARY KEY (NIF_Titular),
  CONSTRAINT CHK_Numero CHECK(Numero > 0)
);

CREATE TABLE Fabrica
(
  NIF_empresa VARCHAR2(9),
  GPS VARCHAR2(50) NOT NULL UNIQUE,
  Calle VARCHAR2(100) NOT NULL,
  Numero NUMBER(10) NOT NULL UNIQUE,
  Telefono_urgencias VARCHAR2(15) NOT NULL UNIQUE,
  Mail VARCHAR2(100) NOT NULL UNIQUE,
  CodRegistroSanitario VARCHAR2(50) NOT NULL UNIQUE,
  DiaFabrica NUMBER(2) NOT NULL,
  MesFabrica NUMBER(2) NOT NULL,
  AnoFabrica NUMBER(4) NOT NULL,
  Cantidad_proc_dia NUMBER(100),
  Cant_proc_mes NUMBER(100),
  Cant_proc_ano NUMBER(100),
  CONSTRAINT PK_Fabrica PRIMARY KEY (NIF_empresa),
  CONSTRAINT CHK_Numero CHECK(Numero > 0),
  CONSTRAINT CHK_DiaFabrica CHECK(DiaFabrica < SYSDATE),
  CONSTRAINT CHK_MesFabrica CHECK(MesFabrica < SYSDATE),
  CONSTRAINT CHK_AnoFabrica CHECK(AnoFabrica < SYSDATE),
  CONSTRAINT CHK_Cant_proc_dia CHECK(Cant_proc_dia >= 0),
  CONSTRAINT CHK_Cant_proc_mes CHECK(Cant_proc_mes >= 0),
  CONSTRAINT CHK_Cant_proc_ano CHECK(Cant_proc_ano >= 0)
);

CREATE TABLE Quimicos
(
  Cod_quimico NUMBER(9),
  Cant NUMBER(100),
  DiaQuimico NUMBER(2) NOT NULL,
  MesQuimico NUMBER(2) NOT NULL,
  AnoQuimico NUMBER(2) NOT NULL,
  CONSTRAINT PK_Quimicos PRIMARY KEY (Cod_Quimico),
  CONSTRAINT CHK_DiaQuimico CHECK(DiaQumico < SYSDATE),
  CONSTRAINT CHK_MesQuimico CHECK(MesQumico < SYSDATE),
  CONSTRAINT CHK_AnoQumico CHECK(AnoQumico < SYSDATE),
  CONSTRAINT CHK_Cant CHECK(Cant >= 0)
);

CREATE TABLE Destinatario
(
  NIF VARCHAR2(9),
  Calle VARCHAR2(100) NOT NULL,
  Numero NUMBER(10) NOT NULL UNIQUE,
  Web VARCHAR2(100) UNIQUE,
  Correo_electronico VARCHAR2(100) NOT NULL UNIQUE,
  Telefono NUMBER(15) NOT NULL UNIQUE,
  Telefono_urgencia NUMBER(15) NOT NULL UNIQUE,
  CONSTRAINT PK_Destinatario PRIMARY KEY (NIF),
  CONSTRAINT CHK_Numero CHECK(Numero > 0)
);

CREATE TABLE Empresa_logistica
(
  NIF VARCHAR2(9),
  Denominacion VARCHAR2(100) NOT NULL UNIQUE,
  Calle VARCHAR2(100) NOT NULL,
  Numero NUMBER(10) NOT NULL UNIQUE,
  CodAutorizacionMercan VARCHAR2(50) NOT NULL UNIQUE,
  CodAutorizacionAlim VARCHAR2(50) NOT NULL UNIQUE,
  DiaLogistica NUMBER(2) NOT NULL,
  MesLogistica NUMBER(2) NOT NULL,
  AnoLogistica NUMBER(4) NOT NULL,
  NIF_responsable VARCHAR(9) NOT NULL UNIQUE,
  CONSTRAINT PK_Empresa_logistica PRIMARY KEY (NIF),
  CONSTRAINT CHK_Numero CHECK(Numero > 0),
  CONSTRAINT CHK_DiaLogistica CHECK(DiaFabrica < SYSDATE),
  CONSTRAINT CHK_MesLogistica CHECK(MesFabrica < SYSDATE),
  CONSTRAINT CHK_AnoLogistica CHECK(AnoFabrica < SYSDATE)
);

CREATE TABLE Envases
(
  CodEnvase NUMBER(9),
  NIF_fabricante VARCHAR2(9) NOT NULL,
  Factor_resistencia_acidos VARCHAR2(100) NOT NULL,
  Opacidad VARCHAR2(50) NOT NULL,
  Tipo_reciclaje VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_Envases PRIMARY KEY (CodEnvase)
);

CREATE TABLE Alerta
(
  CodAlerta NUMBER(9),
  Tipo VARCHAR2(50) NOT NULL,
  DiaAlerta NUMBER(2) NOT NULL,
  MesAlerta NUMBER(2) NOT NULL,
  AnoAlerta NUMBER(4) NOT NULL,
  CodProducto NUMBER(9) NOT NULL UNIQUE,
  CodProductor NUMBER(9) NOT NULL,
  DiaIntervencion NUMBER(2) NOT NULL,
  MesIntervencion NUMBER(2) NOT NULL,
  AnoIntervencion NUMBER(4) NOT NULL,
  Intervencion VARCHAR2(100) NOT NULL,
  CONSTRAINT PK_Alerta PRIMARY KEY (CodAlerta),
  CONSTRAINT CHK_DiaAlerta CHECK(DiaAlerta < SYSDATE),
  CONSTRAINT CHK_MesAlerta CHECK(MesAlerta < SYSDATE),
  CONSTRAINT CHK_AnoAlerta CHECK(AnoAlerta < SYSDATE),
  CONSTRAINT CHK_DiaIntervencion CHECK(DiaIntervencion < SYSDATE),
  CONSTRAINT CHK_MesIntervencion CHECK(MesIntervencion < SYSDATE),
  CONSTRAINT CHK_AnoIntervencion CHECK(AnoIntervencion < SYSDATE)
);

CREATE TABLE Fertilizantes_y_Agroquimicos
(
  Cod_Producto NUMBER(9),
  Denominacion VARCHAR2(100) NOT NULL UNIQUE,
  Fabricante VARCHAR2(100) NOT NULL,
  Cant_Diaria NUMBER(100),
  Cant_Media_Semanal NUMBER(100),
  Cant_Media_Mensual NUMBER(100),
  NIF_Responsable VARCHAR2(9) NOT NULL,
  CONSTRAINT PK_Fertilizantes_y_Agroquimicos PRIMARY KEY (Cod_Producto),
  CONSTRAINT CHK_Cant_Diaria CHECK(Cant_Diaria >= 0),
  CONSTRAINT CHK_Cant_Media_Semanal CHECK(Cant_Media_Semanal >= 0),
  CONSTRAINT CHK_Cant_Mensual CHECK(Cant_Mensual >= 0)
);

CREATE TABLE Productos_Veterinarios_y_Vacunas
(
  Cod_Medicamento NUMBER(9),
  Cod_Fabricante NUMBER NOT NULL,
  DiaMedicamento NUMBER NOT NULL,
  MesMedicamento NUMBER NOT NULL,
  AnoMedicamento NUMBER NOT NULL,
  NIF_Responsable_Producto NUMBER NOT NULL,
  PRIMARY KEY (Cod_Medicamento)
);

CREATE TABLE Incorporar
(
  NIF_empresa NUMBER NOT NULL,
  Cod_quimico NUMBER NOT NULL,
  PRIMARY KEY (NIF_empresa, Cod_quimico),
  FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa),
  FOREIGN KEY (Cod_quimico) REFERENCES Quimicos(Cod_quimico)
);

CREATE TABLE Ir
(
  Cod_quimico NUMBER NOT NULL,
  NIF NUMBER NOT NULL,
  PRIMARY KEY (Cod_quimico, NIF),
  FOREIGN KEY (Cod_quimico) REFERENCES Quimicos(Cod_quimico),
  FOREIGN KEY (NIF) REFERENCES Destinatario(NIF)
);

CREATE TABLE Realizar
(
  Cod_quimico NUMBER NOT NULL,
  NIF NUMBER NOT NULL,
  PRIMARY KEY (Cod_quimico, NIF),
  FOREIGN KEY (Cod_quimico) REFERENCES Quimicos(Cod_quimico),
  FOREIGN KEY (NIF) REFERENCES Empresa_logistica(NIF)
);

CREATE TABLE Utilizar
(
  NIF_empresa NUMBER NOT NULL,
  CodEnvase NUMBER NOT NULL,
  PRIMARY KEY (NIF_empresa, CodEnvase),
  FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa),
  FOREIGN KEY (CodEnvase) REFERENCES Envases(CodEnvase)
);

CREATE TABLE Constar
(
  NIF_titular NUMBER NOT NULL,
  Cod_Medicamento NUMBER NOT NULL,
  PRIMARY KEY (NIF_titular, Cod_Medicamento),
  FOREIGN KEY (NIF_titular) REFERENCES Granja(NIF_titular),
  FOREIGN KEY (Cod_Medicamento) REFERENCES Productos_Veterinarios_y_Vacunas(Cod_Medicamento)
);

CREATE TABLE Productor
(
  NIF NUMBER NOT NULL,
  Denominacion VARCHAR2(100) NOT NULL,
  Numero VARCHAR2(10) NOT NULL,
  Calle VARCHAR2(100) NOT NULL,
  Web VARCHAR2(100) NOT NULL,
  Correo_electronico VARCHAR2(100) NOT NULL,
  Tipo_Sociedad VARCHAR2(50) NOT NULL,
  Telefono_normal VARCHAR2(15) NOT NULL,
  Telefono_urgencias VARCHAR2(15) NOT NULL,
  Cantidad_media_fact_mens NUMBER NOT NULL,
  Cantidad_media_fact_sem NUMBER NOT NULL,
  Cantidad_media_fact_anu NUMBER NOT NULL,
  Codigo_de_registro VARCHAR2(50) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Gestor_responsable(NIF)
);

CREATE TABLE Empresa
(
  NIF NUMBER NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Autonomo
(
  NIF NUMBER NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Ser_miembro
(
  Fecha DATE NOT NULL,
  Documento VARCHAR2(100) NOT NULL,
  CodEntidad NUMBER NOT NULL,
  NIF NUMBER NOT NULL,
  PRIMARY KEY (CodEntidad, NIF),
  FOREIGN KEY (CodEntidad) REFERENCES Entidad_reguladora(CodEntidad),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Producto
(
  CodProducto NUMBER NOT NULL,
  CodRegistroSanitario VARCHAR2(50) NOT NULL,
  FechaProduccion DATE NOT NULL,
  NomComercial VARCHAR2(100) NOT NULL,
  Descripcion VARCHAR2(200) NOT NULL,
  Etiqueta VARCHAR2(100) NOT NULL,
  CodAlerta NUMBER NOT NULL,
  NIF NUMBER NOT NULL,
  PRIMARY KEY (CodProducto),
  FOREIGN KEY (CodAlerta) REFERENCES Alerta(CodAlerta),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Aceite_de_oliva
(
  Acidez NUMBER NOT NULL,
  GPS VARCHAR2(50) NOT NULL,
  Riego_diario NUMBER NOT NULL,
  Riego_semanal NUMBER NOT NULL,
  Riego_mensual NUMBER NOT NULL,
  Composicion_quimica_suelo VARCHAR2(200) NOT NULL,
  CodProducto NUMBER NOT NULL,
  PRIMARY KEY (CodProducto),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE Vino
(
  Graduacion NUMBER NOT NULL,
  Tipo VARCHAR2(50) NOT NULL,
  GPS VARCHAR2(50) NOT NULL,
  Riego_diario NUMBER NOT NULL,
  Riego_semanal NUMBER NOT NULL,
  Riego_mensual NUMBER NOT NULL,
  Composicion_quimica_suelo VARCHAR2(200) NOT NULL,
  CodProducto NUMBER NOT NULL,
  PRIMARY KEY (CodProducto),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE Lacteos
(
  Temperatura_min NUMBER NOT NULL,
  Caducidad DATE NOT NULL,
  Tipo VARCHAR2(50) NOT NULL,
  CodTrazabilidad NUMBER NOT NULL,
  CodProducto NUMBER NOT NULL,
  PRIMARY KEY (CodProducto),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE Elaborar
(
  CodProducto NUMBER NOT NULL,
  NIF_empresa NUMBER NOT NULL,
  PRIMARY KEY (CodProducto, NIF_empresa),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
  FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa)
);

CREATE TABLE Provenir
(
  CodProducto NUMBER NOT NULL,
  NIF_titular NUMBER NOT NULL,
  PRIMARY KEY (CodProducto, NIF_titular),
  FOREIGN KEY (CodProducto) REFERENCES Lacteos(CodProducto),
  FOREIGN KEY (NIF_titular) REFERENCES Granja(NIF_titular)
);

CREATE TABLE Contener
(
  CodProducto NUMBER NOT NULL,
  Cod_Producto NUMBER NOT NULL,
  PRIMARY KEY (CodProducto, Cod_Producto),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
  FOREIGN KEY (Cod_Producto) REFERENCES Fertilizantes_y_Agroquimicos(Cod_Producto)
);

