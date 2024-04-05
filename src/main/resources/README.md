# Application.yml

해당 폴더는 스프링 부트를 실행할 때 관리해야하는 환경변수들을 가지고 있는 패키지입니다.

```yaml
server:
  port: 8761

eureka:
  instance:
    instance-id: 127.0.0.1
  client:
    fetch-registry: false
    register-with-eureka: false
    service-url:
      default-Zone: http://${eureka.instance.instance-id}:${server.port}
```

위 `yml`파일은 해당 서버에서 `security`에 숨겨져 있는 부분입니다. 반드시 해당 내용들이 있어야 서버가 정상적으로 동작합니다.