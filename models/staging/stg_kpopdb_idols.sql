with 
    male_idols as (
        select 
            stage_name as idol_name,
            CAST(birthdate as datetime) as birth_date,
            UPPER(group_name) as group_name,
        
        from {{ source('kpop_db', 'male_idols') }}
        where group_name is not null

    ),

    female_idols as (
        select 
            stage_name as idol_name,
            CAST(birthdate as datetime) as birth_date,
            UPPER(group_name) as group_name,
        
        from {{ source('kpop_db', 'female_idols') }}
        where group_name is not null

    ),

    idols as (
        select * from female_idols
        union 
        select * from male_idols
    
    )

SELECT * from idols order by group_name 
