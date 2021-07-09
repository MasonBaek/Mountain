### [Project Mountain]
등산인들을 위한 정보, 편의제공 
정보를 공유 할수있도록
* 산정보<br>
 1. 코스정보<br>
    - 코스별 소요시간(공유기능)<br>
    
 2. 산주변정보
    - 하산후 식사정보 `E-커머스`
    - 산별 주차장 및 대중교통 
<br>
3. 산 안전정보
  ` 산림청, 119, 저체온증, 고립(낙오)시 대처사항등
<br>
<br>
## [V2.0]

- 산 마다 사진 정보 (GPS 기반) <br>
- 계절별 사진정보 열람<br>

요일별 산악회<br>
산, 산악회별 타임라인<br>
<br>

### [BM]
E-커머스<br>
등산 및 안전 제품 광고 <br>
쇼핑몰(3.0)

---
# **_DB_**

> table mountain_member  

int num  
String id  
<s>String nickname</s>  
String pass  
String email  
String address  
double addr_sw  
double addr_ne  
String gender  
String fab_mt  
String Timestamp reg_date  


> table mountain_board  

int board_num  
String id  
String subject  
String content  
int readcount  
int re_ref  
int re_lev  
int re_seq  
Timestamp write_date  
int ip  
String file    

> ### [2.0 Timeline]  ===

> table mountain_timeline  

file img  
String mt_name  
String id  
String content  
int like_count  
int re_ref  
int re_seq  

  
> table mountain_info  

String mt_name  
int mt_height  
String mt_top  
String mt_course  
--file course img  
String mt_restaurant  
String mt_pt  
boolean mt_park  

