set search_path = uber;

select m.rankinginterno, count(m.idmorista)
from motorista m
group by m.rankinginterno;