# NGINX HTTPS Deployment

NGINX와 Let's Encrypt를 사용하여 안전한 웹 서버 구축을 위한 리포지토리입니다.

## 시작하기

### 사전 요구 사항

-   Docker와 Docker Compose가 설치되어 있어야 합니다.
-   소유를 증명할 수 있는 도메인과 DNS 설정이 필요합니다.

### 설치

1. 이 리포지토리를 클론합니다.
2. `.env.example`을 새 파일 `.env`로 복사합니다.
3. `.env` 파일을 열고 이메일, 도메인 세부 정보 및 기타 구성 설정을 입력합니다.

## 사용 방법

1. `docker compose up` 스크립트를 실행하여 새로운 컨테이너를 실행합니다.
2. 그러면 `init-letsencrypt.sh` 스크립트 파일이 실행되어 SSL 인증서를 발급받습니다.
3. 이제 NGINX가 실행되어 HTTPS를 통해 도메인을 제공합니다.

### 파일 설명

-   `init-letsencrypt.sh`: Let's Encrypt에서 인증서를 가져오는 과정을 자동화하는 스크립트입니다.
-   `nginx.conf.template`: NGINX 서버의 구성 템플릿입니다.
-   `.env.example`: 예제 환경 파일입니다. 이것을 `.env`로 복사하고 세부 정보를 입력하세요.

### 자세한 단계

**환경 변수 설정**

`.env` 파일을 열고 값 업데이트:

-   `SERVER_EMAIL`: 이메일 주소.
-   `SERVER_DOMAIN_LIST`: SSL 인증서를 받고 싶은 도메인의 공백으로 구분된 목록 (예: "test.example.com api.example.com").
-   `SERVER_TEST_DOMAIN`: 테스트 도메인 이름.
-   `SERVER_TEST_PORT`: 테스트 서버의 포트 번호.
-   `SERVER_TEST_NAME`: 테스트 서비스의 이름.

**Let's Encrypt 초기화**

`init-letsencrypt.sh` 스크립트를 수동으로 실행해야 할 수도 있습니다. 이 스크립트는 다음 작업을 수행합니다:

-   기존 데이터를 확인하고 발견된 경우 대체를 위한 프롬프트를 제공합니다.
-   권장 TLS 매개변수를 다운로드합니다.
-   더미 인증서를 생성합니다.
-   NGINX를 시작합니다.
-   더미 인증서를 삭제합니다.
-   Let’s Encrypt 인증서를 요청합니다.
-   NGINX를 다시 로드합니다.

**NGINX 구성**

`nginx.conf.template` 파일은 NGINX 구성에 사용됩니다. 이 파일에는 포트 80 및 443에서 수신, 서버 이름, SSL 인증서 경로 및 프록시 패스 구성에 대한 설정이 포함되어 있습니다.

`nginx.conf.generate.sh`는 도커를 실행할 때 자동으로 실행되어 `nginx.conf` 파일을 생성합니다. 그러므로 수동으로 실행할 필요가 없습니다.

## 기여

이 프로젝트를 개선하려면 리포지토리를 포크하고 풀 리퀘스트를 제출해주세요.

## 팁

-   도메인이 올바른 서버 IP를 가리키고 있는지 확인하세요.
-   포트 80 및 443이 열려 있고 서버로 전달되는지 확인하세요.
-   테스트 목적으로 `init-letsencrypt.sh` 스크립트의 `staging` 변수를 설정하여 요청 제한을 피할 수 있습니다.

## 라이선스

이 프로젝트는 오픈 소스이며 [MIT 라이선스](LICENSE)에 따라 제공됩니다.

## 감사의 말

Let's Encrypt 커뮤니티와 이 프로젝트에 기여하는 모든 이에게 감사를 전합니다.

---

NGINX와 Let's Encrypt로 안전한 호스팅을 구성하세요
