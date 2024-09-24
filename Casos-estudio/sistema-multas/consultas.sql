-- a) listado de vehiculos actualmente en el corralon, ordenados por fecha
-- de ingreso y cantidad de multas impagas

--  select c.id_aucorr, c.id_auto, c.ingreso, count(am.estado) as multa_pendiente
--  from corralon c
--  left join auto_multa am on am.id_auto = c.id_auto
--  and am.estado = 'pendiente'
--  group by c.id_auto, c.id_auto, c.ingreso 
--  order by c.ingreso asc

-- b) listado de todas las multas que se realizaron en la calle pellegrini
-- entre las alturas 100 a 300

-- select m.id_multa, m.id_auto
-- from auto_multa m
-- left join ubicacion u on u.`id-ubi` = m.id_ubi 
-- where u.calle = 'pellegrini'
-- and u.altura between 100 and 300

-- c) el nombre y apellido de aquellos conductores que hayan tenido que
-- retirar mas de una vez el auto del corralon (te da el id, pero falta agregar nombre apellido)

-- select c.id_auto, count(c.id_aucorr) as cantidad_retiros
-- from corralon c
-- group by c.id_auto
-- having count(c.id_aucorr) > 1;

-- d) los tipos de infracciones de los que no se hayan registrado ninguna multa

-- select dd.descripcion
-- from `detalle.deuda` dd 
-- left join auto_multa am on dd.id_razon = am.id_razon 
-- where am.id_razon is null 