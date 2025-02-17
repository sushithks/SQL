

-- normal query using where, or

Select *
from Customer
where country like '%land'
    or country like '%North'
    or country like '%than'


 -- Replace the same query using ANY Operator

Select *
from Customer
where country
like ANY('%land', '%North', '%than')