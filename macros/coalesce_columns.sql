{% macro coalesce_columns(columns, default=0) %}
    coalesce(
        {% for col in columns %}
            {{ col }}{% if not loop.last %}, {% endif %}
        {% endfor %}
        , {{ default }}
    )
{% endmacro %}