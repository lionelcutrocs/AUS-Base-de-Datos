-- consulta inicial (select)

-- select nombre, id, tipo
-- from planetas
-- order by id asc

-- consulta probando uso where, limit y alias sin 'as' y de manera implicita

-- select nombre "planetas", tipo
-- from planetas
-- where tipo = "rocoso"
-- order by tipo, nombre desc
-- limit 2

-- consulta probando uso where y operadores

-- select nombre "planetas", tipo
-- from planetas
-- where tipo = "rocoso" and id < 4

-- consulta probando uso like

-- select nombre "planetas", tipo
-- from planetas
-- where tipo like "%oso"			-- solo traera los terminados en oso literalmente

