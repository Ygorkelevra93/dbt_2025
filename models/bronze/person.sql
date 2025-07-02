
{{ config(materialized='table') }}

with
    fonte as (
    select 
        BUSINESSENTITYID
        ,PERSONTYPE
        ,NAMESTYLE
        ,TITLE
        ,FIRSTNAME
        ,MIDDLENAME
        ,LASTNAME
        ,SUFFIX
        ,EMAILPROMOTION
        ,ADDITIONALCONTACTINFO
        ,DEMOGRAPHICS
        ,ROWGUID
        ,MODIFIEDDATE    
    from {{ source("techfriday", "PERSON_PERSON") }}
    ),

    renamed as (
        select
            BUSINESSENTITYID
            ,PERSONTYPE
            ,NAMESTYLE
            ,TITLE
            ,FIRSTNAME||' '||coalesce(MIDDLENAME,' ')||' ' ||LASTNAME as NAME
            --,FIRSTNAME
            --,MIDDLENAME
            --,LASTNAME
            ,SUFFIX
            ,EMAILPROMOTION
            ,ADDITIONALCONTACTINFO
            ,DEMOGRAPHICS
            ,ROWGUID
            ,MODIFIEDDATE
        from  fonte
        
    )
select * from renamed




