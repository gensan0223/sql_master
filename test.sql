select
    売上月,
    sum(
        case when store_id = 1 then amount else 0 end
        ) as 店舗１,
    sum(case when store_id = 2 then amount else 0 end) as 店舗２
from (
    select date_format(payment_date, '%Y-%m') as 売上月, payment_id, store_id, amount
    from payment
) as 売上
group by 売上月;