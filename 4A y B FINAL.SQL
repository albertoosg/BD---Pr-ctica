-- CREATE TABLES ORACLE 

CREATE TABLE Entidad_reguladora
(
  CodEntidad VARCHAR2(9),
  CONSTRAINT PK_Entidad_reguladora PRIMARY KEY (CodEntidad)
);

CREATE TABLE Gestor_responsable
(
  NIF VARCHAR2(9),
  Nombre VARCHAR2(50) NOT NULL,
  Apellido VARCHAR2(50) NOT NULL,
  Fecha_Nacimiento DATE NOT NULL,
  Fecha_Responsable DATE NOT NULL,
  Titulacion VARCHAR2(100) NOT NULL,
  Correo_electronico VARCHAR2(100) NOT NULL UNIQUE,
  Telefono_urgencia VARCHAR2(15) NOT NULL UNIQUE,
  CONSTRAINT PK_Gestor_responsable PRIMARY KEY (NIF),
  CONSTRAINT CHK_Fecha_Nacimiento CHECK(Fecha_Nacimiento < to_char(sysdate,'DD-MON-YYYY')),
  CONSTRAINT CHK_Fecha_Responsable CHECK(Fecha_Responsable < to_char(sysdate,'DD-MON-YYYY')),
);

CREATE TABLE Granja
(
  NIF_titular VARCHAR2(9),
  GPS VARCHAR2(50) NOT NULL UNIQUE,
  Numero NUMBER(10) NOT NULL UNIQUE,
  Calle VARCHAR2(100) NOT NULL,
  CONSTRAINT PK_Granja PRIMARY KEY (NIF_titular),
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
  Fecha_Validez DATE NOT NULL,
  Cantidad_proc_dia NUMBER(38),
  Cant_proc_mes NUMBER(38),
  Cant_proc_ano NUMBER(38),
  CONSTRAINT PK_Fabrica PRIMARY KEY (NIF_empresa),
  CONSTRAINT CHK_Numero CHECK(Numero > 0),
  CONSTRAINT CHK_Fecha_Validez CHECK(Fecha_Validez < to_char(sysdate,'DD-MON-YYYY')),
  CONSTRAINT CHK_Cant_proc_dia CHECK(Cant_proc_dia >= 0),
  CONSTRAINT CHK_Cant_proc_mes CHECK(Cant_proc_mes >= 0),
  CONSTRAINT CHK_Cant_proc_ano CHECK(Cant_proc_ano >= 0)
);

CREATE TABLE Quimicos
(
  Cod_quimico VARCHAR2(9),
  Cant NUMBER(38),
  Fecha_Salida DATE NOT NULL,
  CONSTRAINT PK_Quimicos PRIMARY KEY (Cod_Quimico),
  CONSTRAINT CHK_Fecha_Salidao CHECK(Fecha_Salida < to_char(sysdate,'DD-MON-YYYY')),
  CONSTRAINT CHK_Cant CHECK(Cant >= 0)
);

CREATE TABLE Destinatario
(
  NIF VARCHAR2(9),
  Calle VARCHAR2(100) NOT NULL UNIQUE,
  Numero NUMBER(10) NOT NULL UNIQUE,
  Web VARCHAR2(100) UNIQUE,
  Correo_electronico VARCHAR2(100) NOT NULL UNIQUE,
  Telefono VARCHAR2(15) NOT NULL,
  Telefono_urgencia VARCHAR2(15) NOT NULL UNIQUE,
  CONSTRAINT PK_Destinatario PRIMARY KEY (NIF),
  CONSTRAINT CHK_Numero CHECK(Numero > 0)
);

CREATE TABLE Empresa_logistica
(
  NIF VARCHAR2(9),
  Denominacion VARCHAR2(100) NOT NULL UNIQUE,
  Calle VARCHAR2(100) NOT NULL UNIQUE,
  Numero NUMBER(10) NOT NULL UNIQUE,
  CodAutorizacionMercan VARCHAR2(50) NOT NULL UNIQUE,
  CodAutorizacionAlim VARCHAR2(50) NOT NULL UNIQUE,
  Fecha_Validez DATE NOT NULL,
  NIF_responsable VARCHAR(9) NOT NULL UNIQUE,
  CONSTRAINT PK_Empresa_logistica PRIMARY KEY (NIF),
  CONSTRAINT CHK_Numero CHECK(Numero > 0),
  CONSTRAINT CHK_Fecha_Validez  CHECK(Fecha_Validez > to_char(sysdate,'DD-MON-YYYY')),
);

