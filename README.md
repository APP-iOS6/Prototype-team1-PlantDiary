# App Icon
![AppIcon](https://github.com/user-attachments/assets/95e77acb-f7e4-4911-a524-0e90d8ebda3f)

# Plant Diary
나의 일기에서 묻어나온 감정을 AI에게 분석시켜 나온 결과에 따라 자라나는 식물을 관리하는 앱

# 주요기능
- 로그인, 아웃 기능
- 일기 작성 기능
- 감정 분석 기능
- 일기, 감정 분석 결과 날짜별로 관리 기능
- 식물 관리 기능

# 작동환경
- (Xcode: 15.4)
- (iOS: 17.5)

# 개발자
- 신현우
- 이소영
- 이주노
- 김종혁

# Progress
<img src = "https://github.com/user-attachments/assets/7c91b587-c10a-4281-b940-7ce89abd1037">

<img src = "https://github.com/user-attachments/assets/7be5f68d-ade2-41fc-a52f-72afba6348d2">

<img src = "https://github.com/user-attachments/assets/9531d0d5-012d-4c7f-bb51-717b424afcc6">

# Advice (feat. Other Team)

- 다이어리에서 글을 작성하면 해당 날짜에 글을 작성했다는 표시가 나타났으면 함.

- 다른 식물마다 테마 색이 바뀌나요?

- 감정 분석 결과에서 sheet가 뜨는데, 창 닫는 버튼이 ‘새로고침’이기에 빼거나 혹은 바꿔주셨으면 합니다.

- 감정 분석 결과에서 (창 닫는)버튼이 오른쪽 위에 있었으면 한다.

- 식물관리에서 식물 사진 어떻게 바꿀 수 있나?

- 작성한 글에다가 암호를 걸었으면 좋을 것같다.

- 로그아웃 버튼 색상이 너무 빨개요.


### 해결 순위

1. 다이어리에서 글을 작성하면 해당 날짜에 글을 작성했다는 표시가 나타났으면 함.

2. 감정 분석 결과에서 sheet가 뜨는데, 창 닫는 버튼이 ‘새로고침’이기에 빼거나 혹은 바꿔주셨으면 합니다. 

3. 로그아웃 버튼 색상이 너무 빨개요.


### 해결

- 감정 분석 결과에서 sheet가 뜨는데, 창 닫는 버튼이 ‘새로고침’이기에 빼거나 혹은 바꿔주셨으면 합니다.
    -> 새로고침 버튼을 제거했습니다.
    
- 다이어리에서 글을 작성하면 해당 날짜에 글을 작성했다는 표시가 나타났으면 함.
    -> ✔️ 표시가 나타나게 했습니다. 

- 감정 분석 결과에서 (창 닫는)버튼이 오른쪽 위에 있었으면 한다.
    -> sheet로 화면을 구성하였기에 버튼을 전부 없앴습니다. (슬라이드로 화면 닫기)
    
- 로그아웃 버튼 색상이 너무 빨개요.
    -> 로그아웃 버튼 색상을 뒷 배경색에 고려하여 변경하였습니다.

<hr>

# UX Feedback (feat. Tuna)

- 앱 실행 시 인트로 약 3초간 뜨는데, 의미가 없다면 일단 빼는 게 좋다. 
  보통 통신이 일어나는 시간을 대체하기위해 보여준다. 
  사람들의 기억은 앱을 하면서 느끼는데, 저런 인트로는 시간을 뺏는 부분일 수도 있다.

<br>
<img src="https://github.com/user-attachments/assets/cd9c4416-e00c-483c-be00-cb624828460c">

<br>

- 글 왼쪽 여백이 의도하겠금 만든 게 아니라면, 레이아웃이 실수한 것처럼 보일 수 있다.

- 특정 버튼을 통해 로그인 화면으로 이동해야지, 아니라면 좀 이상하다. (바탕에 다 씌우지말 것.)

- 일지작성에서 저장할 때 (확인)알림을 띄우지 말것.

- alert은 정말 경고? 느낌으로 쓰는 거지 자주 쓰는 것이 아니다. & 일지 작성 취소버튼 같은 경우 쓴다( 저장 안하면 데이터가 삭제될 수 있으니 사용)
<br>

<img style="margin-left: 30px;" width="200" src = "https://github.com/user-attachments/assets/aec60410-aeb9-44be-adeb-bdd4b999c322">
<br>

- alert에서 확인 → 로그아웃(빨간색)으로 바꾼다.
  그리고 로그아웃한 후 또 alert이 뜨게하지 말 것

<br>

- 탭바 레이블 작게

- 날짜 행간 자간보다 넓게
  
- Alert 멘트 추가
  
- 이 전 년도 데이터 추가
  
- 동작 버튼 간격 조절
  
- 로그아웃 시 색깔과 로그아웃 관련 레이블 사용 

<hr>

# 실행 화면

![Simulator Screen Recording - iPhone 15 Pro - 2024-08-28 at 17 53 36](https://github.com/user-attachments/assets/cd089c94-aa48-410e-8c50-0eeb5eb94d5f)

# 디자인 툴
https://excalidraw.com/#room=f3f033323989d12153c3,lC9DcBrM-lRSFE7e-gjknQ


# 라이선스
Licensed under the [MIT](LICENSE) license.
