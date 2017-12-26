--Prototype Pattern

--方法和属性独立 方法放在原型中  属性对象持有
local Prototype = {}
Prototype.__index = Prototype

function Prototype.move(self)
	print(self.x)
end

local target = {x=10}
setmetatable(target,Prototype)

target.move(target)




