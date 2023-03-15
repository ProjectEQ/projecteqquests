-- Do initial stat seeding

USE peq;

SET @SCALE_FACTOR = 1.5;
SET @MOD2_THRESHOLD = 5;
SET @HEROIC_T = 2;

-- Decrease Aggro Range
UPDATE peq.npc_types, ref.npc_types
   SET peq.npc_types.aggroradius = Floor(ref.npc_types.aggroradius * 0.75),
	    peq.npc_types.assistradius = Floor(ref.npc_types.assistradius * 0.75)
 WHERE peq.npc_types.id = ref.npc_types.id;

-- Apply Augment Schema
UPDATE db_str SET value = "1 (General)" 			      WHERE id = 1  AND type = 16;
UPDATE db_str SET value = "2 (Activated Effect)" 	   WHERE id = 2  AND type = 16;
UPDATE db_str SET value = "3 (Worn Effect)" 		      WHERE id = 3  AND type = 16;
UPDATE db_str SET value = "4 (Combat Effect)"		   WHERE id = 4  AND type = 16;
UPDATE db_str SET value = "20 (Weapon Ornamentation)" WHERE id = 20 AND type = 16;
UPDATE db_str SET value = "21 (Armor Ornamentation)"  WHERE id = 21 AND type = 16;

-- Remove Models from non-ornaments
UPDATE items SET idfile = "IT63" WHERE itemtype = 54 AND NOT augtype & (524288|1048576);

-- Configure Item Slots
-- Remove All Aug Slots

UPDATE items
   SET augslot1type = 0, 
	   augslot2type = 0, 
	   augslot3type = 0, 
	   augslot4type = 0, 
	   augslot5type = 0,
	   augslot6type = 0, 	   
	   augslot1visible = 0,
	   augslot2visible = 0,
	   augslot3visible = 0,
	   augslot4visible = 0,
	   augslot5visible = 0,
	   augslot6visible = 0
	WHERE items.id > 0;

-- Type 21 on Vis Slots
UPDATE items
   SET augslot6type = 21,
       augslot6visible = 1
 WHERE itemtype != 54
   AND slots & 923268 > 0
   AND races > 0;
   
-- Type 20 on Primary\Secondary\Ranged slots
UPDATE items
   SET augslot6type = 20,
       augslot6visible = 1
 WHERE itemtype != 54
   AND slots & 26624 > 0
   AND races > 0;   

-- All Items
UPDATE items
   SET augslot1type = 1, -- Type 1
	    augslot2type = 2, -- Type 2
	    augslot3type = 3, -- Type 3
	    augslot1visible = 1,
	    augslot2visible = 1,
	    augslot3visible = 1
 WHERE itemtype != 54
   AND slots > 0
   AND races > 0
   AND slots != 4194304
	AND (astr > 0 OR asta > 0 OR adex > 0 OR aagi > 0 OR aint > 0 OR awis > 0 OR hp > 0 OR mana > 0
	  OR fr > 0 OR cr > 0 OR dr > 0 OR mr > 0 OR pr > 0 OR clickeffect > 0 OR proceffect > 0 OR focuseffect > 0);
   
-- Pri\Sec\Ranged Weapons
UPDATE items
   SET augslot4type = 4,
       augslot5type = 4,
	    augslot4visible = 1,
	    augslot5visible = 1
 WHERE itemtype != 54
   AND slots & (8192|16384|2048) 
   AND races > 0
   AND ( itemtype <= 5 OR itemtype = 35 OR itemtype = 45 ); 

   
-- Remove Type 2 from items with Click effects
UPDATE items
   SET augslot2type = 0,
       augslot2visible = 0
 WHERE itemtype != 54
   AND clickeffect > 0;
   
-- Remove First Type 3 from items with Focus or Worn effects
UPDATE items
   SET augslot3type = 0,
       augslot3visible = 0
 WHERE itemtype != 54
   AND ( focuseffect > 0
    OR   worneffect  > 0 );

-- Remove first type 4 from items with proc effects
UPDATE items
   SET augslot4type = 0,
       augslot4visible = 0
 WHERE itemtype != 54
   AND proceffect > 0;
   
