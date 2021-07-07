> table mountain_member  ---

int mem_num  
String id  
String nickname  
String pass  
String name  
String address  
double addr_nw  
double addr_se  
String email  
String gender  
String fab_mt  

> table mountain_board  ---  

int num  
String id  
String subject  
String content  
int readcount  
int re_ref  
int re_lev  
int re_seq  
Timestamp reg_date  
int ip  
file img  

> ### [2.0 Timeline]  ===

> table mountain_timeline  ---  

file img  
String mt_name  
String id  
String content  
int like_count  
int re_ref  
int re_seq  

  
> table mountain_info  ---  

String mt_name  
int mt_height  
String mt_top  
String mt_course  
--file course img  
String mt_restaurant  
String mt_pt  
boolean mt_park  

