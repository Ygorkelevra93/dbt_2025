{% macro cents_to_dollar(campo,decimal_places=2) %}
    round({{ campo }}/100.0, {{ decimal_places }}) 
{% endmacro %}