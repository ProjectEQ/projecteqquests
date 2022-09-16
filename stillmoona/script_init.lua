local version = eq.get_zone_instance_version()
if version == instance_version.stillmoon_temple_sickness_of_the_spirit then
  eq.load_encounter("sickness_of_the_spirit")
elseif version == instance_version.stillmoon_temple_trial_of_perseverance then
  eq.load_encounter("perseverance")
end
