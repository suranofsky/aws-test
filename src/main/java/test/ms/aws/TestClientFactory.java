package test.ms.aws;

import org.folio.edge.core.utils.OkapiClientFactory;

import io.vertx.core.Vertx;

public class TestClientFactory extends OkapiClientFactory {

	  public TestClientFactory(Vertx vertx, String okapiURL, long reqTimeoutMs) {
	    super(vertx, okapiURL, reqTimeoutMs);
	  }

	  public TestClient getNcipOkapiClient(String tenant) {
	    return new TestClient(vertx, okapiURL, tenant, reqTimeoutMs);
	  }
	}
