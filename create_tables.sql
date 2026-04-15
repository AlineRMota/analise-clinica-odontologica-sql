CREATE TABLE pacientes (
    id_paciente NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    idade NUMBER,
    cidade VARCHAR2(100)
);

CREATE TABLE consultas (
    id_consulta NUMBER PRIMARY KEY,
    id_paciente NUMBER,
    data_consulta DATE,
    procedimento VARCHAR2(100),
    valor NUMBER(10,2),
    CONSTRAINT fk_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES pacientes(id_paciente)
);

CREATE TABLE pagamentos (
    id_pagamento NUMBER PRIMARY KEY,
    id_consulta NUMBER,
    metodo_pagamento VARCHAR2(50),
    status VARCHAR2(20),
    CONSTRAINT fk_consulta
        FOREIGN KEY (id_consulta)
        REFERENCES consultas(id_consulta)
);