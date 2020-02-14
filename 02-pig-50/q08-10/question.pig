-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD './data.tsv' USING PigStorage('\t') AS 
(f1:CHARARRAY,
f2:BAG{t:TUPLE(p:CHARARRAY)},
f3:MAP[]);
words = FOREACH lines GENERATE FLATTEN(f2) as word1, FLATTEN(f3) as word2;
des = FOREACH words GENERATE word1,word2;
gar = FOREACH des GENERATE  CONCAT ('(',word1,',', word2,')') as pal;
grouped = GROUP gar BY pal;
wordcount = FOREACH grouped GENERATE group, COUNT(gar);

STORE wordcount INTO 'output'using PigStorage('\t');