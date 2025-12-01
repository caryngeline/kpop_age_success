with 

    source as (
        select 
            id as group_id,
            name as group_name,
            debut_date,
            sales_circle as physical_sales,
            views as music_video_views,
            circle_streaming_score as streaming_score,
            billboard_global,
            music_show_awards,
            yearly_awards,
            paks

        from {{ source('soridata', 'achievements') }}
        where disband_date is null and act like 'group' and debut_date is not null and physical_sales <> 0
    )

select * from source
