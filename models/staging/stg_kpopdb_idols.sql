with 
    source_male_idols as (
            select *
            
            from {{ source('kpop_db', 'male_idols') }}

    ),

    source_female_idols as (
            select *
            
            from {{ source('kpop_db', 'female_idols') }}

    ),

    male_idols as (
        select 
            stage_name as idol_name,
            CAST(birthdate as datetime) as birth_date,
            group_name,
        
        from source_male_idols

    ),

    female_idols as (
        select 
            stage_name as idol_name,
            CAST(birthdate as datetime) as birth_date,
            group_name,
        
        from source_female_idols

    ),

    idols as (
        select * from female_idols
        union 
        select * from male_idols
    
    )
    

select * from idols
