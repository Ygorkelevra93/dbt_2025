with
    fonte as (
        select *,round(amount/100.0, 2) as payment_amount from {{  source('stripe', 'payments') }}
        where status = 'success'
    )

    , pivot as (
        select 
        --*
        {% set payment_methods = ['bank_transfer','coupon','credit_card','gift_card'] %}
        ORDERID,
        {% for payment_method in payment_methods -%}
            sum(case when paymentmethod = '{{ payment_method }}' then payment_amount end) as {{ payment_method }}_amount
            {#-- '{{ loop.last }}' as is_last_payment_method -- para debugar o resultado da iteração #}
                {% if  loop.last == False -%}
                ,
                {%- endif -%}  
        {% endfor %}
        from fonte
        group by 1
    )

    , final as (
        select * from pivot
    )
select * from final