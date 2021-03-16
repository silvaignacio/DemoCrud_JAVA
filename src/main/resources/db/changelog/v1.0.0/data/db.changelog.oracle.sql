--liquibase formatted sql

--changeset seiza-devs:1603585554153-7
INSERT INTO FR_TIPO_CAMPO (ID, CODIGO, DESCRIPCION, CONFIG) VALUES (1, 'TEXT', 'Texto', '{}');
INSERT INTO FR_TIPO_CAMPO (ID, CODIGO, DESCRIPCION, CONFIG) VALUES (2, 'SELECT', 'Lista de valores', NULL);
INSERT INTO FR_TIPO_CAMPO (ID, CODIGO, DESCRIPCION, CONFIG) VALUES (3, 'DATE', 'Fecha', NULL);
INSERT INTO FR_TIPO_CAMPO (ID, CODIGO, DESCRIPCION, CONFIG) VALUES (4, 'DATE-RANGE', 'Rango de fechas', NULL);

--changeset seiza-devs:vvr-tipo-sla-1
INSERT INTO TP_TIPO_SLA (ID, CODIGO, DESCRIPCION, CONFIG) VALUES (1, 'HORA_CORTE', 'Sla con hora corte', '{"HORA_CORTE":"14:00:00"}');
INSERT INTO TP_TIPO_SLA (ID, CODIGO, DESCRIPCION, CONFIG) VALUES (2, 'COMUN', 'Sla comun', null);

--changeset seiza-devs:1603585554153-8
INSERT INTO SOL_ESTADO (ID, NOMBRE) VALUES (1, 'CREADA');
INSERT INTO SOL_ESTADO (ID, NOMBRE) VALUES (2, 'AUTORIZADA');

--changeset seiza-devs:vvr-jerarquia-01
INSERT INTO TP_AREA_NEGOCIO (ID, NOMBRE) VALUES (1, 'Liquidacion Ambulatoria');
INSERT INTO TP_AREA_NEGOCIO (ID, NOMBRE) VALUES (2, 'Testing de tipologias');

INSERT INTO TP_TIPO (ID, NOMBRE, ID_AREA_NEGOCIO) VALUES (1, 'Bono Ges', 1);
INSERT INTO TP_TIPO (ID, NOMBRE, ID_AREA_NEGOCIO) VALUES (2, 'ReembolsoWeb/App', 1);
INSERT INTO TP_TIPO (ID, NOMBRE, ID_AREA_NEGOCIO) VALUES (3, 'Bonos Plan', 1);
INSERT INTO TP_TIPO (ID, NOMBRE, ID_AREA_NEGOCIO) VALUES (4, 'Bonos Ges', 2);

INSERT INTO TP_SUB_TIPO (ID, NOMBRE, ID_TIPO) VALUES (1, 'Examen, procedimiento, imagenologia y otros', 1);
INSERT INTO TP_SUB_TIPO (ID, NOMBRE, ID_TIPO) VALUES (2, 'Consulta BHE, Examenes, Urgencias, Otras Consultas', 2);
INSERT INTO TP_SUB_TIPO (ID, NOMBRE, ID_TIPO) VALUES (3, 'Examen, procedimiento, imagenologia y Kinesiologia', 3);
INSERT INTO TP_SUB_TIPO (ID, NOMBRE, ID_TIPO) VALUES (4, 'Examen, procedimiento, imagenologia y otros', 4);


INSERT INTO FR_FORM (ID, USUARIO_CREACION, DESCRIPCION)
VALUES (1, 'VVERA', 'Bono Examen Ges');

INSERT INTO FR_FORM_CAMPO (ID, ID_TIPO_CAMPO, LABEL, ID_FORM, VIEW_CONFIG, MODEL_CONFIG, ORDEN, CODIGO)
VALUES (1, 1, 'Tipo Prestacion', 1, '{}', '{"mandatorio-create":true}', 1, 'tipoPrestacion');


--changeset seiza-devs:vvr-liquidacion-reembolso-data-01

INSERT INTO FR_FORM (ID, USUARIO_CREACION, DESCRIPCION)
VALUES (2, 'VVERA', 'Reembolso');

INSERT INTO FR_FORM_CAMPO (ID, ID_TIPO_CAMPO, LABEL, ID_FORM, VIEW_CONFIG, MODEL_CONFIG, ORDEN, CODIGO)
VALUES (2, 1, 'Tipo Prestación', 2, '{"rowSpan":1}', '{"validations": {"mandatory": true, "createMandatory": true}, "config": {"readOnly": true}}', 1, 'TIPO-PRESTACION');

