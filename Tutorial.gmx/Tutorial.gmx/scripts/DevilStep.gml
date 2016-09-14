image_speed = 0.25;

//设置人物朝向与动画
if(m_isAttacking == false && m_isInSkill == false )
{
   var player = instance_find(obj_ysera,0);
   var deltaX = player.x - x;
   var deltaY = player.y - y;
   var mySpeed = 2;
   // X方向AI 
   if(deltaX > mySpeed){
      phy_position_x += mySpeed;
   }
   else if(deltaX < -mySpeed){
      phy_position_x -= mySpeed;
   }
   else {
      phy_position_x += deltaX ;
   }
   // Y方向AI
   if(deltaY > mySpeed){
      phy_position_y += mySpeed;
   }   
   else if(deltaY < -mySpeed){
      phy_position_y -= mySpeed;
   }
   else {
      phy_position_y += deltaY ;
   }
   // 设置方向与动画
   if(deltaX > 0){
      image_xscale = -1;
   }
   else if(deltaX < 0){
      image_xscale = 1 ;
   }
   sprite_index = spr_devil_walk ;
}
   
