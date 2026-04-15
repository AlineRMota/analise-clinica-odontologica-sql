-- 1. Faturamento total
SELECT SUM(valor) AS faturamento_total FROM consultas;

-- 2. Faturamento por mês
SELECT 
    TO_CHAR(data_consulta, 'YYYY-MM') AS mes,
    SUM(valor) AS faturamento
FROM consultas
GROUP BY TO_CHAR(data_consulta, 'YYYY-MM')
ORDER BY mes;

-- 3. Procedimento mais realizado
SELECT 
    procedimento,
    COUNT(*) AS total
FROM consultas
GROUP BY procedimento
ORDER BY total DESC;

-- 4. Taxa de inadimplência
SELECT 
    status,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentual
FROM pagamentos
GROUP BY status;

-- 5. Ticket médio por paciente
SELECT 
    p.nome,
    ROUND(AVG(c.valor), 2) AS ticket_medio
FROM pacientes p
JOIN consultas c ON p.id_paciente = c.id_paciente
GROUP BY p.nome
ORDER BY ticket_medio DESC;