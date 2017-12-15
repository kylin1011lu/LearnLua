--Command Pattern

function makeMoveUnitCommand(unit,x,y)
	local xBefore,yBefore
	return {
		execute = function( ... )
			xBefore = unit.x
			yBefore = unit.y
			unit:moveTo(x,y)
		end,
		undo = function( ... )
			unit:moveTo(xBefore,yBefore)
		end
	}
end


local unit = {x=1,y=1,moveTo=function (self, x,y ) 
	self.x=x
	self.y=y
end}

unit.new = function (o)
	o = o or {}
	o.x = 1
	o.y = 1
	setmetatable(o,unit)
	unit.__index = unit
	return o
end


local oneuinit = unit:new()
print("unit x,y:"..oneuinit.x..","..oneuinit.y)

local command = makeMoveUnitCommand(oneuinit,4,5)
command.execute()
print("after movecommand oneuinit x,y:"..oneuinit.x..","..oneuinit.y)

local unit2 = unit:new()
print("unit2 x,y:"..unit2.x..","..unit2.y)

command.undo()
print("movecommand undo oneuinit x,y:"..oneuinit.x..","..oneuinit.y)