CREATE TABLE Envases
(
  CodEnvase NUMBER(9),
  NIF_fabricante VARCHAR2(9) NOT NULL,
  Opacidad NUMBER(2,1) NOT NULL,
  Factor_resistencia_acidos NUMBER(3,2) NOT NULL,
  Tipo_reciclaje VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_Envases PRIMARY KEY (CodEnvase),
  CONSTRAINT CHK_Opacidad CHECK(0.0 <= Opacidad <= 1.0 ),
  CONSTRAINT CHK_Factor_resistencia_acidos CHECK(0.00 <= Factor_resistencia_acidos <= 1.00 )
);

CREATE TABLE Alertas
(
  CodAlerta1 VARCHAR2(200),
  Tipo VARCHAR2(50) NOT NULL,
  Fecha_Deteccion DATE NOT NULL,
  CodProducto VARCHAR2(200) NOT NULL UNIQUE,
  CodProductor VARCHAR2(200) NOT NULL,
  Fecha_Activacion DATE NOT NULL,
  Fecha_Desactivacion DATE NOT NULL,
  Intervencion VARCHAR2(100) NOT NULL,
  CONSTRAINT PK_Alertas PRIMARY KEY (CodAlerta1),
  CONSTRAINT CHK_Fecha_Detencion CHECK(Fecha_Detencion < to_char(sysdate,'DD-MON-YYYY')),
  CONSTRAINT CHK_Fecha_Desactivacion CHECK(Fecha_Desactivacion  < to_char(sysdate,'DD-MON-YYYY')),
  CONSTRAINT CHK_Tipo CHECK(Tipo = 'A' || 'B' || 'E' || 'F')
);


CREATE TABLE Fertilizantes_y_Agroquimicos
(
  Cod_Producto NUMBER(9),
  Denominacion VARCHAR2(100) NOT NULL UNIQUE,
  Fabricante VARCHAR2(100) NOT NULL,
  Cant_Diaria NUMBER(38),
  Cant_Media_Semanal NUMBER(38),
  Cant_Media_Mensual NUMBER(38),
  NIF_Responsable VARCHAR2(9) NOT NULL,
  CONSTRAINT PK_Fertilizantes_y_Agroquimicos PRIMARY KEY (Cod_Producto),
  CONSTRAINT CHK_Cant_Diaria CHECK(Cant_Diaria >= 0),
  CONSTRAINT CHK_Cant_Media_Semanal CHECK(Cant_Media_Semanal >= 0),
  CONSTRAINT CHK_Cant_Mensual CHECK(Cant_Mensual >= 0)
);

CREATE TABLE Productos_Veterinarios_y_Vacunas
(
  Cod_Medicamento VARCHAR2(100),
  Cod_Fabricante VARCHAR2(100) NOT NULL,
  Fecha_Caducidad DATE NOT NULL,
  Fecha_Aplicacion DATE NOT NULL,
  NIF_Responsable_Producto VARCHAR2(100),
  CONSTRAINT PK_Productos_Veterinarios_y_Vacunas PRIMARY KEY (Cod_Medicamento),
  CONSTRAINT CHK_Fecha_Caducidad CHECK(Fecha_Caducidad > to_char(sysdate,'DD-MON-YYYY')),
  CONSTRAINT CHK_Fecha_Aplicacion CHECK(Fecha_Aplicacion < to_char(sysdate,'DD-MON-YYYY')),
);

CREATE TABLE Incorporar
(
  NIF_empresa VARCHAR2(9),
  Cod_quimico VARCHAR2(100),
  CONSTRAINT PK_Incorporar PRIMARY KEY (NIF_empresa, Cod_quimico),
  CONSTRAINT Incorporar_FK_Fabrica FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa),
  CONSTRAINT Incorporar_FK_Quimicos FOREIGN KEY (Cod_quimico) REFERENCES Químicos(Cod_quimico)
);

CREATE TABLE Ir
(
  Cod_quimico VARCHAR2(100),
  NIF VARCHAR2(9) NOT NULL,
  CONSTRAINT PK_Ir PRIMARY KEY (Cod_quimico, NIF),
  CONSTRAINT Ir_FK_Quimicos FOREIGN KEY (Cod_quimico) REFERENCES Quimicos(Cod_quimico),
  CONSTRAINT Ir_FK_Destinatario FOREIGN KEY (NIF) REFERENCES Destinatario(NIF)
);

