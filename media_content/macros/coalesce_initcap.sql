{%- macro coalesce_and_initcap(column_name, value='Unknown') -%}
COALESCE(INITCAP({{column_name}}),'{{value}}')
{%- endmacro -%}