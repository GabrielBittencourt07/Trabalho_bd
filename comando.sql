set search_path = uber;

select m.rankinginterno, count(*)
from motorista m
group by m.rankinginterno;