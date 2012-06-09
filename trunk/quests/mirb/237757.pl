#Zone - mirb - Miragul's Menagerie - The Frozen Nightmare, zone ID 50, instanced raid
#NPC 237791
#Name: a chromatic bonewalker (this version has a red coloring (texture = 3)

sub EVENT_DEATH {
  # if a_chromatic_bonewalker was red(texture 3), spawn an icy bonewalker
  quest::spawn2(237789, 0, 0, $x, $y, $z, $h); # spawn an icy bonewalker
}