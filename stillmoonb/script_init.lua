local version = eq.get_zone_instance_version()
if version == instance_version.stillmoon_ascent_drake_eggs then
  eq.load_encounter("drake_eggs")
elseif version == instance_version.stillmoon_ascent_kessdonas_perch then
  eq.load_encounter("Kess")
end
