# assignment20203191
assignment_20203191

 ## **sed, awk**
  + ### sed - 스트림 편집기 (*하나의 입력이 하나의 출력을 냄*)
    1)찾기(serch), 출력(print) 
      + sed -n '/abd/p' list.txt - list.txt 파일을 한줄씩 읽으면서(-n: 읽은 것을 출력하지 않음) abd 문자를 찾으면 그 줄을 출력(p)


    2)치환(substitute)
      + sed 's/addrass/adrass/' list.txt - addrass를 adress로 바꿔준다. 단 원본파일을 바꾸지 않고 출력을 바꿔서 함
      + sed 's/addrass/address/' list.txt > list2.txt 
      + sed 's/\t/\ /' list.txt - 탭문자를 엔터로 변환
      + sed 's/□□*/□/' list.txt : ( *표시: □ 는 공백 문자를 표시한다. ) 위의 구문은 한개이상의 공백문자열을 하나의 공백으로 바꾼다.
     
     
    3)삭제(delete)
      + sed '/TD/d' 1.html - TD 문자가 포함된 줄을 삭제하여 출력한다.
      + sed '/Src/!d' 1.html - Src 문자가 있는 줄만 지우지 않는다.
      + sed '1,2d' 1.html - 처음 1줄, 2줄을 지운다.
      + sed '/^$/d 1.html - 공백라인을 삭제하는 명령이다
     
     
     *-n옵션*
     - 한파일로부터 몇개의 라인들을 추출해 내기 위해 sed를 사용할떄



  + ### awk - 대화형 편집기  (*입력및 출력이 하나로 이루어짐*)
    + awk '/west/' datafile - west 라는 글이 있는 줄 출력
    + awk '/^north/' datafile - north로 시작하는 줄 출력
    + awk '/^(no | so)/' datafile - no 또는 so 로 시작하는 줄 출력
    + awk '{ print $3, $2 }' datafile - datafile 리스트의 세 번째 와 두 번째 필드를 스페이스로 띄어서 출력
    + awk '{ print $3 $2 }' datafile - datafile 리스트의 세 번째 와 두 번째 필드를 그냥 붙여서 출력
    + awk '{ print "Number of fields - " NF} ' datafile : datafile의 각 줄마다의 필드수를 리턴한다.
    + awk '$5 ~ /\.[7-9]+/' datafile - 다섯 번째 필드가 마침표 다음엣 7과 9사이 숫자가 하나 이상 나오는 레코드 출력
    + awk '$2 !~ /E/ { print $1, $2 }' datafile - 두 번째 필드에 E 패턴이 없는 레코드의 첫 번째와 두 번째 필드 출력
    + awk '$3 ~ /^Joel/{ print $3 " is a nice guy."} ' datafile - 세 번째 필드가 Joel로 시작하면 " is a nice guy"와 함께 출력
    + awk '$8 ~ /[0-9][0-9]$/ { print $8 }' datafile - 여덟 번째 필드가 두 개의 숫자이면 그 필드가 출력
    + awk '$4 ~ /Chin$/ { print "The price is $" $8 "." }' datafile - 네 번째 필드가 Chine으로 끝나면 "The price is $" 8번 필드 및 마침표가 출력
    + awk -F: '{ print $1 } ' datafile - -F 옵션은 입력 필드를 ':'로 구별.
    + awk -F"[ :]" '{ print $1, $2 } ' datafile : 입력 필드로 스페이스와 '-'를 필드 구별자로 사용
    + awk -f awk_script.file datafile - -f 옵션은 awk 스크립트 파일 사용할 때 씀.
    + awk '$7 == 5' datafile - 7번 필드가 5와 같다면 출력
    + awk '$2 == "CT" { print $1, $2 }' datafile - 2번 필드가 "CT" 문자와 같으면 1, 2 번 필드 출력
    + awk '$7 < 5 { print $4, $7}' datafile - 7번 필드가 5보다 작다면 4번, 7번 필드 출력
    + awk '$6 > .9 { print $1, $6}' datafile - 6번 필드가 .9 보다 크다면 1번, 6번 출력


## **getopt , getopts**
   + ### getopt - 명령어 라인에 입력으로 옵션이 조합으로 입력되는 경우 사용,옵션 해석 작업을 쉽게 도와줌 (*$getopt option optstring parameter*)
   + short 옵션을 처리
   + option에 사용할 옵션들을 나열하고 콜론으로 구분 해 준다음, optrting에 사용할 옵션들과 파라메터를 정의
   + 현재의 옵션과 파라메터값을 getopt명령의 출력 형식으로 바꾸는 방법 - set 명령에서 더블 데쉬(--) 변수를 getopt로 변경 -> 명령어에 입력되는 옵션과 파라메터는 getopt 명령어 형식으로 처리
 
 
 + ### getopts - getopt는 발견 된 모든 처리 된 옵션 및 매개 변수에 대해 하나의 출력을 생성하지만 
    이와 달리 getopts 명령은 기존 쉘에서 파라메터들을 순차적으로 처리
      + $getopts optstring variable -optstring에 유효한 옵션 문자들을 나열하고, 이 옵션들이 파라메터값을 필요로 하는 경우 콜론으로 구분, getopt명령에서 -q 옵션과 같이 에러 메세지를 없애기 위해 콜론으로 시작
      
      + getopts는 2개의 환경변수 
      
      
      + 표준 옵션들


   |Option|Description|
   |:---:|:---:|
   |-a|Show all objects|
   |-c|Produce a count|
   |-d|Specify a directory|
   |-e|Ecpand an object|
   |-f|Specify a file to read data from|
   |-h|Display a help message for the command|
   |-i|Ignore text case|
   |-l|Produce a long format version of the output|
   |-n|Use a non-interactibe (batch) mode|
   |-0|Specify an output file to redirect all output to|
   |-q|Run in quiet mode|
   |-r|Process directories and files recursively|
   |-s|Run in silent mode|
   |-v|Produce verbose output|
   |-x|exclude and object|
   |-y|Answer yes to all quetions|


 
    
