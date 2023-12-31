local version = eq.get_zone_instance_version()
if version == instance_version.stillmoon_ascent_drake_eggs then
  eq.load_encounter("drake_eggs")
elseif version == instance_version.stillmoon_ascent_kessdonas_perch then
  eq.load_encounter("Kess")
elseif version == instance_version.stillmoon_ascent_death_comes_swiftly then
  eq.load_encounter("death_comes_swiftly")
elseif version == instance_version.stillmoon_ascent_storm_dragon_scales then
  eq.load_encounter("storm_dragon_scales")
elseif version == instance_version.stillmoon_ascent_sudden_tremors then
  eq.load_encounter("sudden_tremors")
elseif version == 0 then
	eq.load_encounter("Mask_of_the_Hidden")
end
