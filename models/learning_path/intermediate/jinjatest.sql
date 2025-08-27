{% set payment_methods = ['bank_transfer','coupon','credit_card','gift_card'] %}

{% for method in payment_methods %}
    {{method }}
    {%- if not loop.last%} this is not final
        {%-else-%} this is final
    {%-endif-%}
{% endfor %}