with 
    male_idols as (
        select 
            stage_name as idol_name,
            CAST(birthdate as date) as birth_date,
            --CAST(birthdate as datetime) as birth_date,
            CASE 
                when group_name = '2:00 PM' then '2PM'
                else UPPER(group_name) end as group_name
        
        from {{ source('kpop_db', 'male_idols') }}
        where group_name is not null

    ),

    female_idols as (
        select 
            stage_name as idol_name,
            CAST(birthdate as date) as birth_date,
            --CAST(birthdate as datetime) as birth_date,
            CASE 
                when group_name = 'I''LL-IT' then 'ILLIT'
                when group_name = '(G)I-DLE' then 'I-DLE'
                else UPPER(group_name) end as group_name
        from {{ source('kpop_db', 'female_idols') }}
        where group_name is not null

    ),

    idols as (
        select * from female_idols
        union 
        select * from male_idols
    
    )

SELECT * from idols order by group_name 
