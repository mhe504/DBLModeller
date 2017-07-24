CREATE TABLE OTG_ACTIVIDADES ( 
  ACT_CODIGO        NUMBER        NOT NULL, 
  ACT_CON_CODIGO    NUMBER        NOT NULL, 
  ACT_CODIGOOTRI    VARCHAR2 (10), 
  ACT_NOMBRE        VARCHAR2 (200), 
  ACT_DESCRIPCION   VARCHAR2 (2000), 
  ACT_DESTINATARIO  VARCHAR2 (2000), 
  ACT_OBJETIVOS     VARCHAR2 (2000), 
  ACT_CONDICIONES   VARCHAR2 (2000), 
  ACT_FINANCIACION  VARCHAR2 (2000), 
  ACT_TIPOSOLI      VARCHAR2 (1), 
  ACT_MODALIDADES   VARCHAR2 (1), 
  LOG               NUMBER, 
  ACT_DEDICA        VARCHAR2 (1), 
  CONSTRAINT OTG_ACTIVIDADES_PK
  PRIMARY KEY ( ACT_CODIGO ) ) ; 
 

CREATE TABLE OTG_MODALIDADES ( 
  MOD_CODIGO        NUMBER        NOT NULL, 
  MOD_ACT_CODIGO    NUMBER        NOT NULL, 
  MOD_CODIGOOTRI    VARCHAR2 (10), 
  MOD_NOMBRE        VARCHAR2 (200), 
  MOD_DESCRIPCION   VARCHAR2 (2000), 
  MOD_DESTINATARIO  VARCHAR2 (2000), 
  MOD_OBJETIVOS     VARCHAR2 (2000), 
  MOD_FINANCIACION  VARCHAR2 (2000), 
  MOD_CONDICIONES   VARCHAR2 (2000), 
  LOG               NUMBER, 
  MOD_DEDICA        VARCHAR2 (1), 
  CONSTRAINT OTG_MODALIDADES_PK
  PRIMARY KEY ( MOD_CODIGO ) ) ; 
 

CREATE TABLE OTG_PCONVOCATORIAS ( 
  PCO_CODIGO      NUMBER        NOT NULL,  
  PCO_ACT_CODIGO  NUMBER, 
  PCO_MOD_CODIGO  NUMBER, 
  PCO_FINIS       DATE, 
  PCO_FFINS       DATE, 
  PCO_FFINA       DATE, 
  PCO_ANO         NUMBER, 
  PCO_FJUST       DATE, 
  CONSTRAINT OTG_PCONVOCATORIA_PK
  PRIMARY KEY ( PCO_CODIGO ) ) ; 
 

CREATE TABLE OTG_TCONVOCATORIAS ( 
  TCO_CON_CODIGO  NUMBER        NOT NULL, 
  TCO_TER_CODIGO  NUMBER        NOT NULL, 
  TCO_PTC_CODIGO  VARCHAR2 (3), 
  CONSTRAINT OTG_TCONVOCATORIAS_PK
  PRIMARY KEY ( TCO_CON_CODIGO, TCO_TER_CODIGO ) ) ; 
 

