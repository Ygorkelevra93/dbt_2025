select * from {{ref("dim_listings_cleansed")}} lists
inner join {{ref("fct_reviews")}} fct on lists.LISTING_ID = fct.LISTING_ID
where lists.created_at >= fct.review_date
