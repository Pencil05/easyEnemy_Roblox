local FollowDistance = 70
local mobi = script.Parent
local mobp = mobi.mob --set name of Humanoid to mob
local Damage = 10000000

function FindTarget()
	local MaxDistance = FollowDistance
	local Target = nil
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v:FindFirstChild("Humanoid") then
			if (v.HumanoidRootPart.Position-mobi.HumanoidRootPart.Position).magnitude < MaxDistance then
				Target = v.Head
			end
		end
	end
	return Target
end

while wait() do
	local plytar = FindTarget()
	if plytar then
		mobp:MoveTo(plytar.Position)
	end
end

mobi.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent.Humanoid:TakeDamage(Damage)
	end
end)
