-- a) listado de todos los pacientes a los que les realizo alguna radiografia de cadera 
-- tec radiologo (radiologo este caso) "manuel baristo, mat 4666"

-- select p.id_pacientes, p.nombre, p.apellido
-- from pacientes p
-- join turnos t on p.id_pacientes = t.id_pacientes 
-- join practica_realizada pr on t.id_prac_real = pr.id_prac_real 
-- join profesionales prof on t.id_profesionales = prof.id_profesionales 
-- where pr.diag_por_imagen = 'ecografia de cadera'
-- and prof.nombre = 'manuel'
-- and prof.apellido = 'baristo'
-- and prof.matricula = '4666'

-- c) lista de especialistas que no hayan atentido nunca a ningun paciente aun.

-- select p.id_profesionales, p.nombre, p.apellido, p.especialidad
-- from profesionales p 
-- left join turnos t on p.id_profesionales = t.id_profesionales 
-- where t.id_profesionales is null

-- b) la cantidad de turnos para tomagrafias computadas realizadas duran el mes de junio 2021

-- select count(t.id_turno) as cantidad_turnos
-- from turnos t
-- join practica_realizada pr on t.id_prac_real = pr.id_prac_real 
-- where pr.diag_por_imagen like "%radiografia%"
-- and year(t.fecha_hora) = 2021
-- and month(t.fecha_hora) = 6

