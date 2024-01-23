local version = eq.get_zone_instance_version()
if version == instance_version.lavaspinners_lair_grounding_the_drakes then
  eq.load_encounter("grounding_the_drakes")
elseif version == instance_version.lavaspinners_lair_treasure_hunting then
  eq.load_encounter("lavaspinner_hunting")
elseif version == instance_version.lavaspinners_lair_infested then
  eq.load_encounter("infested")
elseif version == instance_version.lavaspinners_lair_forbins_elixir then
  eq.load_encounter("forbins_elixir")
elseif version == instance_version.lavaspinners_lair_the_drake_menace then
  eq.load_encounter("the_drake_menace")
elseif version == instance_version.lavaspinners_lair_diving_for_lavarocks then
  eq.load_encounter("diving_for_lavarocks")
elseif version == instance_version.lavaspinners_lair_a_halflings_greed then
  eq.load_encounter("a_halflings_greed")
elseif version == instance_version.lavaspinners_lair_lavaspinners_locals then
  eq.load_encounter("lavaspinners_locals")
elseif version == instance_version.lavaspinners_lair_volkaras_bite then
	eq.load_encounter("volkaras_bite")
end
