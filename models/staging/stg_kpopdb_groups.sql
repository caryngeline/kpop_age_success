with 
    male_groups as (
        select 
            CASE 
                when group_name = '2:00 PM' then '2PM'
                else UPPER(group_name) end as group_name,
            CAST(debutdate AS datetime) as debut_date,
            active,
        
        from {{ source('kpop_db', 'male_groups') }}
        where active = 'Yes'

    ),

    female_groups as (
        select 
            CASE 
                when group_name = 'I''LL-IT' then 'ILLIT'
                when group_name = '(G)I-DLE' then 'I-DLE'
                else UPPER(group_name) end as group_name,
            CASE
                when debutdate = '2002-06-20' then CAST('2022-06-20' AS datetime)
                when debutdate = '-0001-11-30' then CAST('2024-03-25' AS datetime)
                else CAST(debutdate AS datetime) end as debut_date,
            active,
        
        from {{ source('kpop_db', 'female_groups') }}
        where active = 'Yes'

    ),

    kpop_groups as (
        select * from female_groups
        union 
        select * from male_groups
    
    )

select * from kpop_groups order by group_name