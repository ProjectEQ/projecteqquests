#Zone - mirb - Miragul's Menagerie - The Frozen Nightmare, zone ID 50, instanced raid
#NPC 237791
#Name: a chromatic bonewalker (this version has a brown coloring (texture = 4)

sub EVENT_DEATH_COMPLETE {
  # if a_chromatic_bonewalker was brown(texture 4), spawn a red version
  quest::spawn2(237757, 0, 0, $x, $y, $z, $h); # spawn a red chromatic bonewalker
}