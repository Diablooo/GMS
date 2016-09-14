if(m_isAttacking && sprite_index == spr_ysera_attack_front 
  || sprite_index == spr_ysera_attack_back
  || sprite_index == spr_ysera_attack_side)
  {
     m_isAttacking = false ;  
  }
  
if(m_isInSkill && sprite_index == spr_ysera_skill)
{
   m_isInSkill = false ;
}
