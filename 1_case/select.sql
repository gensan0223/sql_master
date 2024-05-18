-- greatest関数を使用した場合
select key, greatest(x, y) as greatest
from greatests g;

-- case式を使用した場合
select key, case when x > y then x else y end as greatest
from greatests g;

-- case式を使用し、xyzから最大数を取得した場合
select
	key,
	case when
		case when x > y then x else y end > z
		then y else z end as greatest
from greatests g;

-- 1-2
select case when sex = '1' then '男性' else '女性' end as 性別,
	sum(population),
	sum(case pref_name when '徳島' then population else 0 end) as 徳島,
	sum(case pref_name when '香川' then population else 0 end) as 香川,
	sum(case pref_name when '愛媛' then population else 0 end) as 愛媛,
	sum(case pref_name when '高知' then population else 0 end) as 高知,
	sum(case when pref_name in('徳島','香川','愛媛','高知') then population else 0 end) as 四国
from PopTbl2
group by 性別
;