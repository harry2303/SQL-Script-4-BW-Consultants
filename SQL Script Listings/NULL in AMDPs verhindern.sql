/* NULL in AMDPs verhindern */
SELECT ifnull(null, 'A') AS "char" FROM dummy; -- 2 Parameter
SELECT coalesce(null, null, 'B', null, 'A') AS "char" FROM dummy; -- x Parameter