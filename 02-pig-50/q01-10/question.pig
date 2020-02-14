-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;


--
-- >>> Escriba su respuesta a partir de este punto <<<
--
u = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);
s = GROUP u BY f1;
r5 = FOREACH s GENERATE group, COUNT(u.f1);
STORE r5 INTO 'output';