CREATE TABLE Realizar
(
  Cod_quimico VARCHAR2(100),
  NIF VARCHAR2(9),
  CONSTRAINT PK_Realizar PRIMARY KEY (Cod_quimico, NIF),
  CONSTRAINT Realizar_FK_Quimicos FOREIGN KEY (Cod_quimico) REFERENCES Quimicos(Cod_quimico),
  CONSTRAINT Realizar_FK_Empresa_logistica FOREIGN KEY (NIF) REFERENCES Empresa_logistica(NIF)
);

CREATE TABLE Utilizar
(
  NIF_empresa VARCHAR2(9),
  CodEnvase VARCHAR2(100),
  CONSTRAINT PK_Utilizar PRIMARY KEY (NIF_empresa, CodEnvase),
  CONSTRAINT Utilizar_FK_Fabrica FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa),
  CONSTRAINT Utilizar_FK_Envases FOREIGN KEY (CodEnvase) REFERENCES Envases(CodEnvase)
);

CREATE TABLE Constar
(
  NIF_titular VARCHAR2(9),
  Cod_Medicamento VARCHAR2(100),
  CONSTRAINT PK_Constar PRIMARY KEY (NIF_titular, Cod_Medicamento),
  CONSTRAINT Constar_FK_Granja FOREIGN KEY (NIF_titular) REFERENCES Granja(NIF_titular),
  CONSTRAINT Constar_FK_Productos_Veterinarios_y_Vacunas FOREIGN KEY (Cod_Medicamento) REFERENCES Productos_Veterinarios_y_Vacunas(Cod_Medicamento)
);

CREATE TABLE Productor
(
  NIF VARCHAR2(9),
  Denominación VARCHAR2(100) NOT NULL UNIQUE,
  Numero NUMBER(10) NOT NULL UNIQUE,
  Calle VARCHAR2(100) NOT NULL,
  Web VARCHAR2(100) NOT NULL UNIQUE,
  Correo_electrónico VARCHAR2(100) NOT NULL UNIQUE,
  Tipo_Sociedad VARCHAR2(50) NOT NULL,
  Telefono_normal VARCHAR2(15) NOT NULL UNIQUE,
  Telefono_urgencias VARCHAR2(15) NOT NULL UNIQUE,
  Cantidad_media_fact_sem VARCHAR2(50) NOT NULL,
  Cantidad_media_fact_mens NUMBER(38) NOT NULL,
  Cantidad_media_fact_anu NUMBER(50) NOT NULL,
  Codigo_de_registro VARCHAR2(50) NOT NULL UNIQUE,
  Fecha_Autorizacion DATE NOT NULL,
  Fecha_Validez DATE NOT NULL,
  CONSTRAINT PK_Productor PRIMARY KEY (NIF),
  CONSTRAINT Productor_FK_Gestor_responsable FOREIGN KEY (NIF) REFERENCES Gestor_responsable(NIF),
  CONSTRAINT CHK_Numero CHECK(Numero > 0),
  CONSTRAINT CHK_Cantidad_media_fact_mens CHECK(Cantidad_media_fact_mens >= 0),
  CONSTRAINT CHK_Cantidad_media_fact_sem CHECK(Cantidad_media_fact_sem >= 0),
  CONSTRAINT CHK_Cantidad_media_fact_anu CHECK(Cantidad_media_fact_anu >= 0),
);

