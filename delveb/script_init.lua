local version = eq.get_zone_instance_version()
if version == instance_version.tirranuns_delve_have_note_will_travel then
  eq.load_encounter("have_note_will_travel")
elseif version == instance_version.tirranuns_delve_calling_emoush then
  eq.load_encounter("emoush")
elseif version == instance_version.tirranuns_delve_storming_the_goblin_palace then
  eq.load_encounter("storming_the_goblin_palace")
elseif version == instance_version.tirranuns_delve_a_goblins_escort then
  eq.load_encounter("a_goblins_escort")
elseif version == instance_version.tirranuns_delve_fanning_the_flames then
  eq.load_encounter("fanning_the_flames")
end
