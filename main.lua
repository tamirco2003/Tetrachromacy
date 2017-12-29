-----------------
--Tetrachromacy--
-----------------

local Eye = RegisterMod("Eye", 1)

Eye.eyeItem = {
  id = Isaac.GetItemIdByName("Tetrachromacy"),
  fire = false,
  c = false,
  costume = Isaac.GetCostumeIdByPath("gfx/characters/EyeCostume.anm2"),
  has = false,
  knife = false,
  frame = 0,
  lud = false,
  ludframe = 0,
  brimlud = false,
  brimludframe = 0
}

function Eye:onUpdate()
  local player = Game():GetPlayer(0)
  local ent = Isaac.GetRoomEntities()

  if Game():GetFrameCount() == 1 then
    Eye.eyeItem.fire = false
    Eye.eyeItem.c = false
    Eye.eyeItem.has = false
    Eye.eyeItem.knife = false
    Eye.eyeItem.frame = 0
    Eye.eyeItem.lud = false
    Eye.eyeItem.ludframe = 0
    Eye.eyeItem.brimlud = false
    Eye.eyeItem.brimludframe = 0
  end

  if player:HasCollectible(Eye.eyeItem.id) then
    player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY)
    player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
    player:EvaluateItems()

    if Eye.eyeItem.has == false then
      player:AddNullCostume(Eye.eyeItem.costume)
      Eye.eyeItem.has = true
      Eye.eyeItem.knife = false
    end

    if Eye.eyeItem.fire == true and Eye.eyeItem.c == false then
      if player:HasWeaponType(WeaponType.WEAPON_TEARS) and player:HasCollectible(CollectibleType.COLLECTIBLE_TRACTOR_BEAM) == false then
        for i = 1, #ent do
          if ent[i].Type == EntityType.ENTITY_TEAR and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false then
            ent[i]:Remove()
          end
        end

        player:FireTear(player.Position, Vector(player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
        player:FireTear(player.Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
        player:FireTear(player.Position, Vector(0, player.ShotSpeed*10), false, true, false):GetData().delete = false
        player:FireTear(player.Position, Vector(-player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
        player:FireTear(player.Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
        player:FireTear(player.Position, Vector(0, -player.ShotSpeed*10), false, true, false):GetData().delete = false
        player:FireTear(player.Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
        player:FireTear(player.Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
        Eye.eyeItem.c = true

        if player:HasCollectible(CollectibleType.COLLECTIBLE_TECHNOLOGY_2) then
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, 0), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(0, player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, 0), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(0, -player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false

          if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, player.ShotSpeed*10+2), false, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 8), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -8), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 8), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -8), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, player.ShotSpeed*10+2), false, false):GetData().delete = false

            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, player.ShotSpeed*10+2), false, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 6.5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -6.5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 6.5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -6.5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false

            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 0), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 0), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          end
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 5), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -5), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 5), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -5), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 8), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(8, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -8), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-8, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 8), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(8, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -8), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-8, player.ShotSpeed*10+2), false, true, false):GetData().delete = false

          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(2, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-2, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(2, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-2, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 6.5), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(6.5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -6.5), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-6.5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 6.5), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(6.5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -6.5), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-6.5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false

          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 0), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(0, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 0), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(0, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
        end
      end

      if player:HasWeaponType(WeaponType.WEAPON_TEARS) and player:HasCollectible(CollectibleType.COLLECTIBLE_TRACTOR_BEAM) then
        for i = 1, #ent do
          if ent[i].Type == EntityType.ENTITY_TEAR and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false then
            ent[i]:Remove()
          end
        end

        player:FireTear(player.Position, Vector(player.ShotSpeed*10, 0), false, false, false):GetData().delete = false
        player:FireTear(player.Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, false, false):GetData().delete = false
        player:FireTear(player.Position, Vector(0, player.ShotSpeed*10), false, false, false):GetData().delete = false
        player:FireTear(player.Position, Vector(-player.ShotSpeed*10, 0), false, false, false):GetData().delete = false
        player:FireTear(player.Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, false, false):GetData().delete = false
        player:FireTear(player.Position, Vector(0, -player.ShotSpeed*10), false, false, false):GetData().delete = false
        player:FireTear(player.Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, false, false):GetData().delete = false
        player:FireTear(player.Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, false, false):GetData().delete = false
        Eye.eyeItem.c = true

        if player:HasCollectible(CollectibleType.COLLECTIBLE_TECHNOLOGY_2) then
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, 0), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(0, player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, 0), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(0, -player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false

          if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, player.ShotSpeed*10+2), false, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 8), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -8), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 8), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -8), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, player.ShotSpeed*10+2), false, false):GetData().delete = false

            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, player.ShotSpeed*10+2), false, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 6.5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -6.5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 6.5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -6.5), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false

            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 0), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, player.ShotSpeed*10+2), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 0), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          end
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 5), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(5, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -5), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-5, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 5), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(5, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -5), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-5, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 8), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(8, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -8), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-8, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 8), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(8, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -8), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-8, player.ShotSpeed*10+2), false, false, false):GetData().delete = false

          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(2, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-2, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(2, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-2, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 6.5), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(6.5, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -6.5), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-6.5, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 6.5), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(6.5, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -6.5), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-6.5, player.ShotSpeed*10+2), false, false, false):GetData().delete = false

          player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 0), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(0, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 0), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(0, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
        end
      end


      if player:HasWeaponType(WeaponType.WEAPON_LASER) then
        for i = 1, #ent do
          if ent[i].Type == EntityType.ENTITY_LASER and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false then
            ent[i]:Remove()
          end
        end

        player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10, 0), false, false):GetData().delete = false
        player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
        player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, player.ShotSpeed*10), false, false):GetData().delete = false
        player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10, 0), false, false):GetData().delete = false
        player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false
        player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, -player.ShotSpeed*10), false, false):GetData().delete = false
        player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
        player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false
        Eye.eyeItem.c = true

        if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 5), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, player.ShotSpeed*10+2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -5), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 5), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -5), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, player.ShotSpeed*10+2), false, false):GetData().delete = false
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 8), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, player.ShotSpeed*10+2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -8), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 8), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -8), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, player.ShotSpeed*10+2), false, false):GetData().delete = false

          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, player.ShotSpeed*10+2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, player.ShotSpeed*10+2), false, false):GetData().delete = false
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 6.5), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -6.5), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 6.5), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -6.5), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false

          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 0), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, player.ShotSpeed*10+2), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 0), false, false):GetData().delete = false
          player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, -player.ShotSpeed*10-2), false, false):GetData().delete = false
        end
      end

      if player:HasWeaponType(WeaponType.WEAPON_BOMBS) then
        for i = 1, #ent do
          if ent[i].Type == EntityType.ENTITY_BOMBDROP and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false then
            ent[i]:Remove()
          end
        end

        player:FireBomb(player.Position, Vector(player.ShotSpeed*10, 0)):GetData().delete = false
        player:FireBomb(player.Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10)):GetData().delete = false
        player:FireBomb(player.Position, Vector(0, player.ShotSpeed*10)):GetData().delete = false
        player:FireBomb(player.Position, Vector(-player.ShotSpeed*10, 0)):GetData().delete = false
        player:FireBomb(player.Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10)):GetData().delete = false
        player:FireBomb(player.Position, Vector(0, -player.ShotSpeed*10)):GetData().delete = false
        player:FireBomb(player.Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10)):GetData().delete = false
        player:FireBomb(player.Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10)):GetData().delete = false
        Eye.eyeItem.c = true

        if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
          player:FireBomb(player.Position, Vector(player.ShotSpeed*10+2, 5)):GetData().delete = false
          player:FireBomb(player.Position, Vector(5, player.ShotSpeed*10+2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-player.ShotSpeed*10-2, -5)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-5, -player.ShotSpeed*10-2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-player.ShotSpeed*10-2, 5)):GetData().delete = false
          player:FireBomb(player.Position, Vector(5, -player.ShotSpeed*10-2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(player.ShotSpeed*10+2, -5)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-5, player.ShotSpeed*10+2)):GetData().delete = false
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
          player:FireBomb(player.Position, Vector(player.ShotSpeed*10+2, 8)):GetData().delete = false
          player:FireBomb(player.Position, Vector(8, player.ShotSpeed*10+2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-player.ShotSpeed*10-2, -8)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-8, -player.ShotSpeed*10-2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-player.ShotSpeed*10-2, 8)):GetData().delete = false
          player:FireBomb(player.Position, Vector(8, -player.ShotSpeed*10-2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(player.ShotSpeed*10+2, -8)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-8, player.ShotSpeed*10+2)):GetData().delete = false

          player:FireBomb(player.Position, Vector(player.ShotSpeed*10+2, 2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(2, player.ShotSpeed*10+2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-player.ShotSpeed*10-2, -2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-2, -player.ShotSpeed*10-2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-player.ShotSpeed*10-2, 2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(2, -player.ShotSpeed*10-2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(player.ShotSpeed*10+2, -2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-2, player.ShotSpeed*10+2)):GetData().delete = false
        end

        if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
          player:FireBomb(player.Position, Vector(player.ShotSpeed*10+2, 6.5)):GetData().delete = false
          player:FireBomb(player.Position, Vector(6.5, player.ShotSpeed*10+2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-player.ShotSpeed*10-2, -6.5)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-6.5, -player.ShotSpeed*10-2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-player.ShotSpeed*10-2, 6.5)):GetData().delete = false
          player:FireBomb(player.Position, Vector(6.5, -player.ShotSpeed*10-2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(player.ShotSpeed*10+2, -6.5)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-6.5, player.ShotSpeed*10+2)):GetData().delete = false

          player:FireBomb(player.Position, Vector(player.ShotSpeed*10+2, 0)):GetData().delete = false
          player:FireBomb(player.Position, Vector(0, player.ShotSpeed*10+2)):GetData().delete = false
          player:FireBomb(player.Position, Vector(-player.ShotSpeed*10-2, 0)):GetData().delete = false
          player:FireBomb(player.Position, Vector(0, -player.ShotSpeed*10-2)):GetData().delete = false
        end
      end

      if player:HasWeaponType(WeaponType.WEAPON_TECH_X) then
        for i = 1, #ent do
          if (ent[i].Type == 7 and ent[i].Variant == 2 and ent[i].SubType == 2 and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false)
          or (ent[i].Type == 7 and ent[i].Variant == 1 and ent[i].SubType == 2 and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false) then
            enty = ent[i]:ToLaser()
            radiusk = enty.Radius
            ent[i]:Remove()
          end
        end
        if radiusk ~= nil then
          player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10, 0), radiusk):GetData().delete = false
          player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10), radiusk):GetData().delete = false
          player:FireTechXLaser(player.Position, Vector(0, player.ShotSpeed*10), radiusk):GetData().delete = false
          player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10, 0), radiusk):GetData().delete = false
          player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), radiusk):GetData().delete = false
          player:FireTechXLaser(player.Position, Vector(0, -player.ShotSpeed*10), radiusk):GetData().delete = false
          player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), radiusk):GetData().delete = false
          player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), radiusk):GetData().delete = false
          Eye.eyeItem.c = true

          if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
            player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10+2, 5), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(5, player.ShotSpeed*10+2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10-2, -5), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-5, -player.ShotSpeed*10-2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10-2, 5), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(5, -player.ShotSpeed*10-2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10+2, -5), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-5, player.ShotSpeed*10+2), radiusk):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
            player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10+2, 8), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(8, player.ShotSpeed*10+2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10-2, -8), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-8, -player.ShotSpeed*10-2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10-2, 8), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(8, -player.ShotSpeed*10-2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10+2, -8), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-8, player.ShotSpeed*10+2), radiusk):GetData().delete = false

            player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10+2, 2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(2, player.ShotSpeed*10+2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10-2, -2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-2, -player.ShotSpeed*10-2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10-2, 2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(2, -player.ShotSpeed*10-2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10+2, -2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-2, player.ShotSpeed*10+2), radiusk):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
            player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10+2, 6.5), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(6.5, player.ShotSpeed*10+2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10-2, -6.5), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-6.5, -player.ShotSpeed*10-2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10-2, 6.5), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(6.5, -player.ShotSpeed*10-2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10+2, -6.5), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-6.5, player.ShotSpeed*10+2), radiusk):GetData().delete = false

            player:FireTechXLaser(player.Position, Vector(player.ShotSpeed*10+2, 0), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(0, player.ShotSpeed*10+2), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(-player.ShotSpeed*10-2, 0), radiusk):GetData().delete = false
            player:FireTechXLaser(player.Position, Vector(0, -player.ShotSpeed*10-2), radiusk):GetData().delete = false
          end
        end
      end
    end

    if player:HasWeaponType(WeaponType.WEAPON_ROCKETS) then
      for i = 1, #ent do
        if ent[i].Type == EntityType.ENTITY_EFFECT and ent[i].Variant == EffectVariant.ROCKET and ent[i].FrameCount % 9 == 0 and ent[i].FrameCount ~= 0 and ent[i]:GetData().delete ~= false then
          player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(0, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(0, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          Eye.eyeItem.c = true
        end
      end
    end


    if player:HasWeaponType(WeaponType.WEAPON_MONSTROS_LUNGS) and player:HasCollectible(CollectibleType.COLLECTIBLE_TRACTOR_BEAM) == false then
      for i = 1, #ent do
        if ent[i].Type == EntityType.ENTITY_TEAR and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false then
          ent[i]:GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(0, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(0, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          Eye.eyeItem.c = true

          if player:HasCollectible(CollectibleType.COLLECTIBLE_TECHNOLOGY_2) then
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, 0), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(0, player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, 0), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(0, -player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false

            if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, player.ShotSpeed*10+2), false, false):GetData().delete = false
            end

            if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 8), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -8), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 8), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -8), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, player.ShotSpeed*10+2), false, false):GetData().delete = false

              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, player.ShotSpeed*10+2), false, false):GetData().delete = false
            end

            if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 6.5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -6.5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 6.5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -6.5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false

              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 0), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 0), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            end
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 5), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -5), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 5), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -5), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 8), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(8, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -8), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-8, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 8), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(8, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -8), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-8, player.ShotSpeed*10+2), false, true, false):GetData().delete = false

            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(2, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-2, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(2, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-2, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 6.5), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(6.5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -6.5), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-6.5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 6.5), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(6.5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -6.5), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-6.5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false

            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 0), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(0, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 0), false, true, false):GetData().delete = false
            player:FireTear(player.Position, Vector(0, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          end
        end
      end
    end

    if player:HasWeaponType(WeaponType.WEAPON_MONSTROS_LUNGS) and player:HasCollectible(CollectibleType.COLLECTIBLE_TRACTOR_BEAM) then
      for i = 1, #ent do
        if ent[i].Type == EntityType.ENTITY_TEAR and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false then
          ent[i]:GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10, 0), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(0, player.ShotSpeed*10), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10, 0), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(0, -player.ShotSpeed*10), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, false, false):GetData().delete = false
          player:FireTear(player.Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, false, false):GetData().delete = false
          Eye.eyeItem.c = true

          if player:HasCollectible(CollectibleType.COLLECTIBLE_TECHNOLOGY_2) then
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, 0), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(0, player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, 0), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(0, -player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, false):GetData().delete = false
            player:FireTechLaser(player.Position, LaserOffset.LASER_TECH2_OFFSET, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, false):GetData().delete = false

            if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-5, player.ShotSpeed*10+2), false, false):GetData().delete = false
            end

            if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 8), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -8), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 8), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(8, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -8), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-8, player.ShotSpeed*10+2), false, false):GetData().delete = false

              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(2, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-2, player.ShotSpeed*10+2), false, false):GetData().delete = false
            end

            if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 6.5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, -6.5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 6.5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(6.5, -player.ShotSpeed*10-2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, -6.5), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-6.5, player.ShotSpeed*10+2), false, false):GetData().delete = false

              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(player.ShotSpeed*10+2, 0), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, player.ShotSpeed*10+2), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(-player.ShotSpeed*10-2, 0), false, false):GetData().delete = false
              player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, Vector(0, -player.ShotSpeed*10-2), false, false):GetData().delete = false
            end
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 5), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(5, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -5), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-5, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 5), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(5, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -5), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-5, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 8), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(8, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -8), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-8, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 8), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(8, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -8), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-8, player.ShotSpeed*10+2), false, false, false):GetData().delete = false

            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(2, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-2, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(2, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-2, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 6.5), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(6.5, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, -6.5), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-6.5, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 6.5), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(6.5, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, -6.5), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-6.5, player.ShotSpeed*10+2), false, false, false):GetData().delete = false

            player:FireTear(player.Position, Vector(player.ShotSpeed*10+2, 0), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(0, player.ShotSpeed*10+2), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(-player.ShotSpeed*10-2, 0), false, false, false):GetData().delete = false
            player:FireTear(player.Position, Vector(0, -player.ShotSpeed*10-2), false, false, false):GetData().delete = false
          end
        end
      end
    end

    if player:HasWeaponType(WeaponType.WEAPON_BRIMSTONE) and player:HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE) == false then
      for i = 1, #ent do
        if ent[i].Type == EntityType.ENTITY_LASER and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i].Parent.Type == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false then
          ent[i]:Remove()
          player:FireBrimstone(Vector(player.ShotSpeed*10, 0)):GetData().delete = false
          player:FireBrimstone(Vector(player.ShotSpeed*10, player.ShotSpeed*10)):GetData().delete = false
          player:FireBrimstone(Vector(0, player.ShotSpeed*10)):GetData().delete = false
          player:FireBrimstone(Vector(-player.ShotSpeed*10, 0)):GetData().delete = false
          player:FireBrimstone(Vector(-player.ShotSpeed*10, -player.ShotSpeed*10)):GetData().delete = false
          player:FireBrimstone(Vector(0, -player.ShotSpeed*10)):GetData().delete = false
          player:FireBrimstone(Vector(-player.ShotSpeed*10, player.ShotSpeed*10)):GetData().delete = false
          player:FireBrimstone(Vector(player.ShotSpeed*10, -player.ShotSpeed*10)):GetData().delete = false
          -- Eye.eyeItem.c = true

          if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
            player:FireBrimstone(Vector(player.ShotSpeed*10+2, 5)):GetData().delete = false
            player:FireBrimstone(Vector(5, player.ShotSpeed*10+2)):GetData().delete = false
            player:FireBrimstone(Vector(-player.ShotSpeed*10-2, -5)):GetData().delete = false
            player:FireBrimstone(Vector(-5, -player.ShotSpeed*10-2)):GetData().delete = false
            player:FireBrimstone(Vector(-player.ShotSpeed*10-2, 5)):GetData().delete = false
            player:FireBrimstone(Vector(5, -player.ShotSpeed*10-2)):GetData().delete = false
            player:FireBrimstone(Vector(player.ShotSpeed*10+2, -5)):GetData().delete = false
            player:FireBrimstone(Vector(-5, player.ShotSpeed*10+2)):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
            player:FireBrimstone(Vector(player.ShotSpeed*10+2, 8)):GetData().delete = false
            player:FireBrimstone(Vector(8, player.ShotSpeed*10+2)):GetData().delete = false
            player:FireBrimstone(Vector(-player.ShotSpeed*10-2, -8)):GetData().delete = false
            player:FireBrimstone(Vector(-8, -player.ShotSpeed*10-2)):GetData().delete = false
            player:FireBrimstone(Vector(-player.ShotSpeed*10-2, 8)):GetData().delete = false
            player:FireBrimstone(Vector(8, -player.ShotSpeed*10-2)):GetData().delete = false
            player:FireBrimstone(Vector(player.ShotSpeed*10+2, -8)):GetData().delete = false
            player:FireBrimstone(Vector(-8, player.ShotSpeed*10+2)):GetData().delete = false

            player:FireBrimstone(Vector(player.ShotSpeed*10+2, 2)):GetData().delete = false
            player:FireBrimstone(Vector(2, player.ShotSpeed*10+2)):GetData().delete = false
            player:FireBrimstone(Vector(-player.ShotSpeed*10-2, -2)):GetData().delete = false
            player:FireBrimstone(Vector(-2, -player.ShotSpeed*10-2)):GetData().delete = false
            player:FireBrimstone(Vector(-player.ShotSpeed*10-2, 2)):GetData().delete = false
            player:FireBrimstone(Vector(2, -player.ShotSpeed*10-2)):GetData().delete = false
            player:FireBrimstone(Vector(player.ShotSpeed*10+2, -2)):GetData().delete = false
            player:FireBrimstone(Vector(-2, player.ShotSpeed*10+2)):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
            player:FireBrimstone(Vector(player.ShotSpeed*10+2, 6.5)):GetData().delete = false
            player:FireBrimstone(Vector(6.5, player.ShotSpeed*10+2)):GetData().delete = false
            player:FireBrimstone(Vector(-player.ShotSpeed*10-2, -6.5)):GetData().delete = false
            player:FireBrimstone(Vector(-6.5, -player.ShotSpeed*10-2)):GetData().delete = false
            player:FireBrimstone(Vector(-player.ShotSpeed*10-2, 6.5)):GetData().delete = false
            player:FireBrimstone(Vector(6.5, -player.ShotSpeed*10-2)):GetData().delete = false
            player:FireBrimstone(Vector(player.ShotSpeed*10+2, -6.5)):GetData().delete = false
            player:FireBrimstone(Vector(-6.5, player.ShotSpeed*10+2)):GetData().delete = false

            player:FireBrimstone(Vector(player.ShotSpeed*10+2, 0)):GetData().delete = false
            player:FireBrimstone(Vector(0, player.ShotSpeed*10+2)):GetData().delete = false
            player:FireBrimstone(Vector(-player.ShotSpeed*10-2, 0)):GetData().delete = false
            player:FireBrimstone(Vector(0, -player.ShotSpeed*10-2)):GetData().delete = false
          end
        end
      end
    end

    if player:HasWeaponType(WeaponType.WEAPON_BRIMSTONE) and player:HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE) then
      for i = 1, #ent do
        if Game():GetFrameCount() > Eye.eyeItem.brimludframe + player.MaxFireDelay then
          Eye.eyeItem.brimlud = false
        end
        if ent[i].Type == EntityType.ENTITY_LASER and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false and Eye.eyeItem.brimlud == false then
          -- ent[i]:Remove()
          player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(0, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(0, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          Eye.eyeItem.brimlud = true
          Eye.eyeItem.brimludframe = Game():GetFrameCount()

          if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, -5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, -5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 8), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(8, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, -8), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-8, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 8), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(8, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, -8), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-8, player.ShotSpeed*10+2), false, true, false):GetData().delete = false

            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(2, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, -2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-2, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(2, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, -2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-2, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 6.5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(6.5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, -6.5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-6.5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 6.5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(6.5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, -6.5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-6.5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false

            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 0), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(0, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 0), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(0, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          end
        end
      end
    end

    if player:HasWeaponType(WeaponType.WEAPON_KNIFE) then
      for i = 1, #ent do
        if ent[i].Type == EntityType.ENTITY_KNIFE then
          knife = ent[i]:ToKnife()
          if knife:IsFlying() == false and Game():GetFrameCount() > Eye.eyeItem.frame + player.MaxFireDelay then
            Eye.eyeItem.knife = false
          end
          if knife:IsFlying() == true and Eye.eyeItem.knife == false then
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(0, player.ShotSpeed*10), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(0, -player.ShotSpeed*10), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
            Eye.eyeItem.knife = true
            Eye.eyeItem.frame = Game():GetFrameCount()
          end
        end
      end
    end


    if player:HasWeaponType(WeaponType.WEAPON_LUDOVICO_TECHNIQUE) then
      for i = 1, #ent do
        if Game():GetFrameCount() > Eye.eyeItem.ludframe + player.MaxFireDelay then
          Eye.eyeItem.lud = false
        end
        if ent[i].Type == EntityType.ENTITY_TEAR and ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete ~= false and Eye.eyeItem.lud == false then
          player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(0, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, 0), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(0, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10, player.ShotSpeed*10), false, true, false):GetData().delete = false
          player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10, -player.ShotSpeed*10), false, true, false):GetData().delete = false
          Eye.eyeItem.lud = true
          Eye.eyeItem.ludframe = Game():GetFrameCount()

          if player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, -5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, -5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 8), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(8, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, -8), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-8, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 8), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(8, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, -8), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-8, player.ShotSpeed*10+2), false, true, false):GetData().delete = false

            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(2, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, -2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-2, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(2, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, -2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-2, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
          end

          if player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 6.5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(6.5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, -6.5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-6.5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 6.5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(6.5, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, -6.5), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-6.5, player.ShotSpeed*10+2), false, true, false):GetData().delete = false

            player:FireTear(ent[i].Position, Vector(player.ShotSpeed*10+2, 0), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(0, player.ShotSpeed*10+2), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(-player.ShotSpeed*10-2, 0), false, true, false):GetData().delete = false
            player:FireTear(ent[i].Position, Vector(0, -player.ShotSpeed*10-2), false, true, false):GetData().delete = false
          end
        end
      end
    end

    for i = 1, #ent do
      if ent[i].SpawnerType == EntityType.ENTITY_PLAYER and ent[i]:GetData().delete == false then
        local ro = math.random(0, 255)
        local go = math.random(0, 255)
        local bo = math.random(0, 255)
        ent[i].Color = Color(1, 1, 1, 1, ro, go, bo)
      end
    end
  end
end

Eye:AddCallback(ModCallbacks.MC_POST_UPDATE, Eye.onUpdate)

function Eye:OnRender()
  local player = Game():GetPlayer(0)
  if player.FireDelay == player.MaxFireDelay then
    Eye.eyeItem.fire = true
    Eye.eyeItem.c = false
  end
  if player.FireDelay == 0 then
    Eye.eyeItem.fire = false
  end
end

Eye:AddCallback(ModCallbacks.MC_POST_RENDER, Eye.OnRender)

function Eye:cache(player, cacheflag)
  if player:HasCollectible(Eye.eyeItem.id) then
    if cacheflag == CacheFlag.CACHE_FIREDELAY then
      player.MaxFireDelay = player.MaxFireDelay + 20
    end
    if cacheflag == CacheFlag.CACHE_FIREDELAY and player:HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) then
      player.MaxFireDelay = player.MaxFireDelay - 15
    end
    -- if cacheflag == CacheFlag.CACHE_DAMAGE and player:HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) then
    --   player.Damage = player.Damage * 0.5
    -- end
    -- if cacheflag == CacheFlag.CACHE_DAMAGE and player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
    --   player.Damage = player.Damage * 0.82
    -- end
    -- if cacheflag == CacheFlag.CACHE_DAMAGE and player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
    --   player.Damage = player.Damage * 0.6
    -- end
    -- if cacheflag == CacheFlag.CACHE_DAMAGE and player:HasCollectible(CollectibleType.COLLECTIBLE_INNER_EYE) then
    --   player.Damage = player.Damage * 0.71
    -- end
    -- if cacheflag == CacheFlag.CACHE_DAMAGE and player:HasCollectible(CollectibleType.COLLECTIBLE_MONSTROS_LUNG) then
    --   player.Damage = player.Damage * 0.71
    -- end
  end
end

Eye:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Eye.cache)