-- Replace Type 2 with Type 1 on Visible Armor
UPDATE items
   SET augslot2type = 1,
       augslot2visible = 1
 WHERE itemtype != 54
   AND slots & (4|128|512|1024|4096|131072|262144|524288) <> 0
	AND slots > 0;
   
-- All Augments Become Type 1
UPDATE items
   SET augtype = 1
 WHERE itemtype = 54 AND NOT augtype & (524288|1048576);
 
-- Augments with Procs Become Type 4
UPDATE items
   SET augtype = 8
 WHERE itemtype = 54
   AND proceffect > 0;

-- Augments with a Focus or a Worn Effect becomes a Type 3
UPDATE items
   SET augtype = 4
 WHERE itemtype = 54
   AND ( worneffect > 0 OR focuseffect > 0 );
   
UPDATE items
   SET augtype = 2
 WHERE itemtype = 54
   AND clickeffect > 0;
UPDATE peq.items
JOIN ref.items ON peq.items.id = ref.items.id
SET peq.items.ac = ref.items.ac,
    peq.items.hp = ref.items.hp,
    peq.items.mana = ref.items.mana,
    peq.items.endur = ref.items.endur,
    peq.items.spelldmg = ref.items.spelldmg,
    peq.items.healamt = ref.items.healamt,
    peq.items.astr = ref.items.astr,
    peq.items.adex = ref.items.adex,
    peq.items.aagi = ref.items.aagi,
    peq.items.asta = ref.items.asta,
    peq.items.aint = ref.items.aint,
    peq.items.awis = ref.items.awis,
    peq.items.acha = ref.items.acha,
    peq.items.regen = ref.items.regen,
    peq.items.manaregen = ref.items.manaregen,
    peq.items.enduranceregen = ref.items.enduranceregen,
    peq.items.fr = ref.items.fr,
    peq.items.cr = ref.items.cr,
    peq.items.mr = ref.items.mr,
    peq.items.dr = ref.items.dr,
    peq.items.pr = ref.items.pr,
    peq.items.heroic_str = ref.items.heroic_str,
    peq.items.heroic_sta = ref.items.heroic_sta,
    peq.items.heroic_dex = ref.items.heroic_dex,
    peq.items.heroic_agi = ref.items.heroic_agi,
    peq.items.heroic_int = ref.items.heroic_int,
    peq.items.heroic_wis = ref.items.heroic_wis,
    peq.items.heroic_cha = ref.items.heroic_cha,
    peq.items.heroic_fr = ref.items.heroic_fr,
    peq.items.heroic_cr = ref.items.heroic_cr,
    peq.items.heroic_mr = ref.items.heroic_mr,
    peq.items.heroic_dr = ref.items.heroic_dr,
    peq.items.heroic_pr = ref.items.heroic_pr,
    peq.items.shielding = ref.items.shielding,
    peq.items.spellshield = ref.items.spellshield,
    peq.items.dotshielding = ref.items.dotshielding,
    peq.items.stunresist = ref.items.stunresist,
    peq.items.strikethrough = ref.items.strikethrough,
    peq.items.attack = ref.items.attack,
    peq.items.accuracy = ref.items.accuracy,
    peq.items.avoidance = ref.items.avoidance,
    peq.items.damageshield = ref.items.damageshield,
    peq.items.dsmitigation = ref.items.dsmitigation,
    peq.items.haste = ref.items.haste,
    peq.items.clairvoyance = ref.items.clairvoyance,
    peq.items.damage = ref.items.damage
WHERE peq.items.itemtype = 54;  

-- Remove all aug slots from items which are no-rent or are summoned
UPDATE items
   SET augslot1type = 0, 
	    augslot2type = 0, 
	    augslot3type = 0, 
	    augslot4type = 0, 
	    augslot5type = 0,
	    augslot6type = 0, 	   
	    augslot1visible = 0,
	    augslot2visible = 0,
	    augslot3visible = 0,
	    augslot4visible = 0,
       augslot5visible = 0,
	    augslot6visible = 0
	WHERE items.id > 0 AND (items.norent = 0 OR items.Name LIKE 'Summoned: %');
  
