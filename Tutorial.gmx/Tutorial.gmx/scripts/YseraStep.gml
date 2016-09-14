image_speed = 0.25;

//设置人物朝向与动画
if(m_isAttacking == false && m_isInSkill == false ){
sprite_index = spr_ysera_idle;
   //移动
if(keyboard_check(ord('A')))
{
    phy_position_x = phy_position_x - 6;
    sprite_index = spr_ysera_walk_side;
    image_xscale = 1;
    m_PlayerDirection = PlayerDirection.LEFT;
}
if(keyboard_check(ord('D')))
{
    phy_position_x = phy_position_x + 6;
    sprite_index = spr_ysera_walk_side;    
    image_xscale = -1;
    m_PlayerDirection = PlayerDirection.RIGHT;
}
if(keyboard_check(ord('W')))
{
    phy_position_y = phy_position_y - 6;
    sprite_index = spr_ysera_walk_back; 
    m_PlayerDirection = PlayerDirection.UP;   
}
if(keyboard_check(ord('S')))
{
    phy_position_y = phy_position_y + 6;
    sprite_index = spr_ysera_walk_front;
    m_PlayerDirection = PlayerDirection.DOWN;
}
   //攻击
if(keyboard_check(ord('J'))){
   m_isAttacking = true;
   m_fired = false ;
   switch(m_PlayerDirection)
   {
   case PlayerDirection.UP:
      sprite_index = spr_ysera_attack_back;
      break;
   case PlayerDirection.DOWN:
      sprite_index = spr_ysera_attack_front;
      break;
   case PlayerDirection.LEFT:
      sprite_index =  spr_ysera_attack_side;
      break;
   case PlayerDirection.RIGHT:
      sprite_index = spr_ysera_attack_side;
      break;
   }
   image_index = 0;
}
   //技能
else if(keyboard_check(ord('K'))){
   m_isInSkill = true;
    m_fired = false ;
   sprite_index = spr_ysera_skill;
   image_index = 0;
}
}

//生成攻击子弹
if(sprite_index == spr_ysera_attack_front 
|| sprite_index == spr_ysera_attack_back
|| sprite_index == spr_ysera_attack_side)
{
   if(image_index > 2 && m_fired == false)
   {
      var magicBullet = instance_create(x,y,obj_ysera_magic_bullet);
      var deltaX = 0;
      var deltaY = 0;
      switch(m_PlayerDirection)
      {
         case PlayerDirection.UP:
            magicBullet.m_speedY = -10;
            magicBullet.image_angle = 270;
            deltaY = -89;
            break;
         case PlayerDirection.DOWN:
            magicBullet.m_speedY = 10;
            magicBullet.image_angle = 90;
            deltaY = 7;
            break;
         case PlayerDirection.LEFT:
            magicBullet.m_speedX = -10;
            deltaX = -65;
            deltaY = -33;
            break;
         case PlayerDirection.RIGHT:
            magicBullet.m_speedX = 10;
            magicBullet.image_angle = 180;
            deltaX = 65;
            deltaY = -33;
            break;               
      }
      magicBullet.phy_position_x += deltaX;
      magicBullet.phy_position_y += deltaY;
      m_fired = true ;
   }
}

if(sprite_index == spr_ysera_skill)
{
   if(image_index > 2 && m_fired == false)
   {
      instance_create(x,y,obj_ysera_skill_effect);
      m_fired = true ;
   }
}
