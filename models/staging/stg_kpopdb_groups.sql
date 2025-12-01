with 
    source_male_groups as (
            select *
            
            from {{ source('kpop_db', 'male_groups') }}

    ),

    source_female_groups as (
            select *
            
            from {{ source('kpop_db', 'female_groups') }}

    ),

    male_groups as (
        select 
            group_name,
            CAST(debutdate AS datetime) as debut_date,
        
        from source_male_groups
        where active = 'Yes'

    ),

    female_groups as (
        select 
            group_name,
            CAST(debutdate AS datetime) as debut_date,
        
        from source_female_groups
        where active = 'Yes'

    ),

    kpop_groups as (
        select * from female_groups
        union 
        select * from male_groups
    
    )

select * from kpop_groups