-- Reset primary stats
UPDATE peq.items, ref.items
   SET peq.items.astr = ref.items.astr, peq.items.asta = ref.items.asta, peq.items.adex = ref.items.adex, peq.items.aagi = ref.items.aagi,
       peq.items.aint = ref.items.aint, peq.items.awis = ref.items.awis, peq.items.acha = ref.items.acha
 WHERE peq.items.id = ref.items.id; 
 
-- Increase AC on visible-slot items
UPDATE peq.items, ref.items
   SET peq.items.ac = Abs(Ceil(ref.items.ac * 2))
 WHERE peq.items.id = ref.items.id
   AND ref.items.ac > 0
   AND ref.items.slots & (4|128|512|1024|4096|131072|262144|524288);

-- Increase AC on non-visible-slot items
UPDATE peq.items, ref.items
   SET peq.items.ac = Abs(Ceil(ref.items.ac * @SCALE_FACTOR))
 WHERE peq.items.id = ref.items.id
   AND ref.items.ac > 0
   AND ref.items.slots & (1|2|8|16|32|64|256|2048|8192|16384|32768|1048576);
   
-- Increase Weapon Damage
UPDATE peq.items, ref.items
   SET peq.items.damage = Ceil(ref.items.damage * @SCALE_FACTOR)
 WHERE peq.items.id = ref.items.id
   AND ref.items.damage > 0
   AND (ref.items.itemtype = 0 OR ref.items.itemtype = 2 OR ref.items.itemtype = 3 OR ref.items.itemtype = 45);
   
-- Increase 2H Weapon\Aug Damage
UPDATE peq.items, ref.items
   SET peq.items.damage = Ceil(ref.items.damage * @SCALE_FACTOR)
 WHERE peq.items.id = ref.items.id
   AND ref.items.damage > 0
   AND (ref.items.itemtype = 1 OR ref.items.itemtype = 4 OR ref.items.itemtype = 35 OR ref.items.itemtype = 54);

-- Increase Elemental Damage
UPDATE peq.items, ref.items
   SET peq.items.elemdmgamt = Ceil(ref.items.elemdmgamt * 2)
 WHERE peq.items.id = ref.items.id
   AND ref.items.elemdmgamt > 0;

-- Increase Bane Damage
UPDATE peq.items, ref.items
   SET peq.items.elemdmgamt = Ceil(ref.items.banedmgamt * 2)
 WHERE peq.items.id = ref.items.id
   AND ref.items.banedmgamt > 0;
   
-- Increase Backstab Damage
UPDATE peq.items, ref.items
   SET peq.items.backstabdmg = Ceil(ref.items.backstabdmg * 2)
 WHERE peq.items.id = ref.items.id
   AND ref.items.backstabdmg > 0;
   
-- Add HP to items based on pre-existing primary stats
UPDATE peq.items, ref.items
   SET peq.items.hp = (ref.items.hp * @SCALE_FACTOR) + Abs(ref.items.astr + ref.items.asta + ref.items.adex + ref.items.aagi + ref.items.aint + ref.items.awis + ref.items.acha)
 WHERE peq.items.id = ref.items.id
   AND ( ref.items.astr > 0 OR
		 ref.items.asta > 0 OR
		 ref.items.adex > 0 OR
		 ref.items.aagi > 0 OR
		 ref.items.aint > 0 OR
	 	 ref.items.awis > 0 ); 
 
-- Add Int\Wis based on pre-existing Mana
UPDATE peq.items, ref.items
   SET peq.items.aint = ref.items.aint + Ceil(ref.items.mana / 10)
 WHERE peq.items.id = ref.items.id AND ref.items.mana > 0
   AND ref.items.aint >= ref.items.awis
   AND ref.items.aint <= (ref.items.mana / 10);
		 
UPDATE peq.items, ref.items
   SET peq.items.awis = ref.items.awis + Ceil(ref.items.mana / 10)
 WHERE peq.items.id = ref.items.id AND ref.items.mana > 0
   AND ref.items.aint <= ref.items.awis
   AND ref.items.awis <= (ref.items.mana / 10);   
 
