package test.ms.aws;


import org.folio.edge.core.EdgeVerticle;
import org.folio.edge.core.utils.OkapiClientFactory;
import org.apache.log4j.Logger;
import io.vertx.ext.web.Router;
import io.vertx.core.http.HttpMethod;
import io.vertx.ext.web.handler.BodyHandler;


public class MainVerticle extends EdgeVerticle {
	
	  private static final Logger logger = Logger.getLogger(MainVerticle.class);

	  public MainVerticle() {
	    super();
	  }

	  @Override
	  public Router defineRoutes() {
		  
		TestClientFactory ocf = new TestClientFactory(vertx, okapiURL, reqTimeoutMs);
		TestHandler testHandler = new TestHandler(secureStore, ocf);
	    Router router = Router.router(vertx);
	    router.route().handler(BodyHandler.create());
	    router.route(HttpMethod.POST, "/test/:apiKeyPath").handler(testHandler::helloWorld);
	    router.route(HttpMethod.POST, "/test").handler(this::handleHealthCheck);
        router.route(HttpMethod.GET, "/admin/health").handler(this::handleHealthCheck);
	    return router;
	  }

}