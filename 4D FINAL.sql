create index Entidad_reguladora_idx on Entidad_reguladora(codEntidad);

create index Gestor_responsable_idx on Gestor_responsable(NIF,Correo_electronico);

create index Granja_idx on Granja(NIF_titular,GPS);

create index Fabrica_idx on Fabrica(NIF_empresa,GPS,Telefono_urgencias);

create index Destinatario_idx on Destinatario(NIF,Correo_electronico);

create index Empresa_logistica_idx on Empresa_logistica(NIF,NIF_responsable);

create index Envases_idx on Envases(CodEnvase,NIF_fabricante);

create index Alerta_idx on Alerta(CodAlerta,Tipo);

create index Fertilizantes_y_Agroquimicos_idx on Fertilizantes_y_Agroquimicos(Cod_Producto,Denominacion);

create index Productos_Veterinarios_y_Vacunas_idx on Productos_Veterinarios_y_Vacunas(Cod_Medicamento,Cod_Fabricante);

create index Productor_idx on Productor(NIF,Denominación);

create index Producto_idx on Producto(CodProducto,CodAlerta1,NIF);

create index Aceite_de_oliva_idx on Aceite_de_oliva(CodProducto,Acidez);

create index Vino_idx on Vino(CodProducto,Tipo);
 
create index Lacteos_idx on Lacteos(CodProducto,Tipo);