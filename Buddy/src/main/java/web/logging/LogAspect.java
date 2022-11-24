package web.logging;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component	//스프링빈으로 등록하기 [ component-scan 등록 필요, <annotation-driven /> 필요 ]
@Aspect		//AspectJ관리를 받도록 설정하기 [ <aop:aspectj-autoproxy /> 필요 ]
public class LogAspect {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Before("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))")
	public void logBefore(JoinPoint joinPoint) {
		logger.debug("##### {} 시작", joinPoint.getSignature().toShortString());
	}
	
	@After("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))")
	public void logAfter(JoinPoint joinPoint) {
		logger.debug("##### {} 종료", joinPoint.getSignature().toShortString());
	}
	
	
}