CREATE TABLE OTG_SOLICITUDES ( 
  SOL_CODIGO       NUMBER        NOT NULL, 
  SOL_CON_CODIGO   NUMBER, 
  SOL_ACT_CODIGO   NUMBER, 
  SOL_MOD_CODIGO   NUMBER, 
  SOL_PCO_CODIGO   NUMBER, 
  SOL_TITULO       VARCHAR2 (2000), 
  SOL_FENTREGA     DATE, 
  SOL_ESO_CODIGO   VARCHAR2 (2), 
  SOL_FRES         DATE, 
  SOL_FPUB         DATE, 
  SOL_DURACION     NUMBER, 
  SOL_UOR_CODIGO   NUMBER, 
  SOL_IMP          NUMBER, 
  SOL_MON_CODIGO   NUMBER, 
  SOL_IMPP         NUMBER, 
  SOL_IMPE         NUMBER, 
  SOL_APR_CODIGO   VARCHAR2 (3), 
  SOL_COORDINADO   VARCHAR2 (1), 
  SOL_SUP_CODIGO   NUMBER, 
  SOL_FANUAL       VARCHAR2 (1), 
  SOL_SOL_CODIGO   NUMBER, 
  SOL_PRO_CODIGO   NUMBER, 
  SOL_CTR_CODIGO   NUMBER, 
  SOL_MBE_CODIGO   NUMBER, 
  SOL_IMPS         NUMBER, 
  SOL_MON_CODIGOS  NUMBER, 
  SOL_IMPPS        NUMBER, 
  SOL_IMPES        NUMBER, 
  SOL_IMPU         NUMBER, 
  SOL_MON_CODIGOU  NUMBER, 
  SOL_IMPPU        NUMBER, 
  SOL_IMPEU        NUMBER, 
  SOL_TIPO         VARCHAR2 (1), 
  SOL_PER_IDT      NUMBER, 
  SOL_PER_IDB      NUMBER, 
  LOG              NUMBER, 
  CONSTRAINT OTG_SOLICITUDES_PK
  PRIMARY KEY ( SOL_CODIGO ) ) ; 
 

CREATE TABLE OTG_PTCONVOCATORIAS ( 
  PTC_CODIGO  VARCHAR2 (3)  NOT NULL, 
  PTC_NOMBRE  VARCHAR2 (50), 
  CONSTRAINT OTG_PTCONVOCATORIAS_PK
  PRIMARY KEY ( PTC_CODIGO ) ) ; 
 

CREATE TABLE OTG_CONVOCATORIAS ( 
  CON_CODIGO      NUMBER        NOT NULL, 
  CON_CODIGOOTRI  VARCHAR2 (10), 
  CON_NOMBRE      VARCHAR2 (2000), 
  CON_FPUB        DATE, 
  CON_FRES        DATE, 
  CON_FCOR1       DATE, 
  CON_FCOR2       DATE, 
  CON_ACCESO      VARCHAR2 (50), 
  CON_TIPO        VARCHAR2 (1), 
  CON_PUB_CODIGO  NUMBER, 
  LOG             NUMBER, 
  CON_INFOR       VARCHAR2 (500), 
  CON_DEDICA      VARCHAR2 (1), 
  CON_TIPOWEB     VARCHAR2 (1), 
  CON_WEB         VARCHAR2 (1), 
  CONSTRAINT OTG_CONVOCATORIAS_PK
  PRIMARY KEY ( CON_CODIGO ) ) ; 
 

CREATE TABLE OTG_PUBLICAOFI ( 
  PUB_CODIGO  NUMBER        NOT NULL, 
  PUB_NOMBRE  VARCHAR2 (200), 
  CONSTRAINT OTG_PUBLICAOFI_PK
  PRIMARY KEY ( PUB_CODIGO ) ) ; 
 

CREATE TABLE OTG_TERCEROS ( 
  TER_CODIGO  NUMBER        NOT NULL, 
  TER_NOMBRE  VARCHAR2 (200), 
  CONSTRAINT OTG_TERCEROS_PK
  PRIMARY KEY ( TER_CODIGO ) ) ; 
 


ALTER TABLE OTG_ACTIVIDADES ADD  CONSTRAINT ACTIVIDADES_CONVOCATORIAS_FK1
 FOREIGN KEY (ACT_CON_CODIGO) 
  REFERENCES OTG_CONVOCATORIAS (CON_CODIGO) ;
 

ALTER TABLE OTG_ACTIVIDADES ADD  CONSTRAINT UNIQ_ACT_CODIGOTRI
 UNIQUE (ACT_CODIGOOTRI) ;
 

COMMENT ON TABLE OTG_ACTIVIDADES IS 'Actividades (convocatorias)';
 

COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_CODIGO IS 'Código Interno (Secuencia S_ACT_CODIGO)';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_CODIGOOTRI IS 'Código O.T.R.I.';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_CON_CODIGO IS 'Código de la convocatoria (FK - OTG_CONVOCATORIAS)';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_CONDICIONES IS 'Condiciones';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_DEDICA IS 'Contabilidad horaria';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_DESCRIPCION IS 'Descripción';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_DESTINATARIO IS 'Destinatarios';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_FINANCIACION IS 'Financiación';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_MODALIDADES IS 'Actividad con modalidades (S, N)';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_NOMBRE IS 'Nombre';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_OBJETIVOS IS 'Objetivos';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.ACT_TIPOSOLI IS 'Tipo de solicitud (P : Proyecto, B : Beca, I : Infraestructura, V : Viaje)';
 
COMMENT ON COLUMN OTG_ACTIVIDADES.LOG IS 'Código LOG';
 
CREATE SEQUENCE S_ACT_CODIGO INCREMENT BY 1 START WITH 0 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
 






ALTER TABLE OTG_MODALIDADES ADD  CONSTRAINT MODALIDADES_ACTIVIDADES_FK1
 FOREIGN KEY (MOD_ACT_CODIGO) 
  REFERENCES OTG_ACTIVIDADES (ACT_CODIGO) ;
 
ALTER TABLE OTG_MODALIDADES ADD  CONSTRAINT UNIQ_MOD_CODIGOTRI
 UNIQUE (MOD_CODIGOOTRI) ;
 
COMMENT ON TABLE OTG_MODALIDADES IS 'Modalidades (Actividades de convocatorias)';
 

COMMENT ON COLUMN OTG_MODALIDADES.LOG IS 'Código Log';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_ACT_CODIGO IS 'Código de la Acitvidad (FK - OTG_ACTIVIDADES)';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_CODIGO IS 'Código Interno (Secuencia S_MOD_CODIGO)';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_CODIGOOTRI IS 'Código O.T.R.I.';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_CONDICIONES IS 'Condiciones';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_DEDICA IS 'Contabilidad horaria';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_DESCRIPCION IS 'Descripción';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_DESTINATARIO IS 'Destinatarios';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_FINANCIACION IS 'Financiación';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_NOMBRE IS 'Nombre';
 
COMMENT ON COLUMN OTG_MODALIDADES.MOD_OBJETIVOS IS 'Objetivos';
 
CREATE SEQUENCE S_MOD_CODIGO INCREMENT BY 1 START WITH 0 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
 



ALTER TABLE OTG_PCONVOCATORIAS ADD  CONSTRAINT PCONVOCATORIAS_ACTIVIDADES_FK1
 FOREIGN KEY (PCO_ACT_CODIGO) 
  REFERENCES OTG_ACTIVIDADES (ACT_CODIGO) ;
 

ALTER TABLE OTG_PCONVOCATORIAS ADD  CONSTRAINT PCONVOCATORIAS_MODALIDADES_FK1
 FOREIGN KEY (PCO_MOD_CODIGO) 
  REFERENCES OTG_MODALIDADES (MOD_CODIGO) ;
 

COMMENT ON TABLE OTG_PCONVOCATORIAS IS 'Plazos de las convocatorias';
 

COMMENT ON COLUMN OTG_PCONVOCATORIAS.PCO_ACT_CODIGO IS 'Código de la actividad (FK - OTG_ACTIVIDADES)';
 
COMMENT ON COLUMN OTG_PCONVOCATORIAS.PCO_ANO IS 'Año de la convocatoria';
 
COMMENT ON COLUMN OTG_PCONVOCATORIAS.PCO_CODIGO IS 'Código Interno (Secuencia S_PCO_CODIGO)';
 
COMMENT ON COLUMN OTG_PCONVOCATORIAS.PCO_FFINA IS 'Fecha fin de aceptación O.T.R.I.';
 
COMMENT ON COLUMN OTG_PCONVOCATORIAS.PCO_FFINS IS 'Fecha fin de solicitud';
 
COMMENT ON COLUMN OTG_PCONVOCATORIAS.PCO_FINIS IS 'Fecha inicio de solicitud';
 
