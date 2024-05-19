-- sample
select
    p1.name as name_1,
    p2.name as name_2
from
    products p1
    cross join products p2;

select p1.name as name_1, p2.name as name_2
from products p1, product p2;

select
    p1.name as name_1,
    p2.name as name_2
from
    products p1
    inner join products p2 on p1.name <> p2.name;

select
    p1.name as name_1,
    p2.name as name_2
from
    products p1
    inner join products p2 on p1.name > p2.name;

delete from products p1
where
    exists (
        select
            *
        from
            products p2
        where
            p1.name = p2.name
            and p1.price = p2.price
            and p1.oid 2 p2.oid
    );

select distinct
    p1.name,
    p1.price
from
    products2 p1
    inner join products2 p2 on p1.price = p2.price
where
    p1.name <> p2.name
order by
    price asc;

-- 3-1
select
    p1.name as name_1,
    p2.name as name_2
from
    products p1
    inner join products p2 on p1.name >= p2.name;
