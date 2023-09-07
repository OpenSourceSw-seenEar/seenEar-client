# 2023 공개 SW 개발자대회 출품작 seenEAR

![image](https://github.com/OpenSourceSw-seenEar/seenEar-back/assets/85864699/a816a430-748b-4ccb-933d-1d6601fce4c9)

## 🔮 seenEAR 개발 목적

seenEAR는 **다양한 고민거리로 고통 받는 청년**과 **고독과 무위고로 고통받는 노인**을 이어줌으로써 청년들에게는 고민해결과 삶의 지혜 제공을, 노인들에게는 청년들과 소통함으로써 삶의 소소한 행복을 주는 것을 목표로 한다.

---

## 🔮 Service Flow

- 서비스는 청년 버전과 노인 버전이 나뉘어 있는데 서비스 로그인시 청년/노인 중 역할을 선택할 수 있다.

![image](https://github.com/OpenSourceSw-seenEar/seenEar-back/assets/85864699/2b50f7ec-ea22-4424-a5bf-ddc2fa9347bd)

![image](https://github.com/OpenSourceSw-seenEar/seenEar-back/assets/85864699/c7c01b0c-5ffa-47ef-ab38-5dd259690658)

- 청년은 고민이 있으면  아래 9가지 고민중 하나를 선택하여 그에 해당하는 노인의 조언을 구할 수 있다.
- 텍스트를 치기 불편한 노인들을 위해 음성녹음만으로 조언카드를 남길 수 있다.
- 노인이  조언 타입만 선택하면 고민 타입은 AI 서버가 9가지 고민 카테고리 중 하나로 자동으로 분류해준다.

![image](https://github.com/OpenSourceSw-seenEar/seenEar-back/assets/85864699/93b72ca9-dabe-4207-b7c4-0439c45e6a1d)


- 청년은 노인과 채팅하며 고민 상담을 하고 노인이 주는 조언 카드가 서비스의 핵심 기능이다.

![image](https://github.com/OpenSourceSw-seenEar/seenEar-back/assets/85864699/f6dc1dea-1f2f-4a59-a1dc-4edf9ba4b775)

- 노인은 본인의 삶의 지혜를 조언카드를 통해 전달할 수 있다.
- 청년은 노인에게 조언을 받고 감사카드를 음성녹음 또는 텍스트로 남길 수 있다.
- 이후 노인은 자신이 받은 감사카드를 텍스트 파일 버전, 음성파일 버전 함께 열람해볼 수 있다.

![image](https://github.com/OpenSourceSw-seenEar/seenEar-back/assets/85864699/9f470a61-d297-4b46-8de9-7ca9414b40ce)

---

### 🔮 기술 스택

**FrontEnd**

- Flutter - 3.13.1 / Dart : 3.1.0

**Backend**

- Springboot 2.7.14
- java 11
- intelliJ ultimate
- MySQL
- 배포 : AWS EC2, Docker, Github Actions

---

### 🔮 시스템 구성 및 아키텍쳐

**프론트엔드 아키텍쳐**

- 빠르고 동일한 코드로 Android, iOS 유저 모두를 만족할 수 있는 프레임워크 Flutter를 이용해 서비스 구현
- MVVM 아키텍처 적용
    - 각 View, ViewModel, Model은 항상 BaseView / BaseViewModel / BaseModel을 상속받게 하여 각각의 Base Code을 만들고, 해당 Base를 상속 받도록 구현
    - 1개의 View에는 1개의 ViewModel이 존재하도록 1대1 대응되도록 서비스 구현해 View에서는 항상 실제 사용자에게 보여지는 화면만 바뀌도록 하여, 관심사 분리를 의도
- Feature First Project Structure 적용
    - 각 Feature 별로 View / ViewModel / Service / Model 을 분리하여 Clean Code를 지향
    - 서비스의 주요한 로직은 core로 분리하여 제작
- 상태 관리 라이브러리 Provider
    - 필요한 경우에만 해당 View를 rebuild 및 React에서 겪는 Prop drilling 문제 해결
- API 호출 라이브러리 Dio
    - interceptor를 추가하여 손쉬운 디버깅과 빠른 서비스 구현에 초점을 맞춤

**백엔드 아키텍쳐**

- 헥사고날 아키텍처로 구성
- 비즈니스 로직, 데이터베이스, 외부 서비스와의 통신, 사용자 인터페이스 사이의 의존성을 분리하여 설계해, 유지보수에 용이하도록 하였다.
- AWS Polly(TTS) 와 OpenAI Whisper API (STT) 같은  외부 어댑터가 추가돼서 호출하기에 코드의 가독성과 유지보수를 위해 핵사고날 아키텍처를 도입하였다.
- Docker + GithubActions CI/CD 적용으로 더 편하고 효율적으로 배포할 수 있도록 파이프라인을 구축하였다.
- 아래는 감사카드를 텍스트, 음성으로 변환하는 헥사고날 아키텍처 예시

![image](https://github.com/OpenSourceSw-seenEar/seenEar-back/assets/85864699/244a2a2d-cf9f-4a9b-befe-1ab4d435d1bd)

**소프트웨어 아키텍쳐**


![image](https://github.com/OpenSourceSw-seenEar/seenEar-back/assets/85864699/5b76afac-6a3a-4943-af16-44cb34069edb)


### 🔮 앱을 만든 사람들

| 기획 | 디자인 | 프론트엔드 | 프론트엔드 | 백엔드 | AI |
| --- | --- | --- | --- | --- | --- |
| 정유빈 | 임세현 | 심상현 | 최상원 | 이정민 | 장환곤 |
