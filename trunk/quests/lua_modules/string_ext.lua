function string:case_insensitive_pattern()
	local p = self:gsub("(%%?)(.)", function(percent, letter)
		if percent ~= "" or not letter:match("%a") then
			return percent .. letter;
		else
			return string.format("[%s%s]", letter:lower(), letter:upper());
		end
	end);
	return p;
end

function string:findi(pattern, init, plain)
	if(init ~= nil and plain ~= nil) then
		return self:find(pattern:case_insensitive_pattern(), init, plain);
	else
		return self:find(pattern:case_insensitive_pattern());
	end	
end

function string:gmatchi(pattern)
	return self:gmatch(pattern:case_insensitive_pattern());
end

function string:gsubi(pattern, replace, n)
	if(n ~= nil) then
		return self:gsub(pattern:case_insensitive_pattern(), replace, n);
	else
		return self:gsub(pattern:case_insensitive_pattern(), replace);
	end	
end

function string:matchi(pattern, init)
	if(init ~= nil) then
		return self:match(pattern:case_insensitive_pattern(), init);
	else
		return self:match(pattern:case_insensitive_pattern());
	end
end

