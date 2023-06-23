{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='nth-bounty-369703',
      target_schema=new_schema,
      unique_key='order_id',

      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select * from nth-bounty-369703.{{target.schema}}.mock_orders

{% endsnapshot %}