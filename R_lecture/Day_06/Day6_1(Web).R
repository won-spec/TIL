#2주차
#Web 크롤링, 스크랩핑
#외부 API를 이용한 데이터 구축(JSON)
#컴퓨터에서 데이터 통신을 하려면? => 랜카드(NIC) : Network Interface Card
#여러개의 컴퓨터를 이렇게 NIC를 통해서 연결한 후 네트워크망을 생성할 수
#있다.
#LAN ( Local Area Network )
#LAN of LAN / 네트워크의 네트워크 => 인터넷 (물리적인 framework)
#이 위에 여러가지 서비스를 지정해서 사용하고 있어요
#=>파일을 전송하기 위한 서비스 : FTP
#=>메일을 주고받기 위한 서비스 : SMTP
#=>특정 내용을 게시하고 클라이언트가 볼 수 있도록 하는 서비스 : HTTP
# HTTPS : secure보안이 추가된 HTTP 서비스
#프로토콜? => 데이터를 주고받기 위해서 존재하는 약속, 규칙
#언어또한 하나의 프로토콜 

#########################################################################

#Web Service는 기본적으로 CS(Client-Server)구조를 가진다.
#Web 시스템을 구축하기 위해
#1. Web Server Program (Tomcat)을 다운받자. tomcat 7, 64비트
#2. 클라이언트에게 제공할 HTML, CSS, Javascript, 서버쪽 프로그램을 
#   작성하기 위해서 IDE(개발툴, 개발환경)가 필요
#   Eclipse를 다운로드 => Java개발툴 / enterprise edition

#서버쪽 프로그램을 통해서 프로젝트를  deploy한 후클라이언트는 다음과 같이 접속 / tomcat의 port번호 : 8080
# URL : http:// IP주소 : port번호/프로젝트루트/파일명 
#ex) http://60.162.125.23:8080/testabc/test.html
#ex) http://localhost:8080/testabc/test.html => 현재컴퓨터내에서 찾아라

#웹스톰에서 프로젝트를 만들고, 파일을 만들고
#=>웹 서버가 있어야함(tomcat)같은역할.
#웹 스톰의 port번호는  63342
#=>자동으로 configure시켜서 웹에 게시함. 클라이언트 browser열어서 접속까지 실행