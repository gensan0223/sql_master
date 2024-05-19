-- sample
select
    sample_date as cur_date,
    min(sample_date) over (
        order by
            sample_date asc rows between 1 preceding
            and 1 preceding
    ) as latest_date
from
    loadsample;

select
    sample_date as cur_date,
    load_val as cur_load,
    min(sample_date) over w as latest_date,
    min(load_val) over w as latest_load
from
    loadsample
window
    w as (
        order by
            sample_date asc rows between 1 preceding
            and 1 preceding
    );

select
    sample_date as cur_date,
    load_val as cur_load,
    min(sample_date) over w as latest_date,
    min(load_val) over w as latest_load
from
    loadsample
window
    w as (
        order by
            sample_date asc range between interval '1' day preceding
            and interval '1' day preceding
    );

select
    sample_date as cur_date,
    min(sample_date) over (
        order by
            sample_date asc rows between 1 preceding
            and 1 preceding
    ) as latest_1,
    min(sample_date) over (
        order by
            sample_date asc rows between 2 preceding
            and 2 preceding
    ) as latest_2,
    min(sample_date) over (
        order by
            sample_date asc rows between 3 preceding
            and 3 preceding
    ) as latest_3
from
    loadsample;

-- 2-1
select
    server,
    sample_date,
    sum(load_val) over () as sum_load
from
    serverloadsample;

-- 2-2
select
    server,
    sample_Ate,
    sum(load_val) over (
        partition by
            server
    ) as sum_load
from
    serverloadsample;
