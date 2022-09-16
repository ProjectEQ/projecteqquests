local version = eq.get_zone_instance_version()
if version == instance_version.tirranuns_delve_have_note_will_travel then
  eq.load_encounter("have_note_will_travel")
elseif version == instance_version.tirranuns_delve_calling_emoush then
  eq.load_encounter("emoush")
end
