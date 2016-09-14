m_isAttacking = false;
m_isInSkill   = false;
m_fired       = false;


phy_fixed_rotation = 1; //人物固定转动；
m_attachedHitbox = instance_create(x,y,obj_hitbox);
m_attachedHitbox.m_attachedParent = id;



