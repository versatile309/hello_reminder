enum HelloAction {
  call('전화'),
  message('문자'),
  katalk('카카오톡');

  const HelloAction(this.displayName);    
  final String displayName;  
}