COMMENT ON COLUMN OTG_PCONVOCATORIAS.PCO_FJUST IS 'Plazo de Justificación';
 
COMMENT ON COLUMN OTG_PCONVOCATORIAS.PCO_MOD_CODIGO IS 'Código de la Modalidad (FK -  OTG_MODALIDADES)';
 
CREATE SEQUENCE S_PCO_CODIGO INCREMENT BY 1 START WITH 0 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
 



ALTER TABLE OTG_TCONVOCATORIAS ADD  CONSTRAINT TCONVOCATOR_CONVOCATORIAS_FK1
 FOREIGN KEY (TCO_CON_CODIGO) 
  REFERENCES OTG_CONVOCATORIAS (CON_CODIGO) ;
 

ALTER TABLE OTG_TCONVOCATORIAS ADD  CONSTRAINT TCONVOCATOR_PTCONVOCATOR_FK3
 FOREIGN KEY (TCO_PTC_CODIGO) 
  REFERENCES OTG_PTCONVOCATORIAS (PTC_CODIGO) ;
 

ALTER TABLE OTG_TCONVOCATORIAS ADD  CONSTRAINT TCONVOCATOR_TERCEROS_FK2
 FOREIGN KEY (TCO_TER_CODIGO) 
  REFERENCES OTG_TERCEROS (TER_CODIGO) ;
 

COMMENT ON TABLE OTG_TCONVOCATORIAS IS 'Terceros (Convocatorias)';
 
COMMENT ON COLUMN OTG_TCONVOCATORIAS.TCO_CON_CODIGO IS 'Código de la convocatoria (FK - OTG_CONVOCATORIAS)';
 
COMMENT ON COLUMN OTG_TCONVOCATORIAS.TCO_PTC_CODIGO IS 'Código del tipo de participación (FK - OTG_PTCONVOCATORIAS)';
 
COMMENT ON COLUMN OTG_TCONVOCATORIAS.TCO_TER_CODIGO IS 'Código del tercero (FK - OTG_TERCEROS)';
 



COMMENT ON TABLE OTG_PTCONVOCATORIAS IS 'Modos de  participación (Terceros)';
 
COMMENT ON COLUMN OTG_PTCONVOCATORIAS.PTC_CODIGO IS 'Código Interno';
 
COMMENT ON COLUMN OTG_PTCONVOCATORIAS.PTC_NOMBRE IS 'Nombre';
 

ALTER TABLE OTG_SOLICITUDES ADD  CONSTRAINT SOLICITUDES_ACTIVIDADES_FK2
 FOREIGN KEY (SOL_ACT_CODIGO) 
  REFERENCES OTG_ACTIVIDADES (ACT_CODIGO) ;
 
ALTER TABLE OTG_SOLICITUDES ADD  CONSTRAINT SOLICITUDES_CONVOCATORIAS_FK1
 FOREIGN KEY (SOL_CON_CODIGO) 
  REFERENCES OTG_CONVOCATORIAS (CON_CODIGO) ;
 
ALTER TABLE OTG_SOLICITUDES ADD  CONSTRAINT SOLICITUDES_MODALIDADES_FK3
 FOREIGN KEY (SOL_MOD_CODIGO) 
  REFERENCES OTG_MODALIDADES (MOD_CODIGO) ;
 
ALTER TABLE OTG_SOLICITUDES ADD  CONSTRAINT SOLICITUDES_PCONVOCATOR_FK9
 FOREIGN KEY (SOL_PCO_CODIGO) 
  REFERENCES OTG_PCONVOCATORIAS (PCO_CODIGO) ;
 
ALTER TABLE OTG_SOLICITUDES ADD  CONSTRAINT SOLICITUDES_SOLICITUDES_FK6
 FOREIGN KEY (SOL_SOL_CODIGO) 
  REFERENCES OTG_SOLICITUDES (SOL_CODIGO) ;
 
COMMENT ON TABLE OTG_SOLICITUDES IS 'Solicitudes de convocatorias nacionales';
 
