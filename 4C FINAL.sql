--Entidad Reguladora:
insert into Entidad_reguladora values('C-01');
insert into Entidad_reguladora values('C-02');
insert into Entidad_reguladora values('C-03');
insert into Entidad_reguladora values('C-04');
insert into Entidad_reguladora values('C-05');

--Gestor_responsable:
insert into Gestor_responsable values('49314540D','Marta','Martinez','16/November/2004','07/January/2022','ADE','marmar@gmail.com','+34 600235003');
insert into Gestor_responsable values('07382927G','Pedro','Rodriguez','19/February/2002','10/October/2023','Ingeniería Informática','pedrop@gmail.com','+34 639354099');
insert into Gestor_responsable values('42357321S','Lucas','Fernandez','16/November/2002','20/January/2022','Relaciones Públicas','lucasr@gmail.com','+34 615702134');
insert into Gestor_responsable values('50381937X','Alba','Galera','20/November/2001','30/February/2022','Economía','alba13@gmail.com','+34 717678391');
insert into Gestor_responsable values('79302716C','Carmen','Moreno','09/February/2004','14/January/2020','ADE','carmenmor@gmail.com','+34 649202737');

--Granja:
insert into Granja values('49274927DL','73°32,09',7,'La Paz');
insert into Granja values('97436283W','93°11,53',3,'Serrano');
insert into Granja values('47183838R','85°83,21',2,'Álcala');
insert into Granja values('71934791G','92°09,41',6,'Goya');

--Fabrica:
insert into Fabrica values('75367864C','03°32,45','Ferraz',72,'+34 9742846832','fab1@gmail.com','F-01','23/January/2024',1,10,1000);
insert into Fabrica values('84979327T','45°12,02','Mayor',34,'+34 753654432','fab2@gmail.com','F-02','12/November/2029',2,20,2000);
insert into Fabrica values('98928028K','01°00,64','Velázquez',09,'+34 974636363','fab3@gmail.com','F-03','07/February/2023',3,30,3000);
insert into Fabrica values('84081011M','76°63,53','Sol',12,'+34 153728323','fab4@gmail.com','F-04','31/May/2026',4,40,4000);

--Quimicos:
insert into Quimicos values('Q-01', 1,'31/May/2026');
insert into Quimicos values('Q-03', 100,'3/May/2026');
insert into Quimicos values('Q-02', 5638,'1/May/2026');
insert into Quimicos values('Q-04', 8677,'31/March/2026');

-- Destinatario:
insert into Destinatario values('77492743H','Sol',5,'www.dest1','dest1@gmail.com', '+34 759362849','+34 038372853');
insert into Destinatario values('86476864J', 'Velazquez',24,'www.dest2','dest2@gmail.com', '+34 245719384','+34 648738343');
insert into Destinatario values('64368543G', 'Goya',9,'www.dest3','dest3@gmail.com', '+34 948563234','+34 123495847');
insert into Destinatario values('09643646A','Serrano',14,'www.dest4','dest4@gmail.com', '+34 674837626','+34 274837483');

--Empresa_logistica:
insert into Empresa_logistica values('64257534G','EMPRESA1','Alberto Alcorer',9,'EM-01','EM-001','12/November/2029', '87364523E');
insert into Empresa_logistica values('93746524N','EMPRESA2','Pirineos',43,'EM-02','EM-002','5/November/2032', '63820495S');
insert into Empresa_logistica values('64324543F','EMPRESA3','Almansa',6,'EM-03','EM-003','12/May/2029', '17382938H');
insert into Empresa_logistica values('88564745K','EMPRESA4','Gasca',83,'EM-04','EM-004','12/January/2029', '05838472Y');

--Envases:
insert into Envases values(01,'75836253F',0.1,0.0,'Plástico');
insert into Envases values(02,'64643707P',0.2,0.01,'Vidrio');
insert into Envases values(03,'64222432N',0.3,0.03,'Papel');
insert into Envases values(04,'96535646U',0.4,0.04,'Vidrio');

--Alerta:
insert into Alertas values('AL-00001','A', '1/May/2023','PR-001','PRD-0092','14/May/2023','14/September/2023','IN-0002');
insert into Alertas values('AL-00002','B', '4/March/2023','PR-002','PRD-0093', '24/March/2023', '24/February/2023','IN-0003');
insert into Alertas values('AL-00003','F', '19/June/2023','PR-003','PRD-0094','15/June/2023','15/March/2023','IN-0004');
insert into Alertas values('AL-00004','E', '13/July/2023','PR-004','PRD-0095','30/August/2023','30/May/2023','IN-0005');

--Fertilizantes_y_Agroquimicos:
insert into Fertilizantes_y_Agroquimicos values(01,'Den1','Fab1',1,5,100,'75836253F');
insert into Fertilizantes_y_Agroquimicos values(02,'Den2','Fab2',2,10,200,'74832571H');
insert into Fertilizantes_y_Agroquimicos values(03,'Den3','Fab3',3,15,300'09362812J');
insert into Fertilizantes_y_Agroquimicos values(04,'Den4','Fab4',4,20,400,'94726354T');


--Productos_Veterinarios_y_Vacunas:
insert into Productos_Veterinarios_y_Vacunas values('M-01','F-01','09/October/2027','01/December/2023','73829473H');
insert into Productos_Veterinarios_y_Vacunas values('M-02','F-02','03/December/2030','04/October/2022','74873949G');
insert into Productos_Veterinarios_y_Vacunas values('M-03','F-03','26/February/2024','12/May/2020','98592830L');
insert into Productos_Veterinarios_y_Vacunas values('M-04','F-04','19/July/2026','23/July/2021','20325953M');

--Productor:
insert into Productor values('49314540D','D1',1,'Calle1','www.web1','a@gmail.com','SL','+34 674342165','+34 867464671', 10,100,1000,'R-01','09/October/2020','29/December/2027');
insert into Productor values('07382927G','D2',2,'Calle2','www.web2','b@gmail.com','SA','+34 726384938','+34 698385988', 20,200,2000,'R-02','23/February/2021','09/June/2028');
insert into Productor values('42357321S','D3',3,'Calle3','www.web3','c@gmail.com','SA','+34 239484756','+34 781274893', 30,300,3000,'R-03','30/May/2019','04/September/2027');
insert into Productor values('50381937X','D4',4,'Calle4','www.web4','d@gmail.com','Autonomo','+34 645257432','+34 589391892', 40,400,4000,'R-04','04/November/2020','29/May/2024');
--Empresa:
insert into Empresa values('49314540D');
insert into Empresa values('07382927G');
insert into Empresa values('42357321S');


--Autonomo:
insert into Autonomo values('50381937X');

--Producto:
insert into Producto values('P-01','R-01','09/October/2027','Nom1','Des1','E1','AL-00001','49314540D');
insert into Producto values('P-02','R-02','31/November/2026','Nom2','Des2','E2','AL-00002','07382927G');
insert into Producto values('P-03','R-03','22/May/2025','Nom3','Des3','E3','AL-00003','42357321S');
insert into Producto values('P-04','R-04','05/March/2027','Nom4','Des4','E4','AL-00004','50381937X');

--Aceite_de_oliva:
insert into Aceite_de_oliva values(0.01,'53°09,09',1,7,28,'S1','P-01');
insert into Aceite_de_oliva values(0.02,'21°11,65',2,12,58,'S2','P-02');


--Vino:
insert into Vino values(0.01,'Tinto','73°32,09',1,7,28,'C1','P-03');


--Lacteos:
insert into Lacteos values('10º','31/September/2020', 'Leche','T-01','P-04');
