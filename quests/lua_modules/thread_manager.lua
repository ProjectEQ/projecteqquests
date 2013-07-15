local TM = { };
local ThreadManager = { StateFirstRun = 0, StateRunning = 1, StateSuspended = 2, StateWaiting = 3, threads = { } }
setmetatable(ThreadManager, { __index = TM });

function ThreadManager:Resume(name)
	for i = 1, #self.threads do
		if(self.threads[i]._name == name) then
			if(self.threads[i]._state == self.StateFirstRun) then
				self.threads[i]._state = self.StateRunning;
				coroutine.resume(self.threads[i]._co, unpack(self.threads[i]._args));
			elseif(self.threads[i]._state == self.StateSuspended) then
				self.threads[i]._state = self.StateRunning;
				coroutine.resume(self.threads[i]._co);
			elseif(self.threads[i]._state == self.StateWaiting) then
				if(os.clock() >= self.threads[i]._wait_until) then
					self.threads[i]._state = self.StateRunning;
					coroutine.resume(self.threads[i]._co);
				end
			end
		end
	end
end

function ThreadManager:Create(name, f, ...)
	table.insert(self.threads, {
		_name = name,
		_co = coroutine.create(f),
		_args = {...},
		_state = self.StateFirstRun,
		_wait_until = 0.0
	});
end

function ThreadManager:Yield(...)
	local running = coroutine.running();
	if(running == nil) then
		return;
	end
	
	for i = 1, #self.threads do
		if(self.threads[i]._co == running) then
			self.threads[i]._state = self.StateSuspended;
			coroutine.yield(...);
			return;
		end
	end
	
	coroutine.yield(...);
end

function ThreadManager:Wait(t, ...)
	local running = coroutine.running();
	if(running == nil) then
		return;
	end
	
	for i = 1, #self.threads do
		if(self.threads[i]._co == running) then
			self.threads[i]._state = self.StateWaiting;
			self.threads[i]._wait_until = os.clock() + t;
			coroutine.yield(...);
			return;
		end
	end
	
	coroutine.yield(...);
end

function ThreadManager:Stop()
	local running = coroutine.running();
	if(running == nil) then
		return;
	end
	
	for i = 1, #self.threads do
		if(self.threads[i]._co == running) then
			table.remove(self.threads, i);
			coroutine.yield();
			return;
		end
	end
	
	coroutine.yield();
end

function ThreadManager:Clear()
	local running = coroutine.running();
	self.threads = { };
	if(running) then
		coroutine.yield();
	end
end

return ThreadManager;
