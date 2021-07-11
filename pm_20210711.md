####  07-10 ~ 07-11

insertpro 완료
1. kakao API로 우편번호 검색 => input "address"에 입력
2. "address"값으로 kakao maps API method "geocorder()" 실행했지만 '지번주소등'의 확실한 주소 아닐시 실패확인
3. 성공시에 hidden type의 input에 value로 반환후 submit했지만 번번히 실패.
4. 원인을 찾을수 없어 gps좌표만 빼고 inserform.jsp, insertpro 진행 , dao파일에서 db연결 에러 발생
5. mysql connect db를 찾을 수 없는 메시지 
* mysql connect 확인
  * collections - jar 파일 확인 
  * dbcp - jar 파일 확인
  * pool - jar 파일 확인
  * META-INF - context.xml => resource name="A"과 DAO파일 initcontext.lookup 일치하지 않음 확인 => 일치시킨후 연동확인
6. mysql 주소 column 한글만 ??? 뭂음표 표시 확인

* mysql characterSet utf8로 변경
  * 확인 방법
    * cmd => mysql -root -p => pw입력 =>status
    * latin1 => utf8로 변경 확인 해야함(시간 좀걸렷음)

7. mysql characterSet utf8로 변경이후에도 ??? 현상 지속
* 임시방편으로 database 와 table만 utf8로 변경
<pre><code>
alter database mountain default character set utf8;

alter table mountain_board convert to character set utf8;

alter table mountain_member convert to character set utf8;
</code></pre>

8. 10번째 column reg_date null값 지속확인
* pro에서는 정확하게 들어가는데 DAO에서 추가안했음(변경당시 일괄 수정해야하는데 안함.

9. 초기 설계가 중요하다는것을 많이 느낌
* 진행필수사항 : 게시판(X) / 회원가입(O) / 회원정보수정 / 회원탈퇴 
* 진행옵션사항 : 지도(50%) / 타임라인(x)
---
중간과정들을 한번 되짚어보며 글써봄 회원정보수정,탈퇴는 설정이 다 되어있어 수정하여 금방 끝날것으로 예상됨.
게시판과 지도 타임라인이 오래걸릴것 같고 기능만 끝나는 대로 
블로그 정비 해서 블로그에 글 올릴것.

10. 배우고 배운것을 정리하며 손에 익는 작업들이 중요하다는 것을 느낌.

오늘은 
