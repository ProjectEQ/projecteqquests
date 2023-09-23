local version = eq.get_zone_instance_version()
if version == instance_version.stillmoon_temple_sickness_of_the_spirit then
  eq.load_encounter("sickness_of_the_spirit")
elseif version == instance_version.stillmoon_temple_trial_of_perseverance then
  eq.load_encounter("perseverance")
elseif version == instance_version.stillmoon_temple_best_laid_plans then
  eq.load_encounter("best_laid_plans")
elseif version == instance_version.stillmoon_temple_scales_of_justice then
  eq.load_encounter("scales_of_justice")
elseif version == instance_version.stillmoon_temple_animated_statue_plans then
  eq.load_encounter("animated_statue_plans")
elseif version == instance_version.stillmoon_temple_tracking_the_kirin then
  eq.load_encounter("tracking_the_kirin")
elseif version == instance_version.stillmoon_temple_tea_for_thy_master then
  eq.load_encounter("tea_for_thy_master")
elseif version == instance_version.stillmoon_temple_guardian_of_the_sands then
  eq.load_encounter("guardian_of_the_sands")
end