-- Add HP Regen based on pre-existing STA
UPDATE peq.items, ref.items
   SET peq.items.regen = ref.items.regen + Floor(ref.items.asta / @MOD2_THRESHOLD)
 WHERE peq.items.id = ref.items.id
   AND ref.items.asta >= @MOD2_THRESHOLD;
   
-- Add Heroic STR based on pre-existing STR
UPDATE peq.items, ref.items
   SET peq.items.heroic_str = Least(99,ref.items.heroic_str + Floor(peq.items.astr / @HEROIC_T)),
       peq.items.astr = peq.items.astr - Floor(peq.items.heroic_str)
 WHERE peq.items.id = ref.items.id
   AND ref.items.astr >= @HEROIC_T;
   
-- Add Heroic STA based on pre-existing STA
UPDATE peq.items, ref.items
   SET peq.items.heroic_sta = Least(99,ref.items.heroic_sta + Floor(peq.items.asta / @HEROIC_T)),
       peq.items.asta = peq.items.asta - Floor(peq.items.heroic_sta)
 WHERE peq.items.id = ref.items.id
   AND ref.items.asta >= @HEROIC_T;
   
-- Add Heroic DEX based on pre-existing DEX
UPDATE peq.items, ref.items
   SET peq.items.heroic_dex = Least(99,ref.items.heroic_dex + Floor(peq.items.adex / @HEROIC_T)),
       peq.items.adex = peq.items.adex - Floor(peq.items.heroic_dex)
 WHERE peq.items.id = ref.items.id
   AND ref.items.adex >= @HEROIC_T;
   
-- Add Heroic AGI based on pre-existing AGI
UPDATE peq.items, ref.items
   SET peq.items.heroic_agi = Least(99,ref.items.heroic_agi + Floor(peq.items.aagi / @HEROIC_T)),
       peq.items.aagi = peq.items.aagi - Floor(peq.items.heroic_agi)
 WHERE peq.items.id = ref.items.id
   AND ref.items.aagi >= @HEROIC_T;
   
-- Add Heroic INT based on pre-existing INT
UPDATE peq.items, ref.items
   SET peq.items.heroic_int = Least(99,ref.items.heroic_int + Floor(peq.items.aint / @HEROIC_T)),
       peq.items.aint = peq.items.aint - Floor(peq.items.heroic_int)
 WHERE peq.items.id = ref.items.id
   AND ref.items.aint >= @HEROIC_T;

-- Add Heroic WIS based on pre-existing WIS
UPDATE peq.items, ref.items
   SET peq.items.heroic_wis = Least(99,ref.items.heroic_wis + Floor(peq.items.awis / @HEROIC_T)),
       peq.items.awis = peq.items.awis - Floor(peq.items.heroic_wis)
 WHERE peq.items.id = ref.items.id
   AND ref.items.awis >= @HEROIC_T; 
   
-- Add Heroic CHA based on pre-existing CHA
UPDATE peq.items, ref.items
   SET peq.items.heroic_cha = Least(99,ref.items.heroic_cha + Floor(peq.items.acha / @HEROIC_T)),
       peq.items.acha = peq.items.acha - Floor(peq.items.heroic_cha)
 WHERE peq.items.id = ref.items.id
   AND ref.items.awis >= @HEROIC_T; 
   
-- Add extra Heal Amount to non-augs for wis-casters
UPDATE peq.items, ref.items
   SET peq.items.spelldmg = Floor(peq.items.spelldmg * @SCALE_FACTOR)
 WHERE peq.items.id = ref.items.id
   AND peq.items.itemtype != 54
   AND peq.items.classes & (2|32|512);
   
