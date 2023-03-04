SET @type_class = 3;
SET @type_archetype = 2;
SET @type_general = 1;

SET @aa_cost_scalar = 2;

SET @spell_id = 2942;
SET @hotkey_upper = "Sha\'s";
SET @hotkey_lower = "Advan.";
SET @aa_type = @type_class;
SET @aa_spell_type = 0;
SET @aa_expansion = -1;
SET @aa_cost = 5;

SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2) FROM spells_new WHERE spells_new.id = @spell_id);

REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@aa_rank_id, 1, @spell_name);
REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@aa_rank_id, 4, @spell_desc);
REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@aa_rank_id, 2, @hotkey_upper);
REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@aa_rank_id, 3, @hotkey_lower);

INSERT INTO aa_ability (`id`, `name`, `classes`, `type`, `first_rank_id`)
VALUES (@aa_id, @spell_name, @aa_classes, @aa_type, @aa_rank_id);

INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
VALUES (@aa_rank_id, @aa_rank_id, @aa_rank_id, @aa_rank_id, @aa_rank_id, @aa_cost * @aa_cost_scalar, @aa_rank_lvl, @spell_id, @aa_spell_type, @recast_time, @aa_expansion);
