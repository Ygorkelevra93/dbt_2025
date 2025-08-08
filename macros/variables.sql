{% macro variaveis ()%}

{% set my_name = 'Ygor'%}
{{ log("Hello " ~ my_name, info=True) }}
{{ log("Hello " ~ var("user_name","NO USER DEFAULT"), info=True) }}
{%endmacro %}