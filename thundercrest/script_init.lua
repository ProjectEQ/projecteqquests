local version = eq.get_zone_instance_version()
if version == instance_version.thundercrest_isles_secret_of_the_storm then
  eq.load_encounter("history_of_the_isle")
elseif version == instance_version.thundercrest_isles_gilded_scroll then
  eq.load_encounter("the_gilded_scroll")
elseif version == instance_version.thundercrest_isles_the_creator then
  eq.load_encounter("the_creator")
end
