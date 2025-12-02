with 
    joined as (
        select * 
        from {{ ref('stg_kpopdb_idols') }} 
        RIGHT JOIN {{ ref('stg_kpopdb_groups') }} using (group_name)
        ORDER by group_name
    ),

    get_age_during_debut as (
        select *,
            DATEDIFF(YEAR, birth_date, debut_date) - CASE WHEN (MONTH(birth_date) > MONTH(debut_date)) OR (MONTH(birth_date) = MONTH(debut_date) AND DAY(birth_date) > DAY(debut_date)) THEN 1 ELSE 0 END AS debut_age,
        from joined
        order by debut_age desc
    ),

    aggregated as (
        select 
            group_name,
            debut_date,
            AVG(debut_age) as average_debut_age,
            active
        
        from get_age_during_debut
        group by group_name, debut_date, active
        
    )

select * from aggregated order by average_debut_age

