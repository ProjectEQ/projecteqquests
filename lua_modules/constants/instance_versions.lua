--
-- instance_version.lua
--
-- Example usage in any quest script: e.self:Say("Version is " .. instance_version.stillmoon_temple_tea_for_thy_master);
--
-- Query used to generate list
--
-- SELECT
--   CONCAT(
--     LOWER(
--       REPLACE(
--         REPLACE(REPLACE(long_name, " ", "_"), ":", ""),
--         "'",
--         ""
--       )
--     ),
--     " = ",
--     version,
--     ", "
--   ) AS instance_string
-- FROM
--   zone
-- WHERE
--   version > 0
-- ORDER BY
--   zoneidnumber,
--   version;

instance_version = {
    ikkinz_chambers_of_singular_might = 0,
    ikkinz_chambers_of_twin_struggles = 1,
    ikkinz_chambers_of_the_tri_fates = 2,
    ikkinz_chambers_of_righteousness = 3,
    ikkinz_chambers_of_glorification = 4,
    ikkinz_chambers_of_transcendence = 5,
    ikkinz_chambers_of_destruction = 6,
    the_nektulos_forest = 1,
    the_bazaar = 1,
    stillmoon_temple_sickness_of_the_spirit = 1,
    stillmoon_temple_animated_statue_plans = 2,
    stillmoon_temple_best_laid_plans = 3,
    stillmoon_temple_diseased_pumas = 4,
    stillmoon_temple_guardian_of_the_sands = 5,
    stillmoon_temple_scales_of_justice = 6,
    stillmoon_temple_tea_for_thy_master = 7,
    stillmoon_temple_tracking_the_kirin = 8,
    stillmoon_temple_trial_of_perseverance = 9,
    stillmoon_ascent_kessdonas_perch = 1,
    stillmoon_ascent_reflections_of_silver = 2,
    stillmoon_ascent_death_comes_swiftly = 3,
    stillmoon_ascent_drake_eggs = 4,
    stillmoon_ascent_storm_dragon_scales = 5,
    stillmoon_ascent_sudden_tremors = 6,
    the_ascent_signal_fires = 7,
    thundercrest_isles_goblin_dojo = 1,
    thundercrest_isles_holy_hour = 2,
    thundercrest_isles_an_end_to_the_storms = 3,
    thundercrest_isles_behind_closed_doors = 4,
    thundercrest_isles_house_of_the_autumn_rose = 5,
    thundercrest_isles_lair_unguarded = 6,
    thundercrest_isles_scions_of_thundercrest = 7,
    thundercrest_isles_simple_task = 8,
    thundercrest_isles_splitting_the_storm = 9,
    thundercrest_isles_stormreach_challenge = 10,
    thundercrest_isles_the_creator = 11,
    thundercrest_isles_throes_of_contagion = 12,
    thundercrest_isles_plunder_the_hoard = 13,
    thundercrest_isles_gilded_scroll = 14,
    thundercrest_isles_secret_of_the_storm = 15,
    lavaspinners_lair_grounding_the_drakes = 1,
    lavaspinners_lair_a_halflings_greed = 2,
    lavaspinners_lair_forbins_elixir = 3,
    lavaspinners_lair_lavaspinners_locals = 4,
    lavaspinners_lair_the_drake_menace = 5,
    lavaspinners_lair_diving_for_lavarocks = 6,
    lavaspinners_lair_infested = 7,
    lavaspinners_lair_treasure_hunting = 8,
    lavaspinners_lair_volkaras_bite = 9,
    tirranuns_delve_storming_the_goblin_palace = 1,
    tirranuns_delve_a_goblins_escort = 2,
    tirranuns_delve_children_of_gimblax = 3,
    tirranuns_delve_calling_emoush = 4,
    tirranuns_delve_fanning_the_flames = 5,
    tirranuns_delve_have_note_will_travel = 6,
    the_nest_lair_of_the_blackwing_drakes = 1,
    the_nest_in_the_shadows = 3,
    the_nest_circle_of_drakes = 4,
    the_nest_clues = 5,
    the_nest_curse_of_jurek = 6,
    the_nest_dragons_egg = 7,
    the_nest_failed_expedition = 8,
    the_nest_flight_of_the_blackwing_drakes = 9,
    the_nest_origins_of_the_curse = 10,
    the_nest_rivals = 11,
    the_nest_scrap_metal = 12,
    the_nest_spiders_eye = 13,
    the_nest_toppling_of_the_monolith = 14,
    the_nest_web_of_lies = 15,
    the_nest_stopping_firionas_henchmen = 16,
};
