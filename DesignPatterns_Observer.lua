--Observer Pattern

local EVENTTYPE =
{
	COME = 1,
	LEAVE = 2,
}

local subject = {}

subject.new = function ( o )
	o = o or {}
	o.observers = {}
	setmetatable(o,subject)
	subject.__index = subject
	return o
end

function subject:addObserver(ob)
	if not ob then
		return
	end
	table.insert(self.observers,ob)
end

function subject:removeObserver(ob)
	if not ob then
		return
	end
	for i,v in ipairs(self.observers) do
		if v == ob then
			table.remove(self.observers,i)
			break
		end
	end
end

function subject:notify(eventType,eventData)
	for i,v in ipairs(self.observers) do
		v:onNotify(eventType,eventData)
	end
end

function subject:come(data)
	self:notify(EVENTTYPE.COME,"高高兴兴地")
end

function subject:leave(data)
	self:notify(EVENTTYPE.LEAVE,"不开心地")
end


local observer = {}
observer.new = function ( o )
	o = o or {}
	setmetatable(o,observer)
	observer.__index = observer
	return o
end

function observer:onNotify(eventType,eventData)
	if eventType == EVENTTYPE.COME then
		print(tostring(self.name)..":观察者["..tostring(eventData).."]来了");
	elseif eventType ==EVENTTYPE.LEAVE then
		print(tostring(self.name)..":观察者["..tostring(eventData).."]走了");
	end
end

---------------------------
local thesubject = subject.new()
local observer1 = observer.new({name="lily"})
local observer2 = observer.new({name="lucy"})

thesubject:addObserver(observer1)
thesubject:addObserver(observer2)

thesubject:come()

thesubject:removeObserver(observer1)
thesubject:leave()