INSERT INTO FR_FORM_CAMPO (ID, ID_TIPO_CAMPO, LABEL, ID_FORM, VIEW_CONFIG, MODEL_CONFIG, ORDEN, CODIGO)
VALUES (3, 2, 'Tipo Solicitante', 2, '{"rowSpan":2}',
        '{"validations": {"mandatory": true}, "config": {"origin": "catalogo/tipo-solicitante"}}', 2, 'TIPO-SOLICITANTE');

INSERT INTO FR_FORM_CAMPO (ID, ID_TIPO_CAMPO, LABEL, ID_FORM, VIEW_CONFIG, MODEL_CONFIG, ORDEN, CODIGO)
VALUES (4, 2, 'Tipo de Antecedente', 2, '{"rowSpan":1}',
        '{"validations": {"mandatory": true}, "config": {"origin": "catalogo/tipo-antecedente"}}', 3, 'TIPO-ANTECEDENTE');


--changeset seiza-devs:vvr-bonos-plan-01

INSERT INTO FR_FORM (ID, USUARIO_CREACION, DESCRIPCION)
VALUES (3, 'VVERA', 'Bono examen plan');

INSERT INTO FR_FORM_CAMPO (ID, ID_TIPO_CAMPO, LABEL, ID_FORM, VIEW_CONFIG, MODEL_CONFIG, ORDEN, CODIGO) VALUES (5, 1, 'Tipo Prestacion', 3, '{}', '{"mandatorio-create":true}', 1, 'tipoPrestacion');


--changeset seiza-devs:vvr-tipologias-01
INSERT INTO TP_TIPOLOGIA (ID, ACTIVA, SLA, ID_FORM, DESCRIPCION, CODIGO, ID_SUB_TIPO, CREADOR, ID_TIPO_SLA)
VALUES (1, 1, 1, 1,'Autoriza e indentifica las prestaciones de acuerdo a la orden medica', 'BONO-EXAMEN-GES', 1, 'vvera', 2);

INSERT INTO TP_TIPOLOGIA (ID, ACTIVA, SLA, ID_FORM, DESCRIPCION, CODIGO, ID_SUB_TIPO, CREADOR, ID_TIPO_SLA)
VALUES (2, 1, 2, 2,'Autoriza e indentifica las prestaciones de una boleta para reembolsar', 'REEMBOLSO', 2, 'vvera', 1);

INSERT INTO TP_TIPOLOGIA (ID, ACTIVA, SLA, ID_FORM, DESCRIPCION, CODIGO, ID_SUB_TIPO, CREADOR, ID_TIPO_SLA)
VALUES (3, 1, 1, 3,'Autoriza las prestaciones de acuerdo a la orden medica indicadas por el beneficiario', 'BONO-EXAMEN-PLAN', 3, 'vvera', 2);

INSERT INTO TP_TIPOLOGIA (ID, ACTIVA, SLA, ID_FORM, DESCRIPCION, CODIGO, ID_SUB_TIPO, CREADOR, ID_TIPO_SLA)
VALUES (4, 1, 3, 1,'Tipologia para pruebas con asignacion', 'BONO-EXAMEN-GES-A', 4, 'vvera', 2);

INSERT INTO TP_TIPOLOGIA (ID, ACTIVA, SLA, ID_FORM, DESCRIPCION, CODIGO, ID_SUB_TIPO, CREADOR, ID_TIPO_SLA)
VALUES (5, 1, 2, 1,'Tipologia para pruebas SLA vencido', 'BONO-EXAMEN-GES-SLA', 4, 'vvera', 2);

INSERT INTO TP_TIPOLOGIA (ID, ACTIVA, SLA, ID_FORM, DESCRIPCION, CODIGO, ID_SUB_TIPO, CREADOR, ID_TIPO_SLA)
VALUES (6, 1, 1, 1,'Tipologia para pruebas SLA por vencer', 'BONO-EXAMEN-GES-PV', 4, 'vvera', 2);

INSERT INTO TP_TIPOLOGIA (ID, ACTIVA, SLA, ID_FORM, DESCRIPCION, CODIGO, ID_SUB_TIPO, CREADOR, ID_TIPO_SLA)
VALUES (7, 1, 1, 1,'Tipologia para pruebas SLA 0', 'BONO-EXAMEN-GES-SLA-0', 4, 'vvera', 2);