CREATE TABLE Empresa
(
  NIF VARCHAR2(9),
  CONSTRAINT PK_Empresa PRIMARY KEY (NIF),
  CONSTRAINT Empresa_FK_Productor FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Autonomo
(
  NIF VARCHAR2(9),
  CONSTRAINT PK_Autonomo PRIMARY KEY (NIF),
  CONSTRAINT Autonomo_FK_Productor FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Ser_miembro
(
  Fecha DATE NOT NULL,
  Documento VARCHAR2(100),
  CodEntidad VARCHAR2(100),
  NIF VARCHAR(9),
  CONSTRAINT PK_Ser_miembro PRIMARY KEY (CodEntidad, NIF),
  CONSTRAINT Ser_miembro_FK_Entidad FOREIGN KEY (CodEntidad) REFERENCES Entidad_reguladora(CodEntidad),
  CONSTRAINT Ser_miembro_FK_Productor FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Producto
(
  CodProducto VARCHAR2(200),
  CodRegistroSanitario VARCHAR2(50) NOT NULL,
  Fecha_Validez DATE NOT NULL,
  NomComercial VARCHAR2(100) NOT NULL UNIQUE,
  Descripción VARCHAR2(200),
  Etiqueta VARCHAR2(100) NOT NULL UNIQUE,
  CodAlerta1 VARCHAR2(200),
  NIF VARCHAR2(9),
  CONSTRAINT PK_Producto PRIMARY KEY (CodProducto),
  CONSTRAINT Producto_FK_Alertas FOREIGN KEY (CodAlerta1) REFERENCES Alertas(CodAlerta1),
  CONSTRAINT Producto_FK_Productor FOREIGN KEY (NIF) REFERENCES Productor(NIF)
);

CREATE TABLE Aceite_de_oliva
(
  Acidez NUMBER (10,2)NOT NULL,
  GPS VARCHAR2(50) NOT NULL UNIQUE,
  Riego_diario NUMBER(38) NOT NULL,
  Riego_semanal NUMBER(38) NOT NULL,
  Riego_mensual NUMBER(38) NOT NULL,
  Composición_química_suelo VARCHAR2(9) NOT NULL,
  CodProducto VARCHAR2(200),
  CONSTRAINT PK_Aceite_de_oliva PRIMARY KEY (CodProducto),
  CONSTRAINT Aceite_de_oliva_FK_Producto PFOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
  CONSTRAINT CHK_Riego_diario CHECK(Riego_diario >=0),
  CONSTRAINT CHK_Riego_semanal CHECK(Riego_semanal >=0),
  CONSTRAINT CHK_Riego_mensual CHECK(Riego_mensual >=0),
);

CREATE TABLE Vino
(
  Graduación NUMBER(20) NOT NULL,
  Tipo VARCHAR2(50) NOT NULL,
  GPS VARCHAR2(50) NOT NULL UNIQUE,
  Riego_diario NUMBER(38) NOT NULL,
  Riego_semanal NUMBER(38) NOT NULL,
  Riego_mensual NUMBER(38) NOT NULL,
  Composición_química_suelo VARCHAR2(200) NOT NULL,
  CodProducto VARCHAR2(200),
  CONSTRAINT PK_Vino PRIMARY KEY (CodProducto),
  CONSTRAINT Vino_FK_Producto FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
  CONSTRAINT CHK_Riego_diario CHECK(Riego_diario >=0),
  CONSTRAINT CHK_Riego_semanal CHECK(Riego_semanal >=0),
  CONSTRAINT CHK_Riego_mensual CHECK(Riego_mensual >=0),
);

CREATE TABLE Lacteos
(
  Temperatura_min VARCHAR2(20) NOT NULL,
  Caducidad DATE NOT NULL,
  Tipo VARCHAR2(200) NOT NULL,
  CodTrazabilidad VARCHAR2(200) NOT NULL,
  CodProducto VARCHAR2(200) NOT NULL,
  CONSTRAINT PK_Lacteos PRIMARY KEY (CodProducto),
  CONSTRAINT Lacteos_FK_Producto FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE Elaborar
(
  CodProducto VARCHAR2(200),
  NIF_empresa VARCHAR2(9),
  CONSTRAINT PK_Elaborar PRIMARY KEY (CodProducto, NIF_empresa),
  CONSTRAINT Elaborar_FK_Producto FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
  CONSTRAINT Elaborar_FK_Fabrica FOREIGN KEY (NIF_empresa) REFERENCES Fabrica(NIF_empresa)
);

CREATE TABLE Provenir
(
  CodProducto VARCHAR2(200),
  NIF_titular VARCHAR2(9),
  CONSTRAINT PK_Provenir PRIMARY KEY (CodProducto, NIF_titular),
  CONSTRAINT Provenir_FK_Lacteos FOREIGN KEY (CodProducto) REFERENCES Lacteos(CodProducto),
  CONSTRAINT Provenir_FK_Granja FOREIGN KEY (NIF_titular) REFERENCES Granja(NIF_titular)
);

CREATE TABLE Contener
(
  CodProducto VARCHAR2(200),
  Cod_Producto NUMBER(38),
  CONSTRAINT PK_Contener PRIMARY KEY (CodProducto, Cod_Producto),
  CONSTRAINT Contener_FK_Producto FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
  CONSTRAINT Contener_FK_Fertilizantes_y_Agroquimicos FOREIGN KEY (Cod_Producto) REFERENCES Fertilizantes_y_Agroquimicos(Cod_Producto)
);
