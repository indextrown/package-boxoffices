# ``BoxOffices``

영화진흥위원회에서 제공하는 API를 활용해 영화 관련 정보를 가져오는 스위프트 패키지

## Overview

BoxOffices는 [영화진흥위원회](https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do)에서 제공하는 API를 통해 영화 관련 정보들을 쉽게 가져올 수 있게 합니다.

### 재공하는 기능
현재 제공하는 기능은 다음과 깉습니다.
- 상위 10개 박스오피스 목록 가져오기

### 지원 버전
- Swift 6.1
- iOS 17+

> IMPORTANT: 사용 전 반드시 영화진흥위원회에서 API키를 발급받아야 합니다. 영화진흥위원화 > 로그인 > 키 발급/관리 

## 시작하기

[영화진흥위원회](https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do)에서 발급 받은 API 키를 가지고 `BoxOffice` 객체를 생성합니다.
```swift
extension BoxOffices {
    static var shared: BoxOffices {
        BoxOffices(apiKey: "{발급받은_API키}")
    }
}
```

## 주요기능

### 상위 10개 박스오피스 목록 가져오기

일일 상위 10개 박스오피스 정보를 가져옵니다. 자세한 내용은 <doc:FetchDailyTop10> 을 참고해주세요. // TODO: 문서링크

> NOTE: 당일의 순위가 아닌 전날의 순위정보를 가져옵니다. 

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