COMMENT ON COLUMN OTG_SOLICITUDES.LOG IS 'Código Log';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_ACT_CODIGO IS 'Código de la actividad (FK - OTG_ACTIVIDADES)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_APR_CODIGO IS 'Código del área productiva (FK - OTG_APRODUCTIVAS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_CODIGO IS 'Código Interno (Secuencia S_SOL_CODIGO)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_CON_CODIGO IS 'Código de la convocatoria (FK - OTG_CONVOCATORIAS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_COORDINADO IS 'Coordinado (S, N)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_CTR_CODIGO IS 'Código del contrato asociado.- Becas (FK - OTG_CONTRATOS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_DURACION IS 'Duración en meses';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_ESO_CODIGO IS 'Código del estado de la solicitud (FK - OTG_ESOLICITUDES)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_FANUAL IS 'Fechas por anualidades (S, N)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_FENTREGA IS 'Fecha de entrega';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_FPUB IS 'Fecha de publicación (Solicitudes aprobadas)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_FRES IS 'Fecha de resolución (Solicitudes Aprobadas)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_IMP IS 'Importe solicitado';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_IMPE IS 'Importe en euros';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_IMPES IS 'Importe en euros de subvención .- Infraestructuras';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_IMPEU IS 'Importe en euros de U.H.M. .- Infraestructuras';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_IMPP IS 'Importe en pesetas';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_IMPPS IS 'Importe en pesetas de subvención .- Infraestructuras';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_IMPPU IS 'Importe en pesetas de U.H.M. .- Infraestructuras';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_IMPS IS 'Importe subvención.- Infraestructuras';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_IMPU IS 'Importe U.M.H. .- Infraestructuras';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_MBE_CODIGO IS 'Código de la Modalidad de la Beca (FK - OTG_MBECAS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_MOD_CODIGO IS 'Código de la modalidad (FK - OTG_MODALIDADES)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_MON_CODIGO IS 'Código de moneda (FK - OTG_MONEDAS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_MON_CODIGOS IS 'Código de moneda subvención .- Infraestructuras (FK - OTG_MONEDAS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_MON_CODIGOU IS 'Código de moneda U.M.H. - Infraestructuras (FK - OTG_MONEDAS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_PCO_CODIGO IS 'Código del plazo de convocatoria (FK - OTG_PCONVOCATORIAS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_PER_IDB IS 'Identificador del Becario .- Becas (FK - OTG_PERSONAS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_PER_IDT IS 'Identificador del tutor .- Becas (FK - OTG_PERSONAS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_PRO_CODIGO IS 'Código del proyecto asociado.- Becas (FK - OTG_PROYECTOS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_SOL_CODIGO IS 'Código del proyecto solicitado asociado.- Becas (FK - OTG_SOLICITUDES)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_SUP_CODIGO IS 'Código del Macro-proyecto (FK - OTG_SUPERPROYECTOS)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_TIPO IS 'Tipo de solicitud (P: Proyecto, B: Beca, V: Viaje, I: Infraestructura)';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_TITULO IS 'Título';
 
COMMENT ON COLUMN OTG_SOLICITUDES.SOL_UOR_CODIGO IS 'Código de la Unidad Organizativa solicitante (FK - GEA_UORGANIZATIVA)';
 
CREATE SEQUENCE S_SOL_CODIGO INCREMENT BY 1 START WITH 0 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
 




ALTER TABLE OTG_CONVOCATORIAS ADD  CONSTRAINT CONVOCATORIAS_PUBLICAOFI_FK1
 FOREIGN KEY (CON_PUB_CODIGO) 
  REFERENCES OTG_PUBLICAOFI (PUB_CODIGO) ;
 
ALTER TABLE OTG_CONVOCATORIAS ADD  CONSTRAINT UNIQ_CON_CODIGOTRI
 UNIQUE (CON_CODIGOOTRI) ;
 

COMMENT ON TABLE OTG_CONVOCATORIAS IS 'Convocatorias Nacionales';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_ACCESO IS 'Lugar donde se encuentra accesible la documentación';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_CODIGO IS 'Código Interno (Secuencia S_CON_CODIGO)';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_CODIGOOTRI IS 'Código O.T.R.I.';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_DEDICA IS 'Obsoleto';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_FCOR1 IS 'Fecha de 1º corrección';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_FCOR2 IS 'Fecha de 2º corrección';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_FPUB IS 'Fecha de publicación';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_FRES IS 'Fecha de resolución';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_INFOR IS 'Localización de información';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_NOMBRE IS 'Nombre';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_PUB_CODIGO IS 'Código de la Publicación Oficial (FK - OTG_PUBLICAOFI)';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.CON_TIPO IS 'Tipo de Convocatoria (R: Regional, N: Nacional)';
 
COMMENT ON COLUMN OTG_CONVOCATORIAS.LOG IS 'Código Log';
 
CREATE SEQUENCE S_CON_CODIGO INCREMENT BY 1 START WITH 0 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
 


COMMENT ON TABLE OTG_PUBLICAOFI IS 'Publicaciones Oficiales';
 
COMMENT ON COLUMN OTG_PUBLICAOFI.PUB_CODIGO IS 'Código Intero (Secuencia S_PUB_CODIGO)';
 
COMMENT ON COLUMN OTG_PUBLICAOFI.PUB_NOMBRE IS 'Nombre';
 
CREATE SEQUENCE S_PUB_CODIGO INCREMENT BY 1 START WITH 0 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
 




COMMENT ON TABLE OTG_TERCEROS IS 'Personas (Terceros)';
 
COMMENT ON COLUMN OTG_TERCEROS.TER_CODIGO IS 'Código Interno (Secuencia S_TER_CODIGO)';
 
COMMENT ON COLUMN OTG_TERCEROS.TER_NOMBRE IS 'Nombre';
 
CREATE SEQUENCE S_TER_CODIGO INCREMENT BY 1 START WITH 0 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
 



ALTER TABLE OTG_ACTIVIDADES ENABLE CONSTRAINT ACTIVIDADES_CONVOCATORIAS_FK1;
 
ALTER TABLE OTG_MODALIDADES ENABLE CONSTRAINT MODALIDADES_ACTIVIDADES_FK1;
 
ALTER TABLE OTG_PCONVOCATORIAS ENABLE CONSTRAINT PCONVOCATORIAS_ACTIVIDADES_FK1;
 
ALTER TABLE OTG_PCONVOCATORIAS ENABLE CONSTRAINT PCONVOCATORIAS_MODALIDADES_FK1;
 
ALTER TABLE OTG_TCONVOCATORIAS ENABLE CONSTRAINT TCONVOCATOR_CONVOCATORIAS_FK1;
 
ALTER TABLE OTG_TCONVOCATORIAS ENABLE CONSTRAINT TCONVOCATOR_PTCONVOCATOR_FK3;
 
ALTER TABLE OTG_TCONVOCATORIAS ENABLE CONSTRAINT TCONVOCATOR_TERCEROS_FK2;
 
ALTER TABLE OTG_SOLICITUDES ENABLE CONSTRAINT SOLICITUDES_ACTIVIDADES_FK2;
 
ALTER TABLE OTG_SOLICITUDES ENABLE CONSTRAINT SOLICITUDES_CONVOCATORIAS_FK1;
 
ALTER TABLE OTG_SOLICITUDES ENABLE CONSTRAINT SOLICITUDES_MODALIDADES_FK3;
 
ALTER TABLE OTG_SOLICITUDES ENABLE CONSTRAINT SOLICITUDES_PCONVOCATOR_FK9;
 
ALTER TABLE OTG_SOLICITUDES ENABLE CONSTRAINT SOLICITUDES_SOLICITUDES_FK6;
 
ALTER TABLE OTG_CONVOCATORIAS ENABLE CONSTRAINT CONVOCATORIAS_PUBLICAOFI_FK1;
 
