local helper = require('translocators');

function event_say(e)
    if eq.is_the_ruins_of_kunark_enabled() then
        helper.hail_text(e, 'Timorous Deep', {zone=96, x=-3282, y=-4613, z=19, heading=326});
    end
end
