#Zone - mirb - Miragul's Menagerie - The Frozen Nightmare, zone ID 50, instanced raid
#NPC 237756
#Name: a chromatic bonewalker (this version has a gray coloring (texture = 1)

sub EVENT_DEATH_COMPLETE {
  # if a_chromatic_bonewalker was gray(texture 1), spawn a brown version
  quest::spawn2(237791, 0, 0, $x, $y, $z, $h); # spawn a brown chromatic bonewalker
}