-- Add Resists based on sum of primary stats
UPDATE peq.items, ref.items
   SET peq.items.fr = ref.items.fr + CEIL((peq.items.astr + peq.items.asta + peq.items.adex + peq.items.aagi + peq.items.aint + peq.items.awis + peq.items.acha) / 7),
       peq.items.cr = ref.items.cr + CEIL((peq.items.astr + peq.items.asta + peq.items.adex + peq.items.aagi + peq.items.aint + peq.items.awis + peq.items.acha) / 7),
       peq.items.mr = ref.items.mr + CEIL((peq.items.astr + peq.items.asta + peq.items.adex + peq.items.aagi + peq.items.aint + peq.items.awis + peq.items.acha) / 7),
       peq.items.pr = ref.items.pr + CEIL((peq.items.astr + peq.items.asta + peq.items.adex + peq.items.aagi + peq.items.aint + peq.items.awis + peq.items.acha) / 7),
       peq.items.dr = ref.items.dr + CEIL((peq.items.astr + peq.items.asta + peq.items.adex + peq.items.aagi + peq.items.aint + peq.items.awis + peq.items.acha) / 7)
 WHERE peq.items.id = ref.items.id;

-- Scale up primary stats by SCALE_FACTOR
UPDATE peq.items
   SET astr = Abs(Ceil(astr * @SCALE_FACTOR)), asta = Abs(Ceil(asta * @SCALE_FACTOR)), adex = Abs(Ceil(adex * @SCALE_FACTOR)),
	    aagi = Abs(Ceil(aagi * @SCALE_FACTOR)), aint = Abs(Ceil(aint * @SCALE_FACTOR)), awis = Abs(Ceil(awis * @SCALE_FACTOR)),
	    acha = Abs(Ceil(acha * @SCALE_FACTOR))
 WHERE slots > 0 AND classes > 0 AND races > 0;

-- Round up HP
UPDATE peq.items
   SET peq.items.hp = Abs(Ceil(peq.items.hp / 5) * 5)
 WHERE peq.items.hp > 0;
-- Round up Mana
 
UPDATE peq.items
   SET peq.items.mana = Abs(Ceil(peq.items.mana / 5) * 5)
 WHERE peq.items.mana > 0;
 
-- Round down Resists
UPDATE peq.items
   SET peq.items.fr = Abs(floor(peq.items.fr / 5) * 5)
 WHERE peq.items.fr > 10;
 
UPDATE peq.items
   SET peq.items.cr = Abs(floor(peq.items.cr / 5) * 5)
 WHERE peq.items.cr > 10;

UPDATE peq.items
   SET peq.items.mr = Abs(floor(peq.items.mr / 5) * 5)
 WHERE peq.items.mr > 10;

UPDATE peq.items
   SET peq.items.pr = Abs(floor(peq.items.pr / 5) * 5)
 WHERE peq.items.pr > 10;

UPDATE peq.items
   SET peq.items.dr = Abs(floor(peq.items.dr / 5) * 5)
 WHERE peq.items.dr > 10;
 
-- Add Spell Damage to non-augs
UPDATE peq.items, ref.items
   SET peq.items.spelldmg = ref.items.spelldmg + Floor(Greatest(peq.items.aint, peq.items.awis, peq.items.astr, peq.items.adex) / 3) + Floor(peq.items.hp / 25),
       peq.items.healamt = ref.items.healamt + Floor(Greatest(peq.items.acha, peq.items.awis, peq.items.aagi, peq.items.asta) / 3) + Floor(peq.items.hp / 25)
 WHERE peq.items.id = ref.items.id
   AND peq.items.itemtype != 54;
   
-- Add extra Spell Damage to non-augs for casters
UPDATE peq.items, ref.items
   SET peq.items.spelldmg = Floor(peq.items.spelldmg * 1.25)
 WHERE peq.items.id = ref.items.id
   AND peq.items.itemtype != 54
   AND peq.items.classes & (1024|2048|4096|8192|2|32|512);
   
-- Add extra Spell Damage \ Heal Amount to 2HB for casters
UPDATE peq.items, ref.items
   SET peq.items.spelldmg = Floor(peq.items.spelldmg * 2), peq.items.healamt = Floor(peq.items.healamt * 2)
 WHERE peq.items.id = ref.items.id
   AND peq.items.itemtype = 4
   AND peq.items.classes & (1024|2048|4096|8192|2|32|512);