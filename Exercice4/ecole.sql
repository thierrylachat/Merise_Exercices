SELECT `p_firstname`, `p_lastname`, su.`s_subject`, ra.`n_value` FROM `pupils` AS pu 
	LEFT JOIN `rates` AS ra ON pu.`p_id` = ra.`p_id`
    LEFT JOIN `subjects` AS su ON ra.`s_id` = su.`s_id`
    ORDER BY 2,1 ASC;

SELECT `p_firstname` AS 'prenom eleve', `p_lastname` AS 'nom eleve', AVG(ra.`n_value`) AS 'moyenne', gr.`g_name` AS classe, t.`t_lastname` AS principal FROM `pupils` AS pu 
	LEFT JOIN `rates` AS ra ON pu.`p_id` = ra.`p_id`
    LEFT JOIN `grades` AS gr ON gr.`g_id` = pu.`p_id`
    LEFT JOIN `teachers` AS t ON t.`t_id` = gr.`t_id`
    GROUP BY p_firstname, p_lastname, g_name, t_lastname
    ORDER BY 2,1 ASC;
