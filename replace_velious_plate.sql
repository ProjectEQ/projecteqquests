START TRANSACTION;

-- Plate Boots
CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Boots'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Boots'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (524288) <> 0 AND (
     i.name LIKE '% of Forbidden Rites'
  OR i.name LIKE 'Runed Protector\'s %'
  OR i.name LIKE 'Dark Runed %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Plate Boots'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Plate Boots'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (524288) <> 0 AND (
     i.name LIKE 'Templar\'s %'
  OR i.name LIKE 'Shining %'
  OR i.name LIKE 'Malevolent %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Boots'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Boots'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (524288) <> 0 AND (
     i.name LIKE 'Akkirus\' % of the Risen'
  OR i.name LIKE 'Scaled Knight\'s %'
  OR i.name LIKE 'Blood Lord\'s %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

-- Plate Legs
CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Greaves'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Greaves'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (262144) <> 0 AND (
     i.name LIKE '% of Forbidden Rites'
  OR i.name LIKE 'Runed Protector\'s %'
  OR i.name LIKE 'Dark Runed %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Greaves'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Greaves'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (262144) <> 0 AND (
     i.name LIKE 'Templar\'s %'
  OR i.name LIKE 'Shining %'
  OR i.name LIKE 'Malevolent %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Greaves'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Greaves'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (262144) <> 0 AND (
     i.name LIKE 'Akkirus\' % of the Risen'
  OR i.name LIKE 'Scaled Knight\'s %'
  OR i.name LIKE 'Blood Lord\'s %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

-- Plate Bracer
CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Bracer'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Bracer'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (512|1024) <> 0 AND (
     i.name LIKE '% of Forbidden Rites'
  OR i.name LIKE 'Runed Protector\'s %'
  OR i.name LIKE 'Dark Runed %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Plate Bracelet'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Plate Bracelet'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (512|1024) <> 0 AND (
     i.name LIKE 'Templar\'s %'
  OR i.name LIKE 'Shining %'
  OR i.name LIKE 'Malevolent %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Bracer'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Bracer'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (512|1024) <> 0 AND (
     i.name LIKE 'Akkirus\' % of the Risen'
  OR i.name LIKE 'Scaled Knight\'s %'
  OR i.name LIKE 'Blood Lord\'s %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

-- Plate Chest
CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Breastplate'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Breastplate'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (131072) <> 0 AND (
     i.name LIKE '% of Forbidden Rites'
  OR i.name LIKE 'Runed Protector\'s %'
  OR i.name LIKE 'Dark Runed %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Breastplate'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Breastplate'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (131072) <> 0 AND (
     i.name LIKE 'Templar\'s %'
  OR i.name LIKE 'Shining %'
  OR i.name LIKE 'Malevolent %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Breastplate'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Breastplate'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (131072) <> 0 AND (
     i.name LIKE 'Akkirus\' % of the Risen'
  OR i.name LIKE 'Scaled Knight\'s %'
  OR i.name LIKE 'Blood Lord\'s %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

-- Plate Gloves
CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Gauntlets'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Gauntlets'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (4096) <> 0 AND (
     i.name LIKE '% of Forbidden Rites'
  OR i.name LIKE 'Runed Protector\'s %'
  OR i.name LIKE 'Dark Runed %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Plate Gauntlets'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Plate Gauntlets'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (4096) <> 0 AND (
     i.name LIKE 'Templar\'s %'
  OR i.name LIKE 'Shining %'
  OR i.name LIKE 'Malevolent %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Gauntlets'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Gauntlets'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (4096) <> 0 AND (
     i.name LIKE 'Akkirus\' % of the Risen'
  OR i.name LIKE 'Scaled Knight\'s %'
  OR i.name LIKE 'Blood Lord\'s %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

-- Plate Helmet
CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Helmet'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Helmet'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (4) <> 0 AND (
     i.name LIKE '% of Forbidden Rites'
  OR i.name LIKE 'Runed Protector\'s %'
  OR i.name LIKE 'Dark Runed %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Plate Helmet'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Plate Helmet'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (4) <> 0 AND (
     i.name LIKE 'Templar\'s %'
  OR i.name LIKE 'Shining %'
  OR i.name LIKE 'Malevolent %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Helmet'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Helmet'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (4) <> 0 AND (
     i.name LIKE 'Akkirus\' % of the Risen'
  OR i.name LIKE 'Scaled Knight\'s %'
  OR i.name LIKE 'Blood Lord\'s %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

-- Plate Arms
CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Vambraces'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Corroded Plate Vambraces'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (128) <> 0 AND (
     i.name LIKE '% of Forbidden Rites'
  OR i.name LIKE 'Runed Protector\'s %'
  OR i.name LIKE 'Dark Runed %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Vambraces'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Ancient Tarnished Vambraces'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (128) <> 0 AND (
     i.name LIKE 'Templar\'s %'
  OR i.name LIKE 'Shining %'
  OR i.name LIKE 'Malevolent %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_lootdrop_entries AS
SELECT lootdrop_id, chance
FROM lootdrop_entries
WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Vambraces'
);

DELETE FROM lootdrop_entries WHERE item_id = (
  SELECT id FROM items WHERE name LIKE 'Unadorned Plate Vambraces'
);

REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
SELECT t.lootdrop_id, i.id, t.chance / 5 
FROM temp_lootdrop_entries t, items i
WHERE i.reqlevel <= 60 AND i.slots & (128) <> 0 AND (
     i.name LIKE 'Akkirus\' % of the Risen'
  OR i.name LIKE 'Scaled Knight\'s %'
  OR i.name LIKE 'Blood Lord\'s %'
)
GROUP BY t.lootdrop_id, i.id;

DROP TABLE IF EXISTS temp_lootdrop_entries;

COMMIT;
