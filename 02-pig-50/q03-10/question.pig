-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lin = LOAD './data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);

y = FOREACH lin GENERATE  f3;
x = ORDER y BY f3 ASC ;
z = LIMIT x 5;
STORE z INTO 'output';