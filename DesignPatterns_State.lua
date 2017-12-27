--State Pattern


--有限状态机 用枚举来表示状态

local STATE =
{
	IDLE=1,
	WALK=2,
	RUN=3,
	JUMP=4,
}

local man = {
speed = 1,
state = STATE.IDLE}
man.move = function(self)
	if speed >1 then
		self.state = STATE.WALK
		--do walk
	elseif speed > 2 then
		self.state = STATE.RUN
		--do run
	end
end



--状态模式 每个状态定义一个类

local State = {}
State.__index = State

local IdleState  ={}
setmetatable(IdleState,State)
IdleState.handle = function(target)
	if target.speed > 1 then
		return WalkState
	end
end

local WalkState  ={}
setmetatable(WalkState,State)
WalkState.handle = function(target)
	if target.speed <= 1 then
		return IdleState
	end
end

local man = {state = IdleState}

man.handle = function(self)
	local newstate = self.state:handle(self)
end


--并发状态机 角色同时只有多个状态
--层级状态机 状态不是独立关系，而是继承关系
--下推自动机 用栈来保存状态，push pop来切换状态 从而实现状态的历史记录

