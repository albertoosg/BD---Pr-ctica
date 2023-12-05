CREATE TABLE Entidad_reguladora(
  CodEntidad NUMBER NOT NULL,
  PRIMARY KEY (CodEntidad)
);

CREATE TABLE Gestor_responsable(
  NIF NUMBER NOT NULL,
  Nombre VARCHAR2(50) NOT NULL,
  Apellido VARCHAR2(50) NOT NULL,
  DiaNacimiento NUMBER NOT NULL,
  MesNacimiento NUMBER NOT NULL,
  AnoNacimiento NUMBER NOT NULL,
  Titulacion VARCHAR2(100) NOT NULL,
  Correo_electronico VARCHAR2(100) NOT NULL,
  Telefono_urgencia VARCHAR2(15) NOT NULL,
  PRIMARY KEY (NIF)
);

CREATE TABLE Granja(
  GPS VARCHAR2(50) NOT NULL,
  Numero VARCHAR2(10) NOT NULL,
  Calle VARCHAR2(100) NOT NULL,
  NIF_titular NUMBER NOT NULL,
  PRIMARY KEY (NIF_titular)
);

CREATE TABLE Fabrica(
  GPS VARCHAR2(50) NOT NULL,
  Calle VARCHAR2(100) NOT NULL,
  Numero VARCHAR2(10) NOT NULL,
  NIF_empresa NUMBER NOT NULL,
  Telefono_urgencias VARCHAR2(15) NOT NULL,
  Mail VARCHAR2(100) NOT NULL,
  CodRegistroSanitario VARCHAR2(50) NOT NULL,
  DiaFabrica NUMBER NOT NULL,
  MesFabrica NUMBER NOT NULL,
  AnoFabrica NUMBER NOT NULL,
  Cantidad_proc_dia NUMBER NOT NULL,
  Cant_proc_mes NUMBER NOT NULL,
  Cant_proc_ano NUMBER NOT NULL,
  PRIMARY KEY (NIF_empresa)
);

CREATE TABLE Quimicos(
  Cod_quimico NUMBER NOT NULL,
  Cant NUMBER NOT NULL,
  DiaQuimico NUMBER NOT NULL,
  MesQuimico NUMBER NOT NULL,
  AnoQuimico NUMBER NOT NULL,
  PRIMARY KEY (Cod_quimico)
);

CREATE TABLE Destinatario(
  NIF NUMBER NOT NULL,
  Calle VARCHAR2(100) NOT NULL,
  Numero VARCHAR2(10) NOT NULL,
  Web VARCHAR2(100) NOT NULL,
  Correo_electronico VARCHAR2(100) NOT NULL,
  Telefono VARCHAR2(15) NOT NULL,
  Telefono_urgencia VARCHAR2(15) NOT NULL,
  PRIMARY KEY (NIF)
);

CREATE TABLE Empresa_logistica(
  NIF NUMBER NOT NULL,
  Denominacion VARCHAR2(100) NOT NULL,
  Calle VARCHAR2(100) NOT NULL,
  Numero VARCHAR2(10) NOT NULL,
  CodAutorizacionMercan VARCHAR2(50) NOT NULL,
  CodAutorizacionAlim VARCHAR2(50) NOT NULL,
  DiaLogistica NUMBER NOT NULL,
  MesLogistica NUMBER NOT NULL,
  AnoLogistica NUMBER NOT NULL,
  NIF_responsable NUMBER NOT NULL,
  PRIMARY KEY (NIF)
);

CREATE TABLE Envases(
  NIF_fabricante NUMBER NOT NULL,
  CodEnvase NUMBER NOT NULL,
  Factor_resistencia_acidos NUMBER NOT NULL,
  Opacidad NUMBER NOT NULL,
  Tipo_reciclaje VARCHAR2(50) NOT NULL,
  PRIMARY KEY (CodEnvase)
);

CREATE TABLE Alerta(
  CodAlerta NUMBER NOT NULL,
  Tipo VARCHAR2(50) NOT NULL,
  DiaAlerta NUMBER NOT NULL,
  MesAlerta NUMBER NOT NULL,
  AnoAlerta NUMBER NOT NULL,
  CodProducto NUMBER NOT NULL,
  CodProductor NUMBER NOT NULL,
  DiaIntervencion NUMBER NOT NULL,
  MesIntervencion NUMBER NOT NULL,
  AnoIntervencion NUMBER NOT NULL,
  Intervencion VARCHAR2(100) NOT NULL,
  PRIMARY KEY (CodAlerta)
);

