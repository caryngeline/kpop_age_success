WITH 
    joined as (
        SELECT 
            a.group_id, 
            g.group_name, 
            g.debut_date,
            g.average_debut_age, 
            a.physical_sales,
            a.music_video_views,
            a.streaming_score,
            a.billboard_global,
            a.music_show_awards,
            a.yearly_awards,
            a.paks
        
        FROM {{ ref('int_idols_aggregated_to_groups') }} as g
        LEFT JOIN {{ ref ('stg_soridata_achievements') }} as a
        ON g.group_name = a.group_name
        order by average_debut_age
    )

select * from joined
