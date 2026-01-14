with 
    source as (
        select 
            id as group_id,
            CASE 
                when name = 'FROMIS 9' then 'FROMIS_9'
                when name = 'TVXQ!' then 'TVXQ'
                else UPPER(name) end as group_name,
            debut_date,
            disband_date,
            sales_circle as physical_sales,
            views as music_video_views,
            circle_streaming_score as streaming_score,
            billboard_global,
            music_show_awards,
            yearly_awards,
            paks

        from {{ source('soridata', 'achievements') }}
        where disband_date is null and act like 'group' and debut_date is not null and sales_circle <> 0
    )

select * from source