CREATE TABLE Fertilizantes_y_Agroquimicos(
  Cod_Producto NUMBER NOT NULL,
  Denominacion VARCHAR2(100) NOT NULL,
  Fabricante VARCHAR2(100) NOT NULL,
  Cant_Diaria NUMBER NOT NULL,
  Cant_Media_Semanal NUMBER NOT NULL,
  Cant_Media_Mensual NUMBER NOT NULL,
  NIF_Responsable NUMBER NOT NULL,
  PRIMARY KEY (Cod_Producto)
);

CREATE TABLE Productos_Veterinarios_y_Vacunas(
  Cod_Medicamento NUMBER NOT NULL,
  Cod_Fabricante NUMBER NOT NULL,
  DiaMedicamento NUMBER NOT NULL,
  MesMedicamento NUMBER NOT NULL,
  AnoMedicamento NUMBER NOT NULL,
  NIF_Responsable_Producto NUMBER NOT NULL,
  PRIMARY KEY (Cod_Medicamento)
);

CREATE TABLE Incorporar(
  NIF_empresa NUMBER NOT NULL,
  Cod_quimico NUMBER NOT NULL,
  PRIMARY KEY (NIF_empresa, Cod_quimico),
  FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa),
  FOREIGN KEY (Cod_quimico) REFERENCES Quimicos(Cod_quimico)
);

CREATE TABLE Ir(
  Cod_quimico NUMBER NOT NULL,
  NIF NUMBER NOT NULL,
  PRIMARY KEY (Cod_quimico, NIF),
  FOREIGN KEY (Cod_quimico) REFERENCES Quimicos(Cod_quimico),
  FOREIGN KEY (NIF) REFERENCES Destinatario(NIF)
);

CREATE TABLE Realizar(
  Cod_quimico NUMBER NOT NULL,
  NIF NUMBER NOT NULL,
  PRIMARY KEY (Cod_quimico, NIF),
  FOREIGN KEY (Cod_quimico) REFERENCES Quimicos(Cod_quimico),
  FOREIGN KEY (NIF) REFERENCES Empresa_logistica(NIF)
);

CREATE TABLE Utilizar(
  NIF_empresa NUMBER NOT NULL,
  CodEnvase NUMBER NOT NULL,
  PRIMARY KEY (NIF_empresa, CodEnvase),
  FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa),
  FOREIGN KEY (CodEnvase) REFERENCES Envases(CodEnvase)
);

CREATE TABLE Constar(
  NIF_titular NUMBER NOT NULL,
  Cod_Medicamento NUMBER NOT NULL,
  PRIMARY KEY (NIF_titular, Cod_Medicamento),
  FOREIGN KEY (NIF_titular) REFERENCES Granja(NIF_titular),
  FOREIGN KEY (Cod_Medicamento) REFERENCES Productos_Veterinarios_y_Vacunas(Cod_Medicamento)
);

CREATE TABLE Productor(
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

CREATE TABLE Empresa(
  NIF NUMBER NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Autonomo(
  NIF NUMBER NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Ser_miembro(
  Fecha DATE NOT NULL,
  Documento VARCHAR2(100) NOT NULL,
  CodEntidad NUMBER NOT NULL,
  NIF NUMBER NOT NULL,
  PRIMARY KEY (CodEntidad, NIF),
  FOREIGN KEY (CodEntidad) REFERENCES Entidad_reguladora(CodEntidad),
  FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Producto(
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

CREATE TABLE Aceite_de_oliva(
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

CREATE TABLE Vino(
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

CREATE TABLE Lacteos(
  Temperatura_min NUMBER NOT NULL,
  Caducidad DATE NOT NULL,
  Tipo VARCHAR2(50) NOT NULL,
  CodTrazabilidad NUMBER NOT NULL,
  CodProducto NUMBER NOT NULL,
  PRIMARY KEY (CodProducto),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE Elaborar(
  CodProducto NUMBER NOT NULL,
  NIF_empresa NUMBER NOT NULL,
  PRIMARY KEY (CodProducto, NIF_empresa),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
  FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa)
);

CREATE TABLE Provenir(
  CodProducto NUMBER NOT NULL,
  NIF_titular NUMBER NOT NULL,
  PRIMARY KEY (CodProducto, NIF_titular),
  FOREIGN KEY (CodProducto) REFERENCES Lacteos(CodProducto),
  FOREIGN KEY (NIF_titular) REFERENCES Granja(NIF_titular)
);

CREATE TABLE Contener(
  CodProducto NUMBER NOT NULL,
  Cod_Producto NUMBER NOT NULL,
  PRIMARY KEY (CodProducto, Cod_Producto),
  FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
  FOREIGN KEY (Cod_Producto) REFERENCES Fertilizantes_y_Agroquimicos(Cod_Producto)
);

