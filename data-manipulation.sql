SELECT DISTINCT
 s.date AS session_date,
 s.ga_session_id AS session_id,
 sp.continent,
 sp.country,
 sp.device,
 sp.browser,
 sp.mobile_model_name,
 sp.operating_system,
 sp.language,
 sp.medium,
 sp.channel,
 acc.id AS account_id,
 acc.is_verified,
 acc.is_unsubscribed,
 p.item_id,
 p.category,
 p.name,
 p.price AS unit_price,
 p.short_description
FROM `DA.session` s
JOIN `DA.session_params` sp
 ON s.ga_session_id = sp.ga_session_id
JOIN `DA.account_session` acs
 ON s.ga_session_id = acs.ga_session_id
JOIN `DA.account` acc
 ON acs.account_id = acc.id
JOIN `DA.order` o
 ON s.ga_session_id = o.ga_session_id
JOIN `DA.product` p
 ON o.item_id = p.item_id
