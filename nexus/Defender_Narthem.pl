sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name. Behind me lies the doomed passageway to the Paludal Caverns. It's a very sore subject that we really don't like to talk about...  Some of our own were lost in the accident.");
  }
}
#END of FILE Zone:nexus  ID:152007 -- Defender_Narthem
