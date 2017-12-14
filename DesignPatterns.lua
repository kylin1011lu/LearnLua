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

print("unit x,y:"..unit.x..","..unit.y)

local command = makeMoveUnitCommand(unit,4,5)
command.execute()
print("after movecommand unit x,y:"..unit.x..","..unit.y)

command.undo()
print("movecommand undo unit x,y:"..unit.x..","..unit.y)