INSERT INTO AS_GRUPO_RESOLUTOR (ID, CODIGO, DESCRIPCION, ID_TIPO_ASIGNACION, SUPERVISOR, ID_TIPOLOGIA) VALUES (1, 'BONO-GES', 'Grupo bono ges', 1, 'rpenailillo', 1);
INSERT INTO AS_GRUPO_RESOLUTOR (ID, CODIGO, DESCRIPCION, ID_TIPO_ASIGNACION, SUPERVISOR, ID_TIPOLOGIA) VALUES (3, 'REEMBOLSOS-MANUAL', 'Reembolsos manual', 1, 'rpenailillo', 2);
INSERT INTO AS_GRUPO_RESOLUTOR (ID, CODIGO, DESCRIPCION, ID_TIPO_ASIGNACION, SUPERVISOR, ID_TIPOLOGIA) VALUES (2, 'BONO-PLAN', 'Grupo bono plan', 1, 'rpenailillo', 3);
INSERT INTO AS_GRUPO_RESOLUTOR (ID, CODIGO, DESCRIPCION, ID_TIPO_ASIGNACION, SUPERVISOR, ID_TIPOLOGIA) VALUES (4, 'BONO-EXAMEN-GES-A', 'Grupo prueba', 1, 'rpenailillo', 4);
INSERT INTO AS_GRUPO_RESOLUTOR (ID, CODIGO, DESCRIPCION, ID_TIPO_ASIGNACION, SUPERVISOR, ID_TIPOLOGIA) VALUES (5, 'BONO-EXAMEN-GES-SLA', 'Grupo prueba', 1, 'rpenailillo', 5);
INSERT INTO AS_GRUPO_RESOLUTOR (ID, CODIGO, DESCRIPCION, ID_TIPO_ASIGNACION, SUPERVISOR, ID_TIPOLOGIA) VALUES (6, 'BONO-EXAMEN-GES-PV', 'Grupo prueba', 1, 'rpenailillo', 6);
INSERT INTO AS_GRUPO_RESOLUTOR (ID, CODIGO, DESCRIPCION, ID_TIPO_ASIGNACION, SUPERVISOR, ID_TIPOLOGIA) VALUES (7, 'BONO-EXAMEN-GES-SLA-0', 'Grupo prueba', 1, 'rpenailillo', 7);

--changeset seiza-devs:vvr-resolutor-1
INSERT INTO AS_RESOLUTOR (ID, USUARIO, RUT) VALUES (1, 'rpenailillo','12776362');
INSERT INTO AS_RESOLUTOR (ID, USUARIO, RUT) VALUES (2, 'mvillagra','13550624');

INSERT INTO AS_RESOLUTOR_GRUPO(ID, ID_RESOLUTOR, ID_GRUPO_RESOLUTOR) VALUES (1, 2, 1);

INSERT INTO EM_TIPO_CAMPANA(ID, ID_TIPOLOGIA, NOMBRE, DESCRIPCION, ORDEN, ACTIVO, CREADOR, ISAP_CEMPRESA, ACCION) VALUES (1, 1, 'Rechazo', 'Descripcion', 1, 1, 'isilva', 'B', 'RECHAZAR');
INSERT INTO EM_CAMPANA(ID, ID_TIPO_CAMPANA, NOMBRE, HTML, ID_FIDELIZADOR, ISAP_CEMPRESA) VALUES (1, 1, 'Rechazo TEST', '<!DOCTYPE html>
<html>
<body>

<p>My favorite color is <del>blue</del> <ins>red</ins>.</p>

</body>
</html>
', '1_TEST_EMAIL', 'B');

INSERT INTO EM_CAMPANA(ID, ID_TIPO_CAMPANA, NOMBRE, HTML, ID_FIDELIZADOR, ISAP_CEMPRESA) VALUES (2, 1, 'Rechazo TEST 2', '<!DOCTYPE html>
<html>
<body>

<p>My favorite color is <del>blue</del> <ins>red</ins>.</p>

</body>
</html>
', '2_TEST_EMAIL', 'B');
INSERT INTO EM_CAMPANA_MOTIVO(ID, ID_CAMPANA, NOMBRE, RESUMEN, ESTADO, ISAP_CEMPRESA) VALUES (1, 1, 'Faltan documentos', 'Debes adjuntar documentos faltantes','ACTIVO', 'B');
INSERT INTO EM_CAMPANA_MOTIVO(ID, ID_CAMPANA, NOMBRE, RESUMEN, ESTADO, ISAP_CEMPRESA) VALUES (2, 1, 'Consulta médica no está dentro de la cobertura', 'Tu plan no cubre este tipo de consulta','ACTIVO', 'B');

INSERT INTO EM_CAMPANA_MOTIVO(ID, ID_CAMPANA, NOMBRE, RESUMEN, ESTADO, ISAP_CEMPRESA) VALUES (3, 2, 'Boleta presentada no es legible', 'Boleta presentada no es legible','ACTIVO', 'B');
INSERT INTO EM_CAMPANA_MOTIVO(ID, ID_CAMPANA, NOMBRE, RESUMEN, ESTADO, ISAP_CEMPRESA) VALUES (4, 2, 'Consulta médica excede el monto minimo de cobertura', 'Consulta médica excede el monto minimo de cobertura','ACTIVO', 